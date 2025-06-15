<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\MobileBanner;
use App\Category;
use App\Address;
use App\ProductReview;
use App\Product;
use Illuminate\Support\Facades\Validator;

class HomeScreenController extends ResponseController
{

    public function getHomeScreen(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'device_id' => 'required',
            'user_id' => 'nullable|exists:users,id'
        ]);

        if($validator->fails()){
            $error = $validator->errors()->first();
            return $this->sendResponse('Error', $error, 404, 'send-error');
        }

        $user_id = $request->user_id;
        $device_id = $request->device_id;
        $data = [];

        $data['addresses'] = $this->getAddress($user_id);
        $data['cart_count'] = $this->getUserCart($user_id, $device_id, true);
        $data['categories'] = Category::where('status', 'Active')->get();
        $data['offers'] = Product::with(['category', 'subcategory', 'product_prices.cart' => function ($q) use ($user_id, $device_id) {
                                        return $user_id ? $q->where('user_id', $user_id) : $q->where('session_id', $device_id) ;
                                    }, 'wishlist' => function ($q) use ($user_id){
                                        return $q->where('user_id', $user_id);
                                    }])
							->where('is_offer', 'Yes')
							->orderBy('updated_at', 'desc')
							->take(6)
							->get();
        $data['top_sellings'] = Product::with(['category', 'subcategory', 'product_prices.cart' => function ($q) use ($user_id, $device_id) {
                                        return $user_id ? $q->where('user_id', $user_id) : $q->where('session_id', $device_id) ;
                                    }, 'wishlist' => function ($q) use ($user_id){
                                        return $q->where('user_id', $user_id);
                                    }])
							->where('is_top_selling', 'Yes')
							->orderBy('updated_at', 'desc')
							->take(6)
							->get();
        $data['top_banners'] = MobileBanner::where('type', 'Top')->orderBy('display_order', 'asc')->where('status', 'Active')->get();
        $data['middle_banners'] = MobileBanner::where('type', 'Middle')->orderBy('display_order', 'asc')->where('status', 'Active')->get();
        $data['reviews'] = ProductReview::with('user')->orderBy('id', 'desc')->take(5)->get();

        return $this->sendResponse($data, 'Home Screen Data Listed Successfully', 200, 'send-data');
    }
}
