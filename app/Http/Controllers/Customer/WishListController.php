<?php

namespace App\Http\Controllers\Customer;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Auth;
use App\Wishlist;
use Illuminate\Support\Facades\Redirect;

class WishListController extends Controller
{
    public function add($product_id, $type)
    {
        $user_id = Auth::user()->id;
        $data = Wishlist::where('product_id', $product_id)->where('user_id', $user_id)->first();
        
        if(!$data){
            $new = new Wishlist();
            $new->user_id = $user_id;
            $new->product_id = $product_id;
            $new->save();
        }

        $success = "Product Added to wish List";

        if($type == 'false'){
            Wishlist::where('product_id', $product_id)->where('user_id', $user_id)->delete();
            $success = "Product Removed from wish List";
        }

        return Redirect::back()->with([
            'success' => $success
        ]);
    }
}
