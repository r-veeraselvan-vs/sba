<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\User;
use Carbon\Carbon;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\Mail;

class OtpController extends ResponseController
{
    public function generateOtp($otp_type, $user_id)
    {
        $user = User::where('id', $user_id)->first();
        $otp = $this->getOTP();

        if($otp_type == 'email'){
            $name = $user->name;
            $email = $user->email;
            User::where('id', $user_id)->update([
                'email_otp' => $otp
            ]);
            Mail::send('email/email_otp', compact('name', 'otp'), function($message) use ($email, $name) {
                $message->to($email, ucfirst($name))
                        ->subject('DirectFarm OTP');
                $message->from('directfarms.tech@gmail.com','DirectFarm');
            });
            return $this->sendResponse([], 'OTP send to your email, Kindly check and verify.', 200, 'send-response');
        }elseif($otp_type == 'mobile'){
            if($user){
                // OTP Functionality
                $minutes = 10;
                $email = $user->email;
                
                $key = config('app.sms_key');
                $templateId = config('app.sms_template_id');

                $client = new \GuzzleHttp\Client();
                $url = "http://site.ping4sms.com/api/smsapi?key=".$key."&route=2&sender=DIRFAM&number=".$user->mobile."&sms=".$otp." is your Direct Farms verification code. Valid for next ".$minutes." minutes. Please do not share this OTP.&templateid=".$templateId;
                $data = $client->get($url);
                $response = $data->getBody();
                
                User::where('email', $email)->update([
                    'mobile_otp' => $otp,
                    'mobile_otp_expired_at' => date("Y-m-d H:i:s", Carbon::now()->addMinutes($minutes)->timestamp)
                ]);
                // OTP Functionality
                return $this->sendResponse([], 'OTP send to your mobile, Kindly check and verify.', 200, 'send-response');
            }else{
                return $this->sendResponse([], 'Your mobile number is not valid. If its new Kindly register new account.', 404, 'send-response');
            }
        }else{
            return $this->sendResponse([], 'Invalid OTP Type', 404, 'send-response');
        }
    }

    public function verifyOtp(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'user_id' => 'nullable|exists:users,id',
            'otp' => "required",
            'otp_type' => "required|in:email,mobile"
        ]);

        if($validator->fails()){
            $error = $validator->errors()->first();
            return $this->sendResponse('Error', $error, 404, 'send-error');
        }

        if($request->otp_type == 'email'){
            $otp = User::where('id', $request->user_id)->value('email_otp');
            if($otp == $request->otp){
                User::where('id', $request->user_id)->update([
                    'email_otp' => '',
                    'is_email_verified' => 'Yes',
                    'status' => 'active'
                ]);
                return $this->sendResponse([], 'OTP Verified Successfully.', 200, 'send-response');
            }else{
                return $this->sendResponse([], 'Invalid OTP, Try with right one.', 404, 'send-response');
            }
        }elseif($request->otp_type == 'mobile'){
            $otp = $request->otp;
            $user = User::where('id', $request->user_id)->where('mobile_otp', $otp)->first();
            if($user){
                // OTP Expired
                $expired = false;
                if($user->mobile_otp_expired_at < date("Y-m-d H:i:s", Carbon::now()->timestamp)){  
                    $expired = true;
                }
                // OTP Expired

                if(!$expired){
                    User::where('id', $request->user_id)->update([
                        'is_mobile_verified' => 'Yes'
                    ]);
                    return $this->sendResponse([], 'OTP Verified Successfully.', 200, 'send-response');
                }else{    
                    return $this->sendResponse([], 'Your OTP is expired. Kindly resend and try again.', 404, 'send-response');
                }

            }else{
                return $this->sendResponse([], 'Enter valid OTP.', 404, 'send-response');
            }
        }else{
            return $this->sendResponse([], 'Invalid OTP Type', 404, 'send-response');
        }
    }
}
