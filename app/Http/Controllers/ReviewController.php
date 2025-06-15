<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Redirect;
use App\ProductReview;
use App\Product;
use Auth;

class ReviewController extends Controller
{
    public function review(Request $request)
    {
        $review = new ProductReview();
        $review->product_id = $request->product_id;
        $review->user_id = (Auth::user()) ? Auth::user()->id : null;
        $review->ratings = $request->ratings;
        $review->review = $request->review;
        $review->status = 'Active';
        $review->save();

        $average_ratings = ProductReview::where('product_id', $request->product_id)->where('status', 'Active')->avg('ratings');

        Product::where('id', $request->product_id)->update([
            'average_ratings' => floor($average_ratings)
        ]);

        return Redirect::back()->with([
            'success' => 'Comments added successfully',
            'tab' => 'review'
        ]);
    }
}
