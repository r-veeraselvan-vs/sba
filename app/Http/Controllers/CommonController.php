<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Mail;

class CommonController extends Controller
{
    public function aboutUs()
    {
        return view('customer.front.about-us');
    }

    public function contactUs()
    {
        return view('customer.front.contact-us');
    }

    public function sendContact(Request $request)
    {   
        $url = 'https://www.google.com/recaptcha/api/siteverify';
        $remoteip = $_SERVER['REMOTE_ADDR'];
        $data = [
                'secret' => '6LcOoQAbAAAAAOS40fTnTnKOer6ez7jkZ77Oq36Q',
                'response' => $request->get('recaptcha')
              ];
        $options = [
                'http' => [
                  'header' => "Content-type: application/x-www-form-urlencoded\r\n",
                  'method' => 'POST',
                  'content' => http_build_query($data)
                ]
            ];
        $context = stream_context_create($options);
        $result = file_get_contents($url, false, $context);
        $resultJson = json_decode($result);
        if ($resultJson->success != true) {
                return back()->withErrors(['captcha' => 'ReCaptcha Error']);
        }
        
        if ($resultJson->score >= 0.3) {
            $data['name'] = $request->name;
            $data['email'] = $request->email;
            $data['message'] = $request->message;
            
            Mail::send('email/contact', compact('data'), function($q) use ($data){
                    $q->to('admin@directfarms.biz', 'No Reply')
                            ->subject('New Message from ' . ucfirst($data['name']));
                    $q->from('directfarms.tech@directfarms.biz','Direct Farms Tech');
                });

            return redirect(route('contact-us'))->with([
                'success' => 'We have received your enquiry. Our team will get back to you at the earliest. Thank you.'
            ]);    
        } else {
            return back()->withErrors(['captcha' => 'ReCaptcha Error']);
        }
        
    }

    public function privacyPolicy()
    {
        return view('customer.front.privacy-policy');
    }

    public function refundPolicy()
    {
        return view('customer.front.refund-policy');
    }

    public function termsConditions()
    {
        return view('customer.front.terms-conditions');
    }
}
