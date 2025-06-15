<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;

use App\ProductReview;
use Illuminate\Support\Facades\Validator;

class ReviewController extends ResponseController
{
    public function review(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'product_id' => "required|exists:products,id",
            'user_id' => 'nullable|exists:users,id',
            'ratings' => 'required|in:1,2,3,4,5',
            'review' => 'required'
        ]);

        if($validator->fails()){
            $error = $validator->errors()->first();
            return $this->sendResponse('Error', $error, 404, 'send-error');
        }

        $data = new ProductReview();
        $data->product_id = $request->product_id;
        $data->user_id = $request->user_id;
        $data->ratings = $request->ratings;
        $data->review = $request->review;
        $data->save();
        
        return $this->sendResponse($data, 'Review Added Successfully.', 200, 'send-data');
    }
}
