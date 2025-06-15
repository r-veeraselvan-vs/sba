<?php

namespace App\Http\Controllers\Auth;

use App\Http\Controllers\Controller;
use App\Providers\RouteServiceProvider;
use Illuminate\Foundation\Auth\AuthenticatesUsers;
use Session;
use Socialite;
use App\User;
use Illuminate\Http\Request;
use Auth;
use GuzzleHttp\Client;
use Illuminate\Support\Facades\Validator;

class LoginController extends Controller
{
    /*
    |--------------------------------------------------------------------------
    | Login Controller
    |--------------------------------------------------------------------------
    |
    | This controller handles authenticating users for the application and
    | redirecting them to your home screen. The controller uses a trait
    | to conveniently provide its functionality to your applications.
    |
    */

    use AuthenticatesUsers;

    /**
     * Where to redirect users after login.
     *
     * @var string
     */
    protected $redirectTo = '/role';

    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        Session::put('form', 'login');
        $this->middleware('guest')->except('logout');
    }

    public function redirectToProvider(string $provider)
    {
        try {
            $scopes = config("services.$provider.scopes") ?? [];
            if (count($scopes) === 0) {
                return Socialite::driver($provider)->redirect();
            } else {
                return Socialite::driver($provider)->scopes($scopes)->redirect();
            }
        } catch (\Exception $e) {
            return redirect('login')->withErrors([ 'error' => $e]);
        }
    }

    public function handleProviderCallback(string $provider)
    {
        try {
            $data = Socialite::driver($provider)->user();
            
            return $this->handleSocialUser($provider, $data);
        } catch (\Exception $e) { 
            // dd($e);
            return redirect('login')->withErrors(['authentication_deny' => 'Login with '.ucfirst($provider).' failed. Please try again.']);
        }
    }

    public function handleSocialUser(string $provider, object $data)
    {
        $user = User::where([
            "social" => $data->id,
        ])->first();
        if (!$user) {
            $user = User::where([
                'email' => $data->email,
            ])->first();
        }
        if (!$user) {
            return $this->createUserWithSocialData($provider, $data);
        }
        $user->social = $user->social;
        $user->login_type = 'Social';
        $user->save();
        return $this->socialLogin($user);
    }

    public function createUserWithSocialData(string $provider, object $data)
    {
        try {
            $user = new User;
            $user->name = $data->name;
            $user->email = $data->email;
            $user->social = $data->id;
            $user->login_type = 'Social';
            // Check support verify or not
            if ($user instanceof MustVerifyEmail) {
                $user->markEmailAsVerified();
            }
            $user->save();
            return $this->socialLogin($user);
        } catch (Exception $e) {
            return redirect('login')->withErrors(['authentication_deny' => 'Login with '.ucfirst($provider).' failed. Please try again.']);
        }
    }

    public function socialLogin(User $user)
    {
        auth()->loginUsingId($user->id);
        return redirect($this->redirectTo);
    }

    public function emailLogin()
    {
        return view('auth.email_login');
    }

    public function otpLogin()
    {
        return view('auth.otp_login');
    }

    public function sendOTP(Request $request)
    {
        // Your code to generate OTP
        $otp = $this->generateOTP();

        // Your code to send OTP to the provided mobile number
        $mobile = $request->input('mobile');
        $minutes = 10; // Change as needed

        // Your API credentials and template ID
        $key = config('app.sms_key');
        $templateId = config('app.sms_template_id');

        // Form the URL for the API request
        $url = "http://site.ping4sms.com/api/smsapi?key=$key&route=2&sender=DIRFAM&number=$mobile&sms=$otp is your Direct Farms verification code. Valid for next $minutes minutes. Please do not share this OTP.&templateid=$templateId";

        // Create a GuzzleHttp client
        $client = new Client();

        // Make the GET request to the SMS API
        $response = $client->get($url);

        // After sending OTP, store the mobile number and OTP in the session for verification
        Session::put('otp_mobile', $mobile);
        //Session::put('otp', $otp);
        Session::put('otp', '1234');


        // Redirect to the verification page
        return redirect()->back();
    }

    private function generateOTP()
    {
        // Generate a random OTP (for example, a 6-digit code)
        return rand(100000, 999999);
    }

    public function verifyOTP(Request $request)
    {
        // Your code to verify the OTP
        $inputOTP = $request->input('otp');
        $storedOTP = Session::get('otp');

        // Check if the input OTP matches the stored OTP
        if ($inputOTP == $storedOTP) {
            // OTP is verified
            // Check if the mobile number exists in the database
            $mobile = Session::get('otp_mobile');
            $user = User::where('mobile', $mobile)->first();
            //dd($user);

            if ($user) {
                Session::put('otp_mobile', $mobile);
                //Session::put('otp', $otp);
                Session::put('otp', '1234');

                // Mobile number already exists, redirect to 'otp.login';
                return redirect()->route('otplogin.new')->with([
                    'mobile' => $request->mobile,
                    'otp' => $request->otp
                ]);
            } else {
                // Mobile number does not exist, set session variable and redirect back

                Session::put('otp_mobile', $mobile);
                //Session::put('otp', $otp);
                Session::put('otp', '1234');

                Session::put('mobile_exists', false);
                return redirect()->back()->with('mobile', $mobile);
            }
        } else {

            Session::put('otp_mobile', $mobile);
            //Session::put('otp', $otp);
            Session::put('otp', '1234');

            // Incorrect OTP, redirect back with an error message
            return redirect()->back()->with('error', 'Incorrect OTP. Please try again.');
        }
    }

    public function loginNew(Request $request)
    {
        $request->validate([
            'email' => 'required|email|exists:users,email',
            'password' => 'required'
        ]);

        $credentials = $request->only('email', 'password');

        if (Auth::attempt($credentials)) {
            User::where('email', $request->email)->update([
                'login_type' => 'Web'
            ]);
            return redirect(route('role'));
        }else{
            return redirect(route('login'))->with([
                'error' => "Invalid Credentials."
            ]);
        }
    }
    public function otpLoginNew(Request $request)
    {
        // Retrieve OTP mobile number and OTP from session
        $otpMobile = Session::get('otp_mobile');
        $otp = Session::get('otp');

        // Check if session data is available
        if (!$otpMobile || !$otp) {
            // If session data is not available, redirect back with an error
            return redirect(route('login'))->with([
                'error' => "Session data not available."
            ]);
        }

        // // Validate the provided OTP mobile number and OTP against session data
        // $validator = Validator::make($request->all(), [
        //     'mobile' => 'required|numeric|exists:users,mobile|in:' . $otpMobile, // Ensure provided mobile matches the session mobile
        //     'otp' => 'required|in:' . $otp, // Ensure provided OTP matches the session OTP
        // ]);

        // if ($validator->fails()) {
        //     // If validation fails, redirect back with errors
        //     return redirect(route('login'))->withErrors($validator)->withInput();
        // }

        // Retrieve user by mobile number
        $user = User::where('mobile', $otpMobile)->first();

        if (!$user) {
            // If user not found, redirect back with an error
            return redirect(route('login'))->with([
                'error' => "User not found."
            ]);
        }

        // Log in the user
        Auth::login($user);

        // Update user's login type
        $user->update(['login_type' => 'Web']);

        // Redirect user to the desired page after successful login
        return redirect(route('role'));
    }


}