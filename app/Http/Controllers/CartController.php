<?php

namespace App\Http\Controllers;

use Brian2694\Toastr\Facades\Toastr;
use App\Cart;
use App\Order;
use App\Address;
use App\User;
use App\Customer;
use App\Product;
use App\DeliveryArea;
use App\DeliverySlot;
use App\PromoCode;
use App\Settings;
use Session;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Redirect;

class CartController extends Controller
{
    public function cart(){

        // Check Offer Expiry Date
        $this->checkOfferExpiryDate();

        $query = Cart::with('product');
        
        if(Auth::user()){
            $user_id = Auth::user()->id;
            $query->where('user_id', $user_id);
        }else{
            $session_id = Session::getId();
            $query->where('session_id', $session_id);
        }
        $carts = $query->get();
        
        return view('customer.front.cart')->with([
            'carts' => $carts
        ]); 
    }

    public function addCart(Request $request)
    {  
        $product_id = $request->product_id;
        // $weight = $request->weight ? $request->weight : 0;
        // $offer_price = $request->offer_price ? $request->offer_price : 0;
        // $price = ($offer_price > 0) ? $offer_price : $request->price; 
        // $offer_expiry_date = ($offer_price > 0) ? $request->offer_expiry_date : null; 
        // $quantity = $request->quantity;
        // $amount = $price * $quantity;
        // $product_price_id = $request->product_price_id;
        // $gst_percent = $request->gst;
        // $gst_amount = ($gst_percent * $amount) / 100;
        // Retrieve product data from the database using Eloquent
        $product = Product::findOrFail($product_id);

        // Now you have access to the product data
        $weight = $product->productPrice->price ? $product->productPrice->price : 0;
        $offer_price = $product->productPrice->offer_price ? $product->productPrice->offer_price : $product->productPrice->offer_price;
        $price = ($offer_price > 0) ? $offer_price : $product->mrp;
        $offer_expiry_date = ($offer_price > 0) ? $request->offer_expiry_date : null;
        $quantity = $request->quantity ? $request->quantity : 1;
        $amount = $price * $quantity;
        $product_price_id = $product->productPrice->id ? $product->productPrice->id : 0;
        $gst_percent = $request->gst ? $request->gst : $product->gst;
        $gst_amount = ($gst_percent * $amount) / 100;

        // dd($offer_expiry_date);
        
        $query = Cart::where('product_id', $product_id);

        if(Auth::user()){
            $user_id = Auth::user()->id;
            $session_id = null;
            $query->where('user_id', $user_id);
        }else{
            $user_id = null;
            $session_id = Session::getId();
            $query->where('session_id', $session_id);
        }

        $cart = $query->first();

        if($cart){

            // Update Cart
            if($quantity > 0){
                $cart = Cart::find($cart->id);
                $cart->session_id = $session_id;
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
            $cart->session_id = $session_id;
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

        $request->session()->flash('cart_updated', true);
        return Redirect::back()->with([
            'success' => $message
        ]);
    }

    public function removeCart($cart_id){
        Cart::where('id', $cart_id)->delete();

        return redirect(route('cart'))->with([
            'success' => 'Product Removed in cart successfully'
        ]);
    }

    public function plusOne($cart_id)
    {
        $cart = Cart::where('id', $cart_id)->first();

        $quantity = $cart->quantity + 1;
        $weight = $cart->weight;
        $price = $cart->price;

        $total_weight = $weight * $quantity;
        $amount = $quantity * $price;

        $gst_amount = ($cart->gst_percent * $amount) / 100;

        Cart::where('id', $cart_id)->update([
            'quantity' => $quantity,
            'total_weight' => $total_weight,
            'amount' => $amount,
            'gst_amount' => $gst_amount
        ]);
        return Redirect::back()->with([
            'success' => 'Cart updated successfully'
        ]);
    }

    public function minusOne($cart_id)
    {
        $cart = Cart::where('id', $cart_id)->first();

        $quantity = $cart->quantity - 1;
        $weight = $cart->weight;
        $price = $cart->price;
        
        $total_weight = $weight * $quantity;
        $amount = $quantity * $price;
        
        $gst_amount = ($cart->gst_percent * $amount) / 100;

        Cart::where('id', $cart_id)->update([
            'quantity' => $quantity,
            'total_weight' => $total_weight,
            'amount' => $amount,
            'gst_amount' => $gst_amount
        ]);
        return Redirect::back()->with([
            'success' => 'Cart updated successfully'
        ]);
    }

    public function proceedCart()
    {
        // dd('proceedCart');
        Session::put('checkout', true);
        return redirect(route('cart.order.place'));
    }

    public function placeOrder()
    {
        $user_id = Auth::user()->id;
        $carts = Cart::where('user_id', $user_id)->get();
        $order = Order::where('user_id', $user_id)->where('status', 'Created')->first();

        $sub_total = $carts->sum('amount');
        $net_amount = $sub_total;
        
        if($order){
            Order::where('id', $order->id)->update([
                'items' => count($carts),
                'sub_total' => $carts->sum('amount'),
                'net_amount' => $net_amount
            ]);
        }else{
            $ord = new Order();
            $ord->user_id = $user_id;
            $ord->items = count($carts);
            $ord->sub_total = $sub_total;
            $ord->net_amount = $net_amount;
            $ord->delivery_date = date('Y-m-d');
            $ord->save();     
        }
        Session::put('checkout', false);
        return redirect(route('customer.address.select'));
    }
    
    public function selectAddress()
    {
        // dd('selectAddress');
        $addresses = Address::with('delivery_area.days')->where('user_id', Auth::user()->id)
            ->orderBy('id', 'desc')
            ->where('status', 'Active')
            ->get();
        return view('customer.back.address.select-address')->with([
            'addresses' => $addresses
        ]);
    }

    public function addAddress(Request $request)
    {
        $add = new Address();
        $add->user_id = Auth::user()->id;
        $add->short_name = $request->short_name;
        $add->building_name = $request->building_name;
        $add->route = $request->route;
        $add->address = $request->address;
        $add->city = $request->city;
        $add->postcode = $request->postcode;
        $add->latitude = $request->latitude;
        $add->longitude = $request->longitude;
        $add->save();
        
        return Redirect::back()->with([
            'success' => 'Address Added successfully'
        ]);

    }

    public function updateAdressAndFare($id)
    {
        $address = Address::where('id', $id)->first();

        // Shipping Address Calculations
        $postcode = $address->postcode;
        
        $delivery_area = DeliveryArea::where('pin_code', $postcode)->where('status', 'Active')->first();
        if($delivery_area){
            $order = Order::where('user_id', Auth::user()->id)->where('status', 'Created')->first();
            if ($order) {
                $sub_total = $order->sub_total;

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

                $discount_amount = $order->discount_amount;
                $tax = $order->tax;
                $net_amount = $sub_total - $discount_amount + $shipping_charge;

                Order::where('user_id', Auth::user()->id)->where('status', 'Created')->update([
                    'address_id' => $id,
                    'shipping_charge' => $shipping_charge,
                    'net_amount' => $net_amount
                ]);

                $order = Order::where('user_id', Auth::user()->id)->where('status', 'Created')->first();

                return redirect(route('customer.cart.summary', [ 'id' => $order->id ]));
            } else {
                return Redirect::back()->with([
                'error' => 'Order unavailable'
            ]);
            }
        }
        else{
            return Redirect::back()->with([
                'error' => 'Shipping unavailable to this location'
            ]);    
        }
        
    }

    public function summary(Request $request, $id)
    {
        // dd('summary');
        $query = Cart::with('product', 'product');
        
        if(Auth::user()){
            $user_id = Auth::user()->id;
            $query->where('user_id', $user_id);
        }else{
            $session_id = Session::getId();
            $query->where('session_id', $session_id);
        }
        $carts = $query->get();

        // Shipping Charge
        $order = Order::where('id', $id)->first();
        Session::put('order_id', $order->id);
        $sub_total = $order->sub_total;

        // Minimum Order Amount Calculation
        $shipping_charge = 0;
        $address_id = $order->address_id;
        $postcode = Address::where('id', $address_id)->value('postcode');
        $minimum_order_amount = $this->getMinimumOrderAmount();
        if(($sub_total < $minimum_order_amount) && $address_id){
            $shipping_excluded = Customer::where('user_id', Auth::user()->id)->value('shipping_excluded');
            if($postcode && $shipping_excluded != 'Yes'){
                $delivery_charge = DeliveryArea::where('pin_code', $postcode)->value('delivery_charge');
                $shipping_charge = $delivery_charge ? $delivery_charge : 0;
            }
            // dd($shipping_charge);
        }
        // $tax = $query->sum('gst_amount');
        $tax = 0;
        // $net_amount = $sub_total + $shipping_charge + $tax;        
                    // dd($shipping_charge);
        $net_amount = $sub_total + $shipping_charge; 
        // Prmomcode
        $discount_amount = 0;
        $promo_code_id = null;   
        $discount_percent = 0;
        $data = [];
        if($request->promo_code){            
            $data = $this->applyPromocode($request->promo_code, $net_amount);
            $data['promo_code'] = $request->promo_code;
            $discount_amount = $data['discount_amount'];
            $promo_code_id = $data['promo_code_id']; 
            $discount_percent = $data['discount_percent'];
            $net_amount = $net_amount - $discount_amount;
        }
        // Prmomcode

        Order::where('id', $id)->update([
            'tax' => $tax,
            'shipping_charge' => $shipping_charge,
            'net_amount' => $net_amount,
            'promo_code_id' => $promo_code_id,
            'discount_percent' => $discount_percent,
            'discount_amount' => $discount_amount
        ]);
        // Shipping Charge
        
        $order = Order::with('address.delivery_area.days')->where('id', $id)->first();
        $delivery_area_id = DeliveryArea::where('pin_code', $postcode)->value('id');
        $setting = Settings::first();
        
        if(Auth::user()->mobile == '' || Auth::user()->mobile == null){
            return view('customer.back.mobile')->with([
                'id' => $id
            ]);
        }else{       
                
            // Check Offer Expiry Date
            $this->checkOfferExpiryDate();
                
            return view('customer.back.summary')->with([
                'carts' => $carts,
                'order' => $order,
                'data' => $data,
                'upcomming_slots' => $this->getUpcommingSlots($order, $delivery_area_id),
                'online_payment' => $setting ? $setting->online_payment : 'No'
            ]);
        }
    }

    // public function summary(Request $request, $id)
    // {
    //     // dd('summary');
    //     $query = Cart::with('product', 'product');
        
    //     if(Auth::user()){
    //         $user_id = Auth::user()->id;
    //         $query->where('user_id', $user_id);
    //     }else{
    //         $session_id = Session::getId();
    //         $query->where('session_id', $session_id);
    //     }
    //     $carts = $query->get();

    //     // Shipping Charge
    //     $order = Order::where('id', $id)->first();
    //     Session::put('order_id', $order->id);
    //     $sub_total = $order->sub_total;

    //     // Minimum Order Amount Calculation
    //     $shipping_charge = 0;
    //     $address_id = $order->address_id;
    //     $minimum_order_amount = $this->getMinimumOrderAmount();
    //     if(($sub_total > $minimum_order_amount) && $address_id){
    //         $postcode = Address::where('id', $address_id)->value('postcode');
    //         if($postcode){
    //             $delivery_charge = DeliveryArea::where('pin_code', $postcode)->value('delivery_charge');
    //             $shipping_charge = $delivery_charge ? $delivery_charge : 0;
    //         }
    //         // dd($shipping_charge);
    //     }
    //     $tax = $query->sum('gst_amount');

    //     $net_amount = $sub_total + $shipping_charge + $tax;        
        
    //     // Prmomcode
    //     $discount_amount = 0;
    //     $promo_code_id = null;   
    //     $discount_percent = 0;
    //     $data = [];
    //     if($request->promo_code){            
    //         $data = $this->applyPromocode($request->promo_code, $net_amount);
    //         $data['promo_code'] = $request->promo_code;
    //         $discount_amount = $data['discount_amount'];
    //         $promo_code_id = $data['promo_code_id']; 
    //         $discount_percent = $data['discount_percent'];
    //         $net_amount = $net_amount - $discount_amount;
    //     }
    //     // Prmomcode

    //     Order::where('id', $id)->update([
    //         'tax' => $tax,
    //         'shipping_charge' => $shipping_charge,
    //         'net_amount' => $net_amount,
    //         'promo_code_id' => $promo_code_id,
    //         'discount_percent' => $discount_percent,
    //         'discount_amount' => $discount_amount
    //     ]);
    //     // Shipping Charge
        
    //     $order = Order::where('id', $id)->first();

    // // Available Slots Calculation

    // // Days Validation
    // $available_days = $order->address->delivery_area->days->pluck('day');
    // // Days Validation
    // $show_today = false;
    // $show_tomorrow = false;
    // if(count($available_days) > 0){
    //     $d1 = date('Y-m-d', strtotime( "+1 days" ));
    //     $d2 = date('Y-m-d', strtotime( "+2 days" ));

    //     $d3 = date('D', strtotime($d1));
    //     $d4 = date('D', strtotime($d2));

    //     $avdays = [];
    //     foreach($available_days as $u => $ad){
    //         $avdays[$u] = substr(ucfirst($ad), 0, 3);
    //     }

    //     if(in_array($d3, $avdays)){
    //         $show_today = true;

    //     }
    //     if(in_array($d4, $avdays)){
    //         $show_tomorrow = true;

    //     }
    //     // dd($avdays, $d1, $d2, $d3, $d4, $available_days);        
        
    // }else{           
    //     $show_today = true;
    //     $show_tomorrow = true;
    // }
    // $t = "+1 days";
    // $t1 = "+2 days";

    // // Dates
    // $today = date('Y-m-d', strtotime( $t ));
    // $tomorrow = date('Y-m-d', strtotime( $t1 ));

    //     // Days
    //     $day = date('D', strtotime($today));
    //     // dd($day);
    //     switch ($day) {
    //         case 'Sun':
    //             $days  = [ $today => 'Sunday', $tomorrow => 'Monday'];
    //             break;
    //             case 'Mon':
    //             $days  = [ $today => 'Monday', $tomorrow => 'Tuesday'];
    //             break;
    //         case 'Tue':
    //             $days  = [ $today => 'Tuesday', $tomorrow => 'Wednesday'];
    //             break;
    //         case 'Wed':
    //             $days  = [ $today => 'Wednesday', $tomorrow => 'Thursday'];
    //             break;
    //         case 'Thu':
    //             $days  = [ $today => 'Thursday', $tomorrow => 'Friday'];
    //             break;
    //         case 'Fri':
    //             $days  = [ $today => 'Friday', $tomorrow => 'Saturday'];
    //             break;
    //         case 'Sat':
    //             $days  = [ $today => 'Saturday', $tomorrow => 'Sunday'];
    //             break;
    //     }

    //     $delivery_area_id = DeliveryArea::where('pin_code', $postcode)->value('id');
        
    //     // Today Slots
    //     $today_delivery_slots = DeliverySlot::where('delivery_area_id', $delivery_area_id)->where('day', $days[$today])->get();
        
    //     $available_today_slots = [];
    //     foreach($today_delivery_slots as $d => $tds){
    //         $slots_already_booked = Order::where('delivery_date', $today)->where('delivery_slot_id', $tds->id)->count();
    //         if($tds->deliveries > $slots_already_booked){
    //             $available_today_slots[$d] = $tds;
    //         }
    //     }

    //     // Tomorrow Slots  
    //     $tomorrow_delivery_slots = DeliverySlot::where('delivery_area_id', $delivery_area_id)->where('day', $days[$tomorrow])->get();
    //     $available_tomorrow_slots = [];
    //     foreach($tomorrow_delivery_slots as $d => $tds){
    //         $slots_already_booked = Order::where('delivery_date', $today)->where('delivery_slot_id', $tds->id)->count();
    //         if($tds->deliveries > $slots_already_booked){
    //             $available_tomorrow_slots[$d] = $tds;
    //         }
    //     }

    //     $setting = Settings::first();
    // // Available Slots Calculation
        
    //     if(Auth::user()->mobile == '' || Auth::user()->mobile == null){
    //         return view('customer.back.mobile')->with([
    //             'id' => $id
    //         ]);
    //     }else{           
    //         return view('customer.back.summary')->with([
    //             'carts' => $carts,
    //             'order' => $order,
    //             'data' => $data,
    //             'available_today_slots' => $available_today_slots,
    //             'available_tomorrow_slots' => $available_tomorrow_slots,
    //             'today' => $today,
    //             'tomorrow' => $tomorrow,
    //             'show_today' => $show_today,
    //             'show_tomorrow' => $show_tomorrow,
    //             'online_payment' => $setting ? $setting->online_payment : 'No'
    //         ]);
    //     }
    // }

    public function applyPromocode($promo_code, $net_amount)
    {
        $discount = [];

        $today =  date('Y-m-d', strtotime(date('Y-m-d')));

        $promo = PromoCode::where('code', $promo_code)->first();
        
        // Is Valid       
        if($promo == null or $promo->status != 'Active'){
            $data['status'] = "Error";
            $data['message'] = "Invalid Promocode";
            $data['discount_amount'] = 0;
            $data['discount_percent'] = 0;
            $data['promo_code_id'] = null;
            return $data;
        }

        $start_date = date('Y-m-d', strtotime(date($promo->start_date)));
        $end_date = date('Y-m-d', strtotime(date($promo->end_date)));
        
        // Is Expired
        if( $start_date <= $today and $today <= $end_date){
            $data['status'] = "Error";
            $data['message'] = "Promocode Expired";
            $data['discount_amount'] = 0;
            $data['discount_percent'] = 0;
            $data['promo_code_id'] = null;
            return $data;
        }

        $discount_percent = $promo->discount_percent;
        $minimum_booking = $promo->minimum_booking;
        $maximum_discount = $promo->maximum_discount;
        $budget = $promo->budget;
        $spent = $promo->spent;

        // Check Minimum Booking Rate
        if($net_amount < $minimum_booking){
            $data['status'] = "Error";
            $data['message'] = 'Promocode valid only if rate greater than '.$minimum_booking;
            $data['discount_amount'] = 0;
            $data['discount_percent'] = 0;
            $data['promo_code_id'] = null;
            return $data;
        }
        
        // Discount Calculation
        $discount_amount = ($net_amount * $discount_percent) / 100;
        $discount_amount = ($discount_amount > $maximum_discount) ? $maximum_discount : $discount_amount;

        // Budget Checking
        $available_budget = $budget - $spent;
        if($available_budget < $discount_amount){
            $data['status'] = "Error";
            $data['message'] = 'Offer closed';
            $data['discount_amount'] = 0;
            $data['discount_percent'] = 0;
            $data['promo_code_id'] = $promo->id;
            return $data;
        }
        
        // Offer Success
        $data['status'] = "Success";
        $data['message'] = 'Promo Code Applied';
        $data['discount_amount'] = $discount_amount;
        $data['discount_percent'] = $discount_percent;
        $data['promo_code_id'] = null;
        return $data;
    }

    public function addMobile(Request $request)
    {
        User::where('id', Auth::user()->id)->update([
            'mobile' => $request->mobile
        ]);

        return redirect(route('customer.cart.summary', [ 'id' => $request->id ]));
    }

}
