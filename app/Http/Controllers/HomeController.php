<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class HomeController extends Controller
{
    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        $this->middleware('auth');
    }

    /**
     * Show the application dashboard.
     *
     * @return \Illuminate\Contracts\Support\Renderable
     */
    public function index()
    {
        return view('home');
    }
    
    public function userlogout(Request $request) {
    
        $email  = \Auth::user()->email;
        \Auth::logout();
        return redirect()->intended('https://shribalajibharatgas.in/web/autologin?email='.$email.'&api_token=token');
}

}
