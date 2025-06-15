<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;

use Auth;
use App\Wishlist;
use App\Product;

class WishListController extends ResponseController
{
    public function wishlist()
    {
        $user_id = Auth::user()->id;
        $wishlists = Wishlist::where('user_id', $user_id)->pluck('product_id')->toArray();
        
        $query = Product::with(['wishlist' => function ($q) use ($user_id){
                                    return $q->where('user_id', $user_id);
                                }, 'product_prices.cart' => function ($q) use ($user_id) {
                                        return $q->where('user_id', $user_id) ;
                                    },'category', 'features', 'specifications', 'images']);
        $query->whereIn('id', $wishlists);
        
        $products = $query->where('status', 'Active')->get();

        if(!$products){
            return $this->sendResponse([], 'No products added as wishlist', 200, 'send-data');
        }

        return $this->sendResponse($products, 'Wishlist Retrived Successfully', 200, 'send-data');
    }

    public function addWishlist(Request $request)
    {

        $validator = Validator::make($request->all(), [
            'type' => 'required|in:True,False',
            'product_id' => 'required|exists:products,id'
        ]);

        if($validator->fails()){
            $error = $validator->errors()->first();
            return $this->sendResponse('Error', $error, 404, 'send-error');
        }

        $user_id = Auth::user()->id;
        $data = Wishlist::where('product_id', $request->product_id)->where('user_id', $user_id)->first();
        
        if(!$data){
            $new = new Wishlist();
            $new->user_id = $user_id;
            $new->product_id = $request->product_id;
            $new->save();
        }

        $success = "Product Added to wish List";

        if($request->type == 'False'){
            Wishlist::where('product_id', $request->product_id)->where('user_id', $user_id)->delete();
            $success = "Product Removed from wish List";
        }

        return $this->sendResponse([], $success, 200, 'send-data');
    }
}
