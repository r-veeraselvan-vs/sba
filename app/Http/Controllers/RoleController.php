<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Auth;
use Session;

class RoleController extends Controller
{
    public function redirectRoutes()
    {
        // if(Auth::user()->is_verified == 0){
        //     return redirect('/unverified-logout');
        // }
        
        if (Auth::user()->role != 'Customer')
        {
            return redirect('admin/dashboard');
        }
        elseif(Auth::user()->role == 'Customer')
        {
            if(Session::get('checkout') == true){
                return redirect(route('cart.order.place'));
            }
            return redirect('customer/profile');
        }
        return redirect('/');
    }
}
