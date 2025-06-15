<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;

use App\ProductPrice;
use App\Cart;
use App\Order;
use App\Address;
use App\DeliveryArea;
use App\Customer;
use Auth;

class CartController extends ResponseController
{
    public function getCart(Request $request)
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
        $data['cart_count'] = $this->getUserCart($user_id, $device_id, true);
        $data['cart_total'] = $this->getUserCartTotal($user_id, $device_id);
        $data['minimum_order'] = $this->getMinimumOrderAmount();
        $data['cart'] = $this->getUserCart($user_id, $device_id, false);
        
        return $this->sendResponse($data, 'Cart Listed Successfully.', 200, 'send-data');
    }

    public function addCart(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'device_id' => 'required',
            'user_id' => 'nullable|exists:users,id',
            'product_id' => 'required|exists:product_prices,product_id',
            'product_price_id' => 'required|exists:product_prices,id',
            'quantity' => 'required|integer|min:1',
            'type' => "required|in:Cart,Booking"
        ]);
        
        if($validator->fails()){
            $error = $validator->errors()->first();
            return $this->sendResponse('Error', $error, 404, 'send-error');
        }

        $user_id = $request->user_id;
        $device_id = $request->device_id;
        $product_id = $request->product_id;
        $product_price_id = $request->product_price_id;
        $quantity = $request->quantity;

        $product_price = ProductPrice::with('product')->where('product_id', $product_id)
                    ->where('id', $product_price_id)->first();

        // Check Inventory
        if($quantity > $product_price->inventory){
            $error = "Currently Unavailable, Product is out of stock.";
            return $this->sendResponse('Error', $error, 404, 'send-error');
        }

        if(!$product_price){
            $error = "Invalid product id or product price id";
            return $this->sendResponse('Error', $error, 404, 'send-error');
        }

        // Check Offer Expiry Date
        $this->checkOfferExpiryDate();

        $offer = false;
        if($product_price->offer_percentage){
            $date = strtotime(date("Y-m-d"));
            $start_date = strtotime($product_price->start_date);
            $end_date = strtotime($product_price->end_date);
            if($date >= $start_date && $date <= $end_date){
                $offer = true;
            }
        }

        $weight = $product_price->weight ? $product_price->weight : 0;
        $offer_price = $product_price->offer_price ? $product_price->offer_price : 0;
        $price = $offer ? $offer_price : $product_price->price; 
        $offer_expiry_date = $offer ? $product_price->end_date : null; 
        $amount = $price * $quantity;
        $gst_percent = $product_price->product->gst;
        $gst_amount = ($gst_percent * $amount) / 100;

        $query = Cart::where('product_id', $product_id);

        if($user_id){
            $query->where('user_id', $user_id);
        }else{
            $query->where('session_id', $device_id);
        }
        $cart = $query->first();

        if($cart){

            // Update Cart
            if($quantity > 0){
                $cart = Cart::find($cart->id);
                $cart->session_id = $device_id;
                $cart->user_id = $user_id;
                $cart->product_id = $product_id;
                $cart->product_price_id = $product_price_id;
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

            if($quantity == 0){
                Cart::where('id', $cart->id)->delete();
            }

            $message = "Updated in cart successfully";
        }else{
            
            // Add Cart
            $cart = new Cart;
            $cart->session_id = $device_id;
            $cart->user_id = $user_id;
            $cart->product_id = $product_id;
            $cart->product_price_id = $product_price_id;
            $cart->price = $price;
            $cart->offer_price = $offer_price;
            $cart->offer_expiry_date = $offer_expiry_date;
            $cart->weight = $weight;
            $cart->quantity = $quantity;
            $cart->amount = $price * $quantity;
            $cart->total_weight = $weight * $quantity;
            $cart->gst_percent = $gst_percent;
            $cart->gst_amount = $gst_amount;
            $cart->save();

            $message = "Added in cart successfully";
        }
        
        $data = [];
            if ($request->type == 'Booking') {
                $order = Order::where('user_id', $user_id)->where('status', 'Created')->first();

                $query = Cart::with('product.category', 'product.subcategory', 'product_price')->where('user_id', $user_id);
                $sub_total = $query->sum('amount');
                $tax = $query->sum('gst_amount');
                // $tax = 0;
                $items = count($query->get());
                $promo_code_id = null;
                $order_id = $order->id;

                // Minimum Order Amount Calculation
                $shipping_charge = 0;
                $address_id = $order->address_id;
                $minimum_order_amount = $this->getMinimumOrderAmount();
                if (($sub_total < $minimum_order_amount) && $address_id) {
                    $postcode = Address::where('id', $address_id)->value('postcode');
                    $shipping_excluded = Customer::where('user_id', $user_id)->value('shipping_excluded');

                    if ($postcode && $shipping_excluded != 'Yes') {
                        $delivery_charge = DeliveryArea::where('pin_code', $postcode)->value('delivery_charge');
                        $shipping_charge = $delivery_charge ? $delivery_charge : 0;
                    }
                    // dd($shipping_charge);
                }
                // $net_amount = $sub_total + $shipping_charge;

                $discount_amount = 0;
                $discount_percent = 0;

                // Check if this is the first order
        $is_first_order = Order::where('user_id', $user_id)->where('status', '!=', 'Cancelled')->count() == 1 && Order::where('user_id', $user_id)->where('status', 'Created')->count() == 1;

                $first_order_discount_percent = $is_first_order ? 10 : 0; // Assuming 10% discount for the first order
                $first_order_discount_amount = $sub_total * ($first_order_discount_percent / 100);
                $net_amount = $is_first_order ? ($sub_total + $shipping_charge - $first_order_discount_amount) : $sub_total + $shipping_charge;

                // Update Order
                $this->updateCalculation($order_id, $net_amount, $tax, $shipping_charge, $promo_code_id, $discount_percent, $discount_amount, $sub_total, $items);

                $data['first_order_discount_percent'] = $first_order_discount_percent ?? 0;
                $data['first_order_discount_amount'] = $first_order_discount_amount ?? 0;
                $data['is_first_order'] = $is_first_order ? "True" : "False";
                $data['net_amount'] = $net_amount;  

                $data['order'] = Order::with('address', 'delivery_slot')->where('id', $order_id)->first();
                $data['minimum_order'] = $this->getMinimumOrderAmount();
                $data['cart'] = $query->get();
            } else {

                $data['cart_count'] = $this->getUserCart($user_id, $device_id, true);
                $data['cart_total'] = $this->getUserCartTotal($user_id, $device_id);
                $data['minimum_order'] = $this->getMinimumOrderAmount();
                $data['cart'] = Cart::with('product.category', 'product.subcategory', 'product_price')->where('id', $cart->id)->first();
            }

        return $this->sendResponse($data, $message, 200, 'send-data');
    }

    public function removeCart(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'device_id' => 'required',
            'user_id' => 'nullable|exists:users,id',
            'cart_id' => 'required|exists:carts,id',
            'type' => "required|in:Cart,Booking"
        ]);

        if($validator->fails()){
            $error = $validator->errors()->first();
            return $this->sendResponse('Error', $error, 404, 'send-error');
        }

        $user_id = $request->user_id;
        $device_id = $request->device_id;

        // Check Valid Cart or Not
        if($user_id){
            $data = Cart::where('id', $request->cart_id)->where('user_id', $user_id)->first();
        }else{
            $data = Cart::where('id', $request->cart_id)->where('session_id', $device_id)->first();
        }

        // Delete Cart
        if($data){
            Cart::where('id', $request->cart_id)->delete();
        }else{
            return $this->sendResponse('Error', 'Invalid Cart ID', 404, 'send-error');
        }


        // Get Details
        $query = Cart::orderBy('id', 'asc');
        if($user_id){
            $query->where('user_id', $user_id);
        }else{
            $query->where('session_id', $device_id);
        }
        $cart = $query->first();

        $data = [];
        if($request->type == 'Booking'){
            $order = Order::where('user_id', $user_id)->where('status', 'Created')->first();
            
            $query = Cart::with('product.category', 'product.subcategory', 'product_price')->where('user_id', $user_id);
            $sub_total = $query->sum('amount');
            $tax = $query->sum('gst_amount');
            // $tax = 0;
            $items = count($query->get());
            $promo_code_id = null;
            $order_id = $order->id;
            
            // Minimum Order Amount Calculation
            $shipping_charge = 0;
            $address_id = $order->address_id;
            $minimum_order_amount = $this->getMinimumOrderAmount();
            if(($sub_total < $minimum_order_amount) && $address_id){
                $postcode = Address::where('id', $address_id)->value('postcode');
                $shipping_excluded = Customer::where('user_id', Auth::user()->id)->value('shipping_excluded');

                if($postcode && $shipping_excluded != 'Yes'){
                    $delivery_charge = DeliveryArea::where('pin_code', $postcode)->value('delivery_charge');
                    $shipping_charge = $delivery_charge ? $delivery_charge : 0;
                }
                // dd($shipping_charge);
            }
            // $net_amount = $sub_total + $shipping_charge;        
            
            $discount_amount = 0; 
            $discount_percent = 0;

            // Check if this is the first order
        $is_first_order = Order::where('user_id', $user_id)->where('status', '!=', 'Cancelled')->count() == 1 && Order::where('user_id', $user_id)->where('status', 'Created')->count() == 1;
        
            $first_order_discount_percent = $is_first_order ? 10 : 0; // Assuming 10% discount for the first order
            $first_order_discount_amount = $sub_total * ($first_order_discount_percent / 100);
            $net_amount = $is_first_order ? ($sub_total + $shipping_charge - $first_order_discount_amount) : $sub_total + $shipping_charge;

            // Update Order
            $this->updateCalculation($order_id, $net_amount, $tax, $shipping_charge, $promo_code_id, $discount_percent, $discount_amount, $sub_total, $items);

            $data['first_order_discount_percent'] = $first_order_discount_percent ?? 0;
            $data['first_order_discount_amount'] = $first_order_discount_amount ?? 0;
            $data['is_first_order'] = $is_first_order ? "True" : "False";
            $data['net_amount'] = $net_amount;  

            $data['order'] = Order::with('address', 'delivery_slot')->where('id', $order_id)->first();
            $data['minimum_order'] = $this->getMinimumOrderAmount();
        	$data['cart'] = $query->get();
        }else{

            $data['cart_count'] = $this->getUserCart($user_id, $device_id, true);
            $data['cart_total'] = $this->getUserCartTotal($user_id, $device_id);
			$data['minimum_order'] = $this->getMinimumOrderAmount();
        }
        return $this->sendResponse($data, 'Cart Removed Successfully', 200, 'send-data');
    }
}
