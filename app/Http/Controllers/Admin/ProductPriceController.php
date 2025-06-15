<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\ProductPrice;
use App\Product;
use App\Cart;
use Illuminate\Http\Request;
use Brian2694\Toastr\Facades\Toastr;

class ProductPriceController extends Controller
{
    public function update(Request $request)
    {   
        $count = ProductPrice::where('product_id', $request->id)->where('status', 'Active')->count();
        
        if($count <= 0){
            Product::where('id', $request->id)->update([
                'status' => 'Inactive'
            ]);
        }
        
        if($request->data){
            foreach($request->data as $data){
                if($data['id'] == '0'){
                    $new = new ProductPrice();
                    $new->product_id        = $data['product_id'];
                    $new->matrix1           = @$data['matrix1'] ? $data['matrix1'] : '';
                    $new->matrix2           = @$data['matrix2'] ? $data['matrix2'] : '';
                    $new->price             = $data['price'];
                    $new->offer_percentage  = $data['offer_percentage'] ? $data['offer_percentage'] : 0;
                    $new->offer_price       = $data['offer_price'] ? $data['offer_price'] : 0;
                    $new->start_date        = $data['start_date'];
                    $new->end_date          = $data['end_date'];
                    $new->retail_price      = $data['retail_price'];
                    $new->minimum_order     = $data['minimum_order'] ? $data['minimum_order'] : 1;
                    $new->weight            = $data['weight'];
                    $new->inventory         = $data['inventory'];
                    $new->display_order     = $data['display_order'];
                    $new->status            = $data['status'];
                    $new->save();
                }else{
                    $old = ProductPrice::find($data['id']);
                    $old->matrix1           = @$data['matrix1'] ? $data['matrix1'] : '';
                    $old->matrix2           = @$data['matrix2'] ? $data['matrix2'] : '';
                    $old->price             = $data['price'];
                    $old->offer_percentage  = $data['offer_percentage'] ? $data['offer_percentage'] : 0;
                    $old->offer_price       = $data['offer_price'] ? $data['offer_price'] : 0;
                    $old->start_date        = $data['start_date'];
                    $old->end_date          = $data['end_date'];
                    $old->retail_price      = $data['retail_price'];
                    $old->minimum_order     = $data['minimum_order'] ? $data['minimum_order'] : 1;
                    $old->weight            = $data['weight'];
                    $old->inventory         = $data['inventory'];
                    $old->display_order     = $data['display_order'];
                    $old->status            = $data['status'];
                    $old->save();
                }
            }
        }

        // Update offer_expiry_date in cart
        $carts = Cart::where('product_id', $request->id)->get();
        foreach ($carts as $cart) {
            $product = Product::where('id', $cart->product_id)->first();
            $product_price = ProductPrice::where('id', $cart->product_price_id)->first();

            $offer = false;
            if($product_price->offer_percentage){
                $date = strtotime(date("Y-m-d"));
                $start_date = strtotime($product_price->start_date);
                $end_date = strtotime($product_price->end_date);
                if($date >= $start_date && $date <= $end_date){
                    $price = $product_price->offer_price;
                    $offer = true;
                }else{
                    $price = $product_price->price;
                }
            }else{
                $price = $product_price->price;
            }

            if($cart->price != $price){
                $weight = $product_price->weight ? $product_price->weight : 0;
                $offer_price = $offer ? $product_price->offer_price : 0;
                $offer_expiry_date = $offer ? $product_price->end_date : null; 
                $quantity = $cart->quantity;
                $amount = $price * $quantity;
                $gst_percent = $product->gst;
                $gst_amount = ($gst_percent * $amount) / 100;
    
                $cart = Cart::find($cart->id);
                $cart->price = $price;
                $cart->offer_price = $offer_price;
                $cart->offer_expiry_date = $offer_expiry_date;
                $cart->weight = $weight;
                $cart->quantity = $quantity;
                $cart->amount = $amount;
                $cart->total_weight = $weight * $quantity;
                $cart->gst_percent = $gst_percent;
                $cart->gst_amount = $gst_amount;
                $cart->save();
            }

        }

        Toastr::success('Product Price Updated');
        $page = $request->input('page') ?? 1;
        // return redirect(route('product.edit', [ 'id' => $request->id, 'tab' => 'price' ]));

        return redirect()->route('product.edit', [
        'id' => $request->id,
        'tab' => 'price',
        'page' => $page, // Include the page parameter in the redirect
    ])->with('success', 'Product price updated successfully.');
    }

    public function delete($id, Request $request)
    {
        $product_id = ProductPrice::where('id', $id)->value('product_id');
        ProductPrice::where('id', $id)->delete();
        Toastr::success('Product Price Deleted');
        $page = $request->input('page') ?? 1;
        // return redirect(route('product.edit', [ 'id' => $product_id, 'tab' => 'price' ]));
        return redirect()->route('product.edit', [
        'id' => $product_id,
        'tab' => 'price',
        'page' => $page, // Include the page parameter in the redirect
    ])->with('success', 'Product price delete successfully.');
    }
}
