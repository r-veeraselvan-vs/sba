<?php

namespace App\Http\Middleware;

use App\Wishlist;
use App\Cart;
use Closure;
use Auth;
use Session;

class Customer
{
    /**
     * Handle an incoming request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \Closure  $next
     * @return mixed
     */
    public function handle($request, Closure $next)
    {
        if(request()->segment(2) == 'wishlist' && !Auth::check()){
            Session::put('wishlist', request()->segment(3));
        }

        if(Auth::check() && Auth::user()->isRole() == 'Customer')
        {
            if(Auth::user()){
                $user_id = Auth::user()->id;
                $session_id = Session::get('session_id');
                Cart::where('session_id', $session_id)->update([
                    'session_id' => null,
                    'user_id' => $user_id,
                ]);
                
                // Add wish List
                if(Session::get('wishlist') != '' && Session::get('wishlist') != null){
                    $new = new Wishlist();
                    $new->user_id = $user_id;
                    $new->product_id = Session::get('wishlist');
                    $new->save();

                    Session::put('wishlist', null);
                    return redirect(route('customer.wishlist'))->with([
                        'success' => 'Product added in wishlist'
                    ]);
                }
            }

            return $next($request);
        }
        return redirect('login');
    }
}
