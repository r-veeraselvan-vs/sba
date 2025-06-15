<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use App\User;
use App\Notifications\OrderSuccessfull;

use Auth;
use App\Cart;
use App\Order;
use App\OrderDetail;
use App\ProductPrice;
use App\Address;
use App\DeliveryArea;
use App\PromoCode;
use App\Product;
use App\VendorsProduct;
use App\OrderNotifications;
use App\CustRequiredProduct;
use Carbon\Carbon;
use Session;
class BookingController extends ResponseController
{
    // public function booking()
    // {
    //     $user_id = Auth::user()->id;
    //     // dd($user_id);
    //     $carts = $this->getUserCart($user_id, null, false);

    //     // Check Inventory
    //     if($carts){
    //         $inventory = $this->checkInventory($carts);
    //         if(!$inventory){
    //             $message = "Some of the products in your cart are currently unavailable. Please remove them to place the order.";
    //             // $error = "Currently Unavailable, Product is out of stock.";
    //             // return $this->sendResponse('Error', $error, 404, 'send-error');
    //         } else {
    //             $message = "Booking Created Successfully";
    //         }
    //     }

    //     $orders = Order::where('user_id', $user_id)->get();

    //     $order = Order::where('user_id', $user_id)->where('status', 'Created')->first();

    //     $sub_total = $carts->sum('amount');
    //     //$net_amount = $sub_total;
    //     $first_order_discount_amount = 0;
    //     if(count($orders) <= 1 ) {
    //         // Calculate discount amount in rupees
    //         $first_order_discount_percent = 10; // Assuming 10% discount
    //         $first_order_discount_amount = $sub_total * ($first_order_discount_percent / 100);

    //         // Calculate net amount after discount
    //         $net_amount = $sub_total - $first_order_discount_amount;

    //         // Check if there's a 'Created' order among the orders
    //         $created_order_found = false;
    //         foreach ($orders as $o) {
    //             if ($o->status == 'Created') {
    //                 $created_order_found = true;
    //                 // Update the 'Created' order with the new details
    //                 Order::where('id', $o->id)->update([
    //                     'items' => count($carts),
    //                     'sub_total' => $carts->sum('amount'),
    //                     'net_amount' => $net_amount
    //                 ]);
    //                 // Add discount amount to the order object if it's present
    //                 $data['first_order_discount_percent'] = $first_order_discount_percent;
    //                 $data['first_order_discount_amount'] = $first_order_discount_amount;
    //                 $data['is_first_order'] = "True";
    //                 // Exit the loop after updating the first 'Created' order
    //                 break;
    //             }
    //         }

    //         // If no 'Created' order was found, create a new one
    //         if (!$created_order_found) {
    //             $order = new Order();
    //             $order->user_id = $user_id;
    //             $order->items = count($carts);
    //             $order->sub_total = $sub_total;
    //             $order->net_amount = $net_amount;
    //             $order->delivery_date = date('Y-m-d');
    //             $order->status = 'Created'; // Assuming you need to set the status
    //             $order->save();
    //             // Add discount amount to the order object if it's present
    //             $data['first_order_discount_percent'] = $first_order_discount_percent;
    //             $data['first_order_discount_amount'] = $first_order_discount_amount;
    //             $data['is_first_order'] = "True";
    //         }
    //     }
    //     else
    //     {
    //         $net_amount = $sub_total;
    //         if($order){
    //             Order::where('id', $order->id)->update([
    //                 'items' => count($carts),
    //                 'sub_total' => $carts->sum('amount'),
    //                 'net_amount' => $net_amount
    //             ]);


    //             $data['discount'] = 0;
    //             $data['first_order'] = "False";

    //         }else{
    //             $order = new Order();
    //             $order->user_id = $user_id;
    //             $order->items = count($carts);
    //             $order->sub_total = $sub_total;
    //             $order->net_amount = $net_amount;
    //             $order->delivery_date = date('Y-m-d');
    //             $order->save();    

    //             $data['discount'] = 0;
    //             $data['is_first_order'] = "False"; 
    //         }
    //     }
            
    //     $data['order'] = Order::with('address', 'delivery_slot')->where('id', $order->id)->first();
    //     $data['cart'] = $carts;
	// 	$data['minimum_order'] = $this->getMinimumOrderAmount();
        
    //     return $this->sendResponse($data, $message, 200, 'send-data');
    // }

    public function booking(Request $request)
    {
        $user_id = Auth::user()->id;
        $carts = $this->getUserCart($user_id, null, false);

if (!$carts || count($carts) == 0) {
    $message = "Your cart is empty. Please select products to add to your cart.";
    return $this->sendResponse(null, $message, 400, 'send-error');
}
        // Check Inventory
        if ($carts) {
            $inventory = $this->checkInventory($carts);
            if (!$inventory) {
                $message = "Some of the products in your cart are currently unavailable. Please remove them to place the order.";
                return $this->sendResponse(null, $message, 400, 'send-error');
            } else {
                $message = "Booking Created Successfully";
            }
        }

        $order = Order::where('user_id', $user_id)->where('status', 'Created')->first();
        $sub_total = $carts->sum('amount');

        // Check if it's the user's first order
        if (Order::where('user_id', $user_id)->count() == 0) {
            $is_first_order = true;
        } else {
            // Existing condition to check if the user's first order is the only active one and is 'Created'
            $is_first_order = Order::where('user_id', $user_id)
                ->where('status', '!=', 'Cancelled')
                ->count() == 1 && Order::where('user_id', $user_id)
                ->where('status', 'Created')
                ->count() == 1;
        }

        // Calculate discount for the first order
        $first_order_discount_percent = $is_first_order ? 10 : 0; // Assuming 10% discount for the first order
        $first_order_discount_amount = $sub_total * ($first_order_discount_percent / 100);
        $net_amount = $is_first_order ? ($sub_total - $first_order_discount_amount) : $sub_total;
        // Create or update order
        if ($order) {
            Order::where('id', $order->id)->update([
                'items' => count($carts),
                'sub_total' => $sub_total,
                'net_amount' => $net_amount
            ]);
        } else {
            $order = new Order();
            $order->user_id = $user_id;
            $order->items = count($carts);
            $order->sub_total = $sub_total;
            $order->net_amount = $net_amount;
            // $order->status = 'Cancelled';
            $order->delivery_date = date('Y-m-d');
            $order->save();
        }

        $data['order'] = Order::with('address', 'delivery_slot')->where('id', $order->id)->first();
        $data['cart'] = $carts;
        $data['minimum_order'] = $this->getMinimumOrderAmount();
        
        $data['first_order_discount_percent'] = $first_order_discount_percent ?? 0;
        $data['first_order_discount_amount'] = $first_order_discount_amount ?? 0;
        $data['is_first_order'] = $is_first_order ? "True" : "False";
        $data['net_amount'] = $net_amount;  

        session()->put('order_data', $data);

        return $this->sendResponse($data, $message, 200, 'send-data');
    }

    public function updateAddress(Request $request)
    {
        $sessionData = session()->get('order_data');
        // dd($sessionData);
        $validator = Validator::make($request->all(), [
            'address_id' => 'required|exists:addresses,id'
        ]);

        if($validator->fails()){
            $error = $validator->errors()->first();
            return $this->sendResponse('Error', $error, 404, 'send-error');
        }

        $address = Address::where('id', $request->address_id)->first();

        // Shipping Address Calculations
        $postcode = $address->postcode;
        
        $delivery_area = DeliveryArea::where('pin_code', $postcode)->first();
        if(!$delivery_area){            
            return $this->sendResponse('Error', 'Shipping unavailable to this location', 404, 'send-error');
        }else{
            Order::where('user_id', Auth::user()->id)->where('status', 'Created')->update([
                'address_id' => $request->address_id
            ]);
            $order = Order::with('address', 'delivery_slot')->where('user_id', Auth::user()->id)->where('status', 'Created')->first();
            $data = [];
            $data['delivery_slots'] = $this->getAvailableSlots($order, $delivery_area->id);
            $data['upcoming_slots'] = $this->getUpcommingSlots($order, $delivery_area->id);
            $data['order'] = $order;
			$data['minimum_order'] = $this->getMinimumOrderAmount();

            if ($sessionData) {
                $data = array_merge($data, $sessionData);
            }
            return $this->sendResponse($data, 'Address Updated Successfully', 200, 'send-data');
        }
        
    }

    public function updatePromocode(Request $request)
    {
        $sessionData = session()->get('order_data');

        $validator = Validator::make($request->all(), [
            'promo_code' => 'required|exists:promo_codes,code'
        ]);

        if($validator->fails()){
            $error = $validator->errors()->first();
            return $this->sendResponse('Error', $error, 404, 'send-error');
        }

        $promo_code = $request->promo_code;
        $promo_code_id = PromoCode::where('code', $promo_code)->value('id');
       
        $data = $this->updateOrderData($promo_code_id);
        // Invalid Promocode
        if($data['status'] == "Error"){
            return $this->sendResponse('Error', $data['message'], 404, 'send-error');
        }
        
        $order = Order::with('address', 'delivery_slot')->where('id', $data['order_id'])->first();
		$data['order'] = $order;
        $data['minimum_order'] = $this->getMinimumOrderAmount();
        
        if ($sessionData) {
            $data = array_merge($data, $sessionData);
        }

        return $this->sendResponse($data, $data['message'], 200, 'send-data');
    }

    public function updateDeliverySlot(Request $request)
    {
        $sessionData = session()->get('order_data');

        $validator = Validator::make($request->all(), [
            'delivery_date' => 'required|date|date_format:Y-m-d',
            'delivery_slot_id' => 'required|exists:delivery_slots,id'
        ]);

        if($validator->fails()){
            $error = $validator->errors()->first();
            return $this->sendResponse('Error', $error, 404, 'send-error');
        }

        $user_id = Auth::user()->id;
        $order = Order::where('user_id', $user_id)->where('status', 'Created')->first();
        $promo_code_id = $order->promo_code_id;
        $order_id = $order->id;

        $data = $this->updateOrderData($promo_code_id);

        // Delivery Slot
        Order::where('id', $order_id)->update([
            'delivery_date' => $request->delivery_date,
            'delivery_slot_id' => $request->delivery_slot_id,
        ]);

        $order = Order::with('address', 'delivery_slot')->where('id', $order_id)->first();
		$data = [];
		$data['order'] = $order;
        $data['minimum_order'] = $this->getMinimumOrderAmount();
        
        if ($sessionData) {
            $data = array_merge($data, $sessionData);
        }

        return $this->sendResponse($data, 'Delivery Slot Updated Successfully', 200, 'send-data');
    }

    public function payment(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'payment_mode' => 'required|in:COD,Online',
            'change_required' => 'nullable',
            'required_product' => 'nullable'
        ]);

        if($validator->fails()){
            $error = $validator->errors()->first();
            return $this->sendResponse('Error', $error, 404, 'send-error');
        }

        $user_id = Auth::user()->id;
        $requiredProduct = $request->input('required_product'); 
        // updating customer required product
        if ($user_id !== null) {
            if ($requiredProduct !== null) {
                // Create or update the CustRequiredProduct
                CustRequiredProduct::updateOrCreate(
                    ['user_id' => $user_id],
                    ['required_product' => $requiredProduct]
                );
            }
        }

        $carts = $this->getUserCart($user_id, null, false);
        // Check if carts exist
        if(!$carts){
            return $this->sendResponse('Error', 'No items in the cart', 404, 'send-error');
        }

        // Check Inventory
        if($carts){
            $inventory = $this->checkInventory($carts);
            if(!$inventory){
                $message = "Some of the products in your cart are currently unavailable. Please remove them to place the order.";
                $order = Order::with('address', 'delivery_slot')->where('user_id', $user_id)->where('status', 'Created')->first();
                $data = [];
                $data['order'] = $order;
                $data['cart'] = $carts;
                $data['minimum_order'] = $this->getMinimumOrderAmount();
                return $this->sendResponse($data, $message, 301, 'send-data');
            }
        }

        $order = Order::where('user_id', $user_id)->where('status', 'Created')->first();

        if(!$order){
            return $this->sendResponse('Error', 'Invalid Order Id', 404, 'send-error');
        }
		
		$net_amount = $order->net_amount;
        $minimum_order = $this->getMinimumOrderAmount();
        // if($net_amount < $minimum_order) {
        //     $error = "Minimum order amount is Rs. " . $minimum_order . ". Please add some more items to place the order.";
        //     return $this->sendResponse('Error', $error, 404, 'send-error');
        // }
		
        $query = Cart::where('user_id', $order->user_id);
        $carts = $query->get();
        $tax = $query->sum('gst_amount');

        if ($order->address !== null) {
            // Access the postcode property
            $check = substr($order->address->postcode, 0, 1);
        } else {
            // Handle the case when the address is null
            // You can log an error, return a specific response, or handle it based on your application's logic
            // For now, let's just set $check to null
            $check = null;
            
            // If you want to fetch the postcode from the address using address_id
            if ($order->address_id !== null) {
                // Assuming Address model has a static method 'find' to fetch by ID
                $address = Address::find($order->address_id);
                if ($address !== null) {
                    // Access the postcode property
                    $check = substr($address->postcode, 0, 1);
                } else {
                    // Handle the case when the associated address is not found
                    // You can log an error, return a specific response, or handle it based on your application's logic
                    // For now, let's just set $check to null
                    $check = null;
                }
            }
        }
        
        Order::where('id', $order->id)->update([
            'payment_mode' => $request->payment_mode,
            'change_required' => $request->change_required ? $request->change_required : 0
        ]);
        
        // Update Order Details
        foreach($carts as $cart){

            // gst calculations
            $gst_percent = $cart->gst_percent;
            $gst_amount = $cart->gst_amount;
            $cgst_percent = $gst_percent / 2;
            $cgst_amount = $gst_amount / 2;
            $sgst_percent = $gst_percent / 2;
            $sgst_amount = $gst_amount / 2;
            $igst_percent = $gst_percent;
            $igst_amount = $gst_amount;
            // gst calculations

            if($check == 6){
                $igst_percent = 0;
                $igst_amount = 0;
            }else{
                $cgst_percent = 0;
                $cgst_amount = 0;
                $sgst_percent = 0;
                $sgst_amount = 0;
            }

            $detail = new OrderDetail();
            $detail->order_id = $order->id;
            $detail->user_id = $cart->user_id;
            $detail->product_id = $cart->product_id;
            $detail->price = $cart->price;
            $detail->product_price_id = $cart->product_price_id;
            $detail->offer_price = $cart->offer_price;
            $detail->weight = $cart->weight;
            $detail->quantity = $cart->quantity;
            $detail->amount = $cart->amount;
            $detail->total_weight = $cart->total_weight;
            $detail->gst_percent = $gst_percent;
            $detail->gst_amount = $gst_amount;
            $detail->cgst_percent = $cgst_percent;
            $detail->cgst_amount = $cgst_amount;
            $detail->sgst_percent = $sgst_percent;
            $detail->sgst_amount = $sgst_amount;
            $detail->igst_percent = $igst_percent;
            $detail->igst_amount = $igst_amount;
            $detail->save();

            // Inventory Update Here
            $data = ProductPrice::where('product_id', $cart->product_id)->decrement('inventory', $cart->quantity);
            // Inventory Update Here
            
            Cart::where('id', $cart->id)->delete();
        }

        // Order Status Update
        Order::where('id', $order->id)->update([
            'status' => 'Placed',
            'tax' => $tax,
            'delivery_status' => 'Order Received',
			'order_time' => date('Y-m-d H:i:s')
        ]);

        if($order->id){
            $this->sendInvoice($order->id);
        }
        $order = Order::with('address', 'delivery_slot', 'order_details')->where('id', $order->id)->first();

        $order = Order::where('id', $order->id)->first();
        $user = User::where('id', $order->user_id)->first();

        // User::find(1)->notify(new OrderSuccessfull($order->id,$user->id));

        if ($order && $user && $order->user_id === $user->id) {
            // Check if the user's id is present in the order
            $userOrderCount = Order::where('user_id', $user->id)->count();

            if ($userOrderCount === 1 && $order->status === 'Created') {
                // Calculate sub total, net amount, and set first order discount details
                $sub_total = $order->sub_total;
                $first_order_discount_percent = 10; // Assuming 10% discount
                $first_order_discount_amount = $sub_total * ($first_order_discount_percent / 100);

                $net_amount = $sub_total - $first_order_discount_amount;

                $data['first_order_discount_percent'] = $first_order_discount_percent;
                $data['first_order_discount_amount'] = $first_order_discount_amount;
                $data['net_amount'] = $net_amount;
                $data['is_first_order'] = true;

                // Send notification or perform any action
                // User::find(1)->notify(new OrderSuccessfull($order->id, $user->id));

                return $this->sendResponse($order, 'Order Placed Successfully', 200, 'send-data');
            } else {
                $data['is_first_order'] = false;
                return $this->sendResponse($order, 'Order Placed Successfully', 200, 'send-data');
            }
        }   
    }

    public function markAsRead(Request $request,$id)
    {
        $OrderNotification = OrderNotifications::where('order_id',$id)->first();
        $OrderNotification->read_at = Carbon::now();
        $OrderNotification->save();
        return redirect()->back();
    }

    public function sendAdminNotification(Request $request)
    {
        $order = Order::where('id', 10)->first();
        $user = User::where('id', 2)->first();

        User::find(1)->notify(new OrderSuccessfull($order->id,$user->id));
    }

}
