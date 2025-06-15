<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\ProductReview;
use App\Product;
use Brian2694\Toastr\Facades\Toastr;

class ReviewController extends Controller
{
    public function list()
    {
        $reviews = ProductReview::orderBy('id', 'desc')->get();

        return view('admin.reviews.review_list')->with([
            'reviews' => $reviews
        ]);
    }

    public function delete($product_id, $id)
    {
        $reviews = ProductReview::where('id', $id)->delete();

        $average_ratings = ProductReview::where('product_id', $product_id)->where('status', 'Active')->avg('ratings');

        Product::where('id', $product_id)->update([
            'average_ratings' => floor($average_ratings)
        ]);
        Toastr::success('Reviews Removed Successfully');
        return redirect(route('review.list'));
    }

    public function update($product_id, $id, $status)
    {
        $reviews = ProductReview::where('id', $id)->update([
            'status' => $status
        ]);

        $average_ratings = ProductReview::where('product_id', $product_id)->where('status', 'Active')->avg('ratings');

        Product::where('id', $product_id)->update([
            'average_ratings' => floor($average_ratings)
        ]);
        Toastr::success('Reviews Updated Successfully');
        return redirect(route('review.list'));
    }
}
