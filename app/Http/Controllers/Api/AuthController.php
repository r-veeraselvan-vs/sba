<?php

namespace App\Http\Controllers\Api;

use App\Customer;
use App\Http\Controllers\Controller;
use App\Http\Controllers\Api\ResponseController as ResponseController;
use App\User;
use Carbon\Carbon;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Mail;
use Illuminate\Support\Facades\Validator;
use App\DeviceToken;
use App\Cart;
use App\SocialAccount;
use Socialite;
use Session;
use App\OTP;

class AuthController extends ResponseController
{

    public function sendOTP(Request $request)
{
    $validator = Validator::make($request->all(), [
        'mobile' => 'required|string',
    ]);

    if ($validator->fails()) {
        $error = $validator->errors()->first();
        return $this->sendResponse('Error', $error, 404, 'send-error');
    }

    // Your OTP generation logic
    $otp = $this->generateOTP();

    // Static values for gateway-related fields
    $sender_id = 'MADKAD';
    $template_id = '1707171895193841185'; // Assuming this is the correct template ID
    $template_title = 'SBA'; // Adjust as per your requirement
    $campaign_name = 'OTP'; // Adjust as per your requirement
    $message = urlencode("Your one time password (OTP) is $otp . Please enter OTP to log in to Madurai Kadai.");

    // Constructing the URL for the TEXTSPEED API
    $url = "https://sms.textspeed.in/vb/apikey.php?apikey=AJiyLYtANuKhPfSB&senderid=$sender_id&templateid=$template_id&number={$request->mobile}&message=$message&template_title=$template_title&campaign_name=$campaign_name";

    // Initiating cURL request
    $ch = curl_init($url);
    curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
    $output = curl_exec($ch);
    curl_close($ch);

    // Check for errors
    if ($output === false) {
        // Handle error
        $error = 'Error: ' . curl_error($ch);
        return $this->sendResponse('Error', $error, 500, 'send-error');
    } else {
        // Assuming TEXTSPEED API returns a success response
        // Store OTP and mobile number in the database
        OTP::create([
            'mobile' => $request->mobile,
            'otp' => $otp,
            'expires_at' => now()->addMinutes(10)
        ]);

        return $this->sendResponse([], 'OTP sent successfully', 200, 'send-data');
    }
}

public function verifyOTP(Request $request)
{
    // Validate request parameters
    $validator = Validator::make($request->all(), [
        'mobile' => 'required|string',
        'otp' => 'required|string',
        'device_type' => 'nullable|in:Android,iOS,Web',
        'device_token' => 'nullable',
        'device_name' => 'nullable',
        'device_id' => 'nullable'
    ]);

    if ($validator->fails()) {
        $error = $validator->errors()->first();
        return $this->sendResponse('Error', $error, 404, 'send-error');
    }

    $otpEntry = OTP::where('mobile', $request->mobile)
                    ->where('expires_at', '>', now())
                    ->orderBy('created_at', 'desc')
                    ->first();

    \Log::info('Request OTP: ' . $request->otp);
    \Log::info('Stored OTP: ' . ($otpEntry ? $otpEntry->otp : 'not found'));

    if (!$otpEntry) {
        \Log::error('Failed to retrieve OTP from database.');
        return $this->sendResponse('Error', 'OTP not found or expired.', 401, 'send-error');
    }

    $requestOtp = trim($request->otp);
    $storedOtp = trim($otpEntry->otp);

    if ($requestOtp !== $storedOtp) {
        $error = 'Incorrect OTP';
        return $this->sendResponse('Error', $error, 401, 'send-error');
    }

    // Retrieve user details
    $user = User::where('mobile', $request->mobile)->first();
    // If user doesn't exist, return response indicating new user
    if (!$user) {
        $mobile = $request->mobile;
        $otp = $request->otp;

        return $this->sendResponse([
            'new_user' => true,
            'mobile' => $mobile,
            'otp' => $otp
        ], 'Cant find this user in Database', 200, 'send-data');
    }

    // Generate access token
    $token = $user->createToken('token')->accessToken;

    // Update device token if provided
    if ($request->filled('device_token') && $request->filled('device_type')) {
        DeviceToken::updateOrCreate(
            ['user_id' => $user->id, 'device_type' => $request->device_type, 'device_name' => $request->device_name],
            ['device_token' => $request->device_token, 'status' => 'Login']
        );
    }
    
    $response = [
        'message' => 'Login successful',
        'new_user' => false,
        'user' => $user,
        'access_token' => $token
    ];
    
    // Delete OTP entry from database
    $otpEntry->delete();
    
    // Prepare response
    $data = User::where('mobile', $request->mobile)->first();
    $data['access_token'] = $token;
    return $this->sendResponse($data, 'Login successful', 200, 'send-data');
}

    public function signup(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'name' => "required|string",
            'email' => "required|email|unique:users",
            'mobile' => "required|string",
        ]);

        if($validator->fails()){
            $error = $validator->errors()->first();
            return $this->sendResponse('Error', $error, 404, 'send-error');
        }

        $user = new User();
        $user->name = $request->name;
        $user->email = $request->email;
        $user->mobile = $request->mobile;
        $user->status = 'Inactive';
        $user->save();

        // Send OTP via TEXTSPEED API
        $otp = $this->generateOTP();
        
       // Static values for gateway-related fields
        $sender_id = 'MADKAD';
        $template_id = '1707171895193841185'; // Assuming this is the correct template ID
        $template_title = 'SBA'; // Adjust as per your requirement
        $campaign_name = 'OTP'; // Adjust as per your requirement
        $message = urlencode("Your one time password (OTP) is $otp . Please enter OTP to log in to Madurai Kadai.");
    
        // Constructing the URL for the TEXTSPEED API
        $url = "https://sms.textspeed.in/vb/apikey.php?apikey=AJiyLYtANuKhPfSB&senderid=$sender_id&templateid=$template_id&number={$request->mobile}&message=$message&template_title=$template_title&campaign_name=$campaign_name";

        // Initiating cURL request
        $ch = curl_init($url);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
        $output = curl_exec($ch);
        curl_close($ch);

        // Check for errors
        if ($output === false) {
            // Handle error
            $error = 'Error: ' . curl_error($ch);
            return $this->sendResponse('Error', $error, 500, 'send-error');
        } else {
            // Assuming TEXTSPEED API returns a success response
            // Store OTP and mobile number in session
            Session::put('signup_mobile', $user->mobile);
            Session::put('signup_otp', $otp);
        }

        // Generate access token
        $token = $user->createToken('token')->accessToken;

        // Update device token if provided
        if ($request->filled('device_token') && $request->filled('device_type')) {
            $device = DeviceToken::updateOrCreate(
                ['user_id' => $user->id, 'device_type' => $request->device_type, 'device_name' => $request->device_name],
                ['device_token' => $request->device_token, 'status' => 'Login']
            );
        }

        $data = User::where('id', $user->id)->first();
        $data['access_token'] = $token;
        return $this->sendResponse($data, 'Registered Successfully', 200, 'send-data');
    }

    public function editProfile(Request $request)
    {
        // Find user by ID
        $user = User::find($request->id);

        // Check if user exists
        if (!$user) {
            return $this->sendResponse('Error', 'User not found', 404, 'send-error');
        }

        // Validation rules
        $validator = Validator::make($request->all(), [
            'name' => 'sometimes|required|string',
            'email' => 'sometimes|required|email',
            'mobile' => 'sometimes|required|string',
            'device_token' => 'sometimes|string',
            'device_type' => 'sometimes|string',
            'device_name' => 'sometimes|string',
        ]);

        // Check for validation errors
        if ($validator->fails()) {
            $error = $validator->errors()->first();
            return $this->sendResponse('Error', $error, 404, 'send-error');
        }

        // Update user details
        if ($request->filled('name')) {
            $user->name = $request->name;
        }
        if ($request->filled('email')) {
            $user->email = $request->email;
        }
        if ($request->filled('mobile')) {
            $user->mobile = $request->mobile;
        }

        // Save updated user details
        $user->save();

        // Update device token if provided
        if ($request->filled('device_token') && $request->filled('device_type')) {
            $device = DeviceToken::updateOrCreate(
                ['user_id' => $user->id, 'device_type' => $request->device_type, 'device_name' => $request->device_name],
                ['device_token' => $request->device_token, 'status' => 'Login']
            );
        }

        // Return updated user data
        $data = User::where('id', $user->id)->first();
        return $this->sendResponse($data, 'Profile Updated Successfully', 200, 'send-data');
    }

    private function generateOTP()
    {
        // Generate a random OTP (for example, a 6-digit code)
        return rand(100000, 999999);
    }

    public function login(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'email' => 'required|string|email|exists:users,email',
            'password' => 'required',
            'device_type' => 'nullable|in:Android,iOS,Web',
            'device_token' => 'nullable',
            'device_name' => 'nullable',
            'device_id' => 'nullable'
        ]);

        if($validator->fails()){
            $error = $validator->errors()->first();
            return $this->sendResponse('Error', $error, 404, 'send-error');
        }

        $credentials = request(['email', 'password']);
        if(!Auth::attempt($credentials)){
            $error = "Invalid Email or Password";
            return $this->sendResponse('Error', $error, 404, 'send-error');
        }
        // Create Token
        $user = $request->user();
        $token =  $user->createToken('token')->accessToken;
		//$token =  'adhoctoken';

        // Update device token and device type
        $user = User::where('email', $request->email)->first();

        // Device token update
        $device_token = $request->device_token;
        $device_type = $request->device_type;
        $device_name = $request->device_name;
        $user_id = $user->id;
        
        if($device_token && $device_type){
            $device = DeviceToken::where('user_id', $user_id)
                ->where('device_type', $device_type)
                ->where('device_name', $device_name)
                ->first();
            if($device){
                DeviceToken::where('user_id', $user_id)
                    ->where('device_type', $device_type)
                    ->where('device_name', $device_name)
                    ->update([
                        'device_token' => $device_token,
                        'status' => 'Login'
                    ]);
            }else{
                $new = new DeviceToken();
                $new->user_id = $user_id;
                $new->device_type = $device_type;
                $new->device_token = $device_token;
                $new->device_name = $device_name;
                $new->status = 'Login';
                $new->save();
            }
        }
        // Device token update

        // Merge Cart
        if(Auth::user() && $request->has('device_id')){
            $user_id = Auth::user()->id;
            Cart::where('session_id', $request->device_id)->update([
                'session_id' => null,
                'user_id' => $user_id,
            ]);
        }

        $data = User::where('email', $request->email)->first();

        $data['access_token'] = $token;
        return $this->sendResponse($data, 'Login Successfully', 200, 'send-data');
    }
     
    public function forgotPassword(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'email' => 'required|email|exists:users,email'
        ]);

        if($validator->fails()){
            $error = $validator->errors()->first();
            return $this->sendResponse('Error', $error, 404, 'send-error');
        }

        $user = User::where('email', $request->email)->first();

        // E-mail otp
            $otp = $this->getOTP();
            $minutes = 10;
            $name = $user->name;
            $email = $user->email;
            User::where('id', $user->id)->update([
                'email_otp' => $otp
            ]);
            // Mail::send('email/email_otp', compact('name', 'otp'), function($message) use ($email, $name) {
            //    $message->to($email, ucfirst($name))
            //             ->subject('OTP to reset your password');
            //    $message->from('directfarms.tech@gmail.com','DirectFarm');
            // });
		// Mobile OTP
            $key = config('app.sms_key');
            $templateId = config('app.sms_template_id');

            $client = new \GuzzleHttp\Client();
            $url = "http://site.ping4sms.com/api/smsapi?key=".$key."&route=2&sender=DIRFAM&number=".$user->mobile."&sms=".$otp." is your Direct Farms verification code. Valid for next ".$minutes." minutes. Please do not share this OTP.&templateid=".$templateId;
            $data = $client->get($url);
            $response = $data->getBody();
            
                
        // Mobile OTP

        return $this->sendResponse([], 'Kindly check mobile for OTP', 200, 'send-data');

    }

    public function resetPassword(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'email' => 'required|email|exists:users,email',
            'password' => 'required',
            'email_otp' => 'required'
        ]);

        if($validator->fails()){
            $error = $validator->errors()->first();
            return $this->sendResponse('Error', $error, 404, 'send-error');
        }
        $email_otp = User::where('email', $request->email)->value('email_otp');
        if($email_otp == $request->email_otp){
            User::where('email', $request->email)->update([
                'password' => Hash::make($request->password),
                'email_otp' => ''
            ]);
            return $this->sendResponse([], 'Password Updated', 200, 'send-response');
        }else{
            $error = "Invalid OTP";
            return $this->sendResponse([], $error, 404, 'send-error');

        }

    }

    public function changePassword(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'email' => 'required|email|exists:users,email',
            'password' => 'required',
            'new_password' => 'required|min:4',
            'confirm_password' => 'required|same:new_password'
        ]);

        if($validator->fails()){
            $error = $validator->errors()->first();
            return $this->sendResponse([], $error, 404, 'send-error');
        }

        $hashedPassword = User::where('email', $request->email)->first();
        if ($hashedPassword && Hash::check($request->password, $hashedPassword->password)) {
            $hashedPassword->password = Hash::make($request->new_password);
            $hashedPassword->save();

            return $this->sendResponse([], 'Password Changed', 200, 'send-data');
        } else {
            $error = "Invalid Password";
            return $this->sendResponse([], $error, 404, 'send-error');
        }
        
    }
	
	public function deviceLogout(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'user_id' => 'required|exists:users,id',
            'device_type' => 'required|in:Android,iOS',
            'device_name' => 'required'
        ]);

        if($validator->fails()){
            $error = $validator->errors()->first();
            return $this->sendResponse('Error', $error, 404, 'send-error');
        }
        // Logout Status Change
            DeviceToken::where('user_id', $request->user_id)
                ->where('device_type', $request->device_type)
                ->where('device_name', $request->device_name)
                ->update([
                    'status' => 'LogOut'
                ]);
        // Logout Status Change
        if(Auth::user()){
            $user = Auth::user()->token();
            $user->revoke();
            return $this->sendResponse([], 'You are Logged out Successfully', 200, 'send-response');
        }else{
            return $this->sendResponse([], 'Session Logged out Already', 200, 'send-response');
        }
    }

    public function socialLogin(Request $request) {

        $validator = Validator::make($request->all(), [
            'email' => 'required|string|email',
            'device_type' => 'nullable|in:Android,iOS,Web',
            'device_token' => 'nullable',
            'device_name' => 'nullable',
            'device_id' => 'nullable',
            'provider' => 'required|in:google,facebook',
            'access_token' => 'required'
        ]);

        if($validator->fails()){
            $error = $validator->errors()->first();
            return $this->sendResponse('Error', $error, 404, 'send-error');
        }

        $provider = $request->input('provider');
        switch($provider){
            case SocialAccount::SERVICE_FACEBOOK:
                $social_user = Socialite::driver(SocialAccount::SERVICE_FACEBOOK)->fields([
                    'name', 
                    'first_name', 
                    'last_name', 
                    'email'
                ]);
                break;
            case SocialAccount::SERVICE_GOOGLE:
                $social_user = Socialite::driver(SocialAccount::SERVICE_GOOGLE)->stateless()
                ->scopes(['profile','email']);
                break;
            default :
                $social_user = null;
        }
        if($social_user == null){
            return $this->sendResponse('Error', 'Provider missing', 404, 'send-error');
        }
        
        $social_user_details = $social_user->userFromToken($request->input('access_token'));
    
        if($social_user_details == null){ //|| $fb_user->id != $request->input('userID')
            return $this->sendResponse('Error', 'Invalid credentials', 404, 'send-error');
        }
    
        $account = SocialAccount::where("provider_id",$social_user_details->id)
                ->where("provider_name",$provider)
                ->with('user')->first();

        $token = '';
    
        if($account){
            $token = $this->issueToken($account->user);
        }
        else { 
            // create new user and social login if user with social id not found.
            $user = User::where("email",$social_user_details->getEmail())->first();

            if(!$user){  
                // create new social login if user already exist.
                $user = new User;
                switch($provider){
                    case SocialAccount::SERVICE_FACEBOOK:
                        $user->name = $social_user_details->user['first_name'].' '.$social_user_details->user['last_name'];
                        break;
                    case SocialAccount::SERVICE_GOOGLE:
                        $user->name = $social_user_details->user['name'];
                        break;
                    default :
                }            
                $user->email = $social_user_details->getEmail();
                $user->password = Hash::make('social');
                $user->save();
            }
            $social_account = new SocialAccount;
            $social_account->provider_name = $provider;
            $social_account->provider_id = $social_user_details->id;
            $user->social_accounts()->save($social_account);

            $token = $this->issueToken($user);
        }

        // Device token update
        $user = User::where('email', $request->email)->first();

        $device_token = $request->device_token;
        $device_type = $request->device_type;
        $device_name = $request->device_name;
        $user_id = $user->id;

        if($device_token && $device_type){
            $device = DeviceToken::where('user_id', $user_id)
                ->where('device_type', $device_type)
                ->where('device_name', $device_name)
                ->first();
            if($device){
                DeviceToken::where('user_id', $user_id)
                    ->where('device_type', $device_type)
                    ->where('device_name', $device_name)
                    ->update([
                        'device_token' => $device_token,
                        'status' => 'Login'
                    ]);
            }else{
                $new = new DeviceToken();
                $new->user_id = $user_id;
                $new->device_type = $device_type;
                $new->device_token = $device_token;
                $new->device_name = $device_name;
                $new->status = 'Login';
                $new->save();
            }
        }

        // Device token update
        $data = User::where('email', $request->email)->first();

        $data['access_token'] = $token;
        return $this->sendResponse($data, 'Social-Login Successfully', 200, 'send-data');

    } 
    
    private function issueToken(User $user) {
        $userToken = $user->token() ?? $user->createToken('socialLogin');
        return $userToken->accessToken;
    }

    public function mobileUpdate(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'user_id' => 'required|exists:users,id',
            'mobile' => 'required'
        ]);

        if($validator->fails()){
            $error = $validator->errors()->first();
            return $this->sendResponse('Error', $error, 404, 'send-error');
        }

        $user = User::where('id', $request->user_id)->first();

        // Mobile otp
          /*  $otp = $this->getOTP();
            $minutes = 10;
            $name = $user->name;
            $email = $user->email;
            User::where('id', $user->id)->update([
                'mobile_otp' => $otp,
                'mobile' => $request->mobile,
                'mobile_otp_expired_at' => date("Y-m-d H:i:s", Carbon::now()->addMinutes($minutes)->timestamp)
            ]);
            
            $key = config('app.sms_key');
            $templateId = config('app.sms_template_id');

            $client = new \GuzzleHttp\Client();
            $url = "http://site.ping4sms.com/api/smsapi?key=".$key."&route=2&sender=DIRFAM&number=".$user->mobile."&sms=".$otp." is your Direct Farms verification code. Valid for next ".$minutes." minutes. Please do not share this OTP.&templateid=".$templateId;
            $data = $client->get($url);
            $response = $data->getBody();*/
            
                
        // Mobile OTP
        $data = User::where('id', $request->user_id)->first();

        return $this->sendResponse($data, 'Mobile Number Updated. Kindly check your mobile for Verification OTP.', 200, 'send-data');
    }
    
}
