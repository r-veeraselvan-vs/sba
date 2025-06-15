<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Category;
use App\Subcategory;
use App\Product;
use App\ProductPrice;
use Illuminate\Support\Facades\Validator;

class ProductController extends ResponseController
{

    public function getProducts(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'category_id' => "required|exists:categories,id",
            'subcategory_id' => "nullable|exists:subcategories,id",
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

        $data['cart_count'] = $this->getUserCart($user_id, $device_id, true);
        $data['minimum_order'] = $this->getMinimumOrderAmount();
        $data['categories'] = Category::where('status', 'Active')->get();
        $data['subcategories'] = Subcategory::where('status', 'Active')->where('category_id', $request->category_id)->get();


        $itemQuery = Product::with(['product_prices.cart' => function ($q) use ($user_id, $device_id) {
                                        return $user_id ? $q->where('user_id', $user_id) : $q->where('session_id', $device_id) ;
                                    }, 'wishlist' => function ($q) use ($user_id){
                                        return $q->where('user_id', $user_id);
                                    }]);
        if($request->category_id){
            $itemQuery->where('category_id', $request->category_id);
        }
        if($request->subcategory_id){
            $itemQuery->where('subcategory_id', $request->subcategory_id);
        }
        $data['products'] = $itemQuery->where('status', 'Active')->get();

        return $this->sendResponse($data, 'Products Listesd Successfully.', 200, 'send-data');
    }

    public function getProduct(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'product_id' => "required|exists:products,id",
            'device_id' => 'required',
            'user_id' => 'nullable|exists:users,id'
        ]);

        if($validator->fails()){
            $error = $validator->errors()->first();
            return $this->sendResponse('Error', $error, 404, 'send-error');
        }

        $user_id = $request->user_id;
        $device_id = $request->device_id;

        $itemQuery = Product::with(['category', 'subcategory', 'features', 'specifications', 'images', 'reviews.user', 'product_prices.cart' => function ($q) use ($user_id, $device_id) {
                        return $user_id ? $q->where('user_id', $user_id) : $q->where('session_id', $device_id) ;
                    },'wishlist' => function ($q) use ($user_id){
                        return $q->where('user_id', $user_id);
                    }]);
        $data = $itemQuery->where('id', $request->product_id)->first();
        
        return $this->sendResponse($data, 'Product Detail Retrived Successfully.', 200, 'send-data');
    }
}
