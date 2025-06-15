<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;

use App\Category;
use App\Subcategory;
use App\Product;

class SearchController extends ResponseController
{
    public function getHomeSearch(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'search' => 'required'
        ]);

        if($validator->fails()){
            $error = $validator->errors()->first();
            return $this->sendResponse('Error', $error, 404, 'send-error');
        }

        $search = $request->search;
        $data = [];

        $data['categories'] = Category::where('category', 'like', '%'.$search.'%')->where('status', 'Active')->get();
        $data['subcategories'] = Subcategory::with('category')->where('subcategory', 'like', '%'.$search.'%')->where('status', 'Active')->get();
        $data['products'] = Product::where('name', 'like', '%'.$search.'%')->with('category', 'subcategory', 'product_prices')->get();
       

        return $this->sendResponse($data, 'Home Screen Search Data Listed Successfully', 200, 'send-data');
    }
    
    public function getProductSearch(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'category_id' => "required|exists:categories,id",
            'subcategory_id' => "nullable|exists:subcategories,id",
            'search' => 'required',
            'device_id' => 'required',
            'user_id' => 'nullable|exists:users,id'
        ]);

        if($validator->fails()){
            $error = $validator->errors()->first();
            return $this->sendResponse('Error', $error, 404, 'send-error');
        }
        $search = $request->search;
        $user_id = $request->user_id;
        $device_id = $request->device_id;
        
        $data = [];

        $itemQuery = Product::where('name', 'like', '%'.$search.'%')
                    ->with(['category', 'subcategory', 'product_prices.cart' => function ($q) use ($user_id, $device_id) {
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

        return $this->sendResponse($data, 'Products Listed Successfully.', 200, 'send-data');
    }
}
