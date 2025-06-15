<?php

namespace App\Http\Controllers\Customer;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Cart;
use App\Product;
use App\ProductPrice;
use App\Order;
use App\OrderDetail;
use DateTime;
use Razorpay\Api\Api;
use App\Transaction;
use Session;
use App\VendorsProduct;

class PaymentController extends Controller
{
    public function cashOnDelivery($order_id, Request $request)
    {
        $order = Order::where('id', $order_id)->first();

        $query = Cart::where('user_id', $order->user_id);
        $carts = $query->get();
        $tax = $query->sum('gst_amount');

        $check = substr($order->address->postcode, 0, 1);
        Order::where('id', $order_id)->update([
            'order_time' => date('Y-m-d H:i:s'),
            'delivery_date' => $request->delivery_date,
            'delivery_slot_id' => $request->delivery_slot_id,
            'payment_mode' => $request->payment_mode,
            'change_required' => $request->change_required ? $request->change_required : 0
        ]);
        // Update Order Detail
        
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
            $detail->order_id = $order_id;
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
            $lot = Product::where('id', $cart->product_id)->first();
            if($lot!=null)
            {
              $data = VendorsProduct::where('id', $lot->lot_number)->decrement('quantity', $cart->quantity);
            }
            Cart::where('id', $cart->id)->delete();
        }

        // Order Status Update
        Order::where('id', $order_id)->update([
            'status' => 'Placed',
            'tax' => $tax,
            'delivery_status' => 'Order Received'
        ]);

        if($order_id){
            $this->sendInvoice($order_id);
        }

        return redirect(route('customer.orders'))->with([
            'success' => 'Thankyou, Your Order Placed Successfully'
        ]);
    }

    public function payment(Request $request)
    {
        $input = $request->all();
        $order_id = Session::get('order_id');
        
        $api = new Api('rzp_test_xWb7GHDjhrvmfl','9Hb76aDmApnjGAW4qg4QhReG');
        $payment = $api->payment->fetch($input['razorpay_payment_id']);
        if(count($input)  && !empty($input['razorpay_payment_id']))
        {
            try
            {
                $response = $api->payment->fetch($input['razorpay_payment_id'])->capture(array('amount'=>$payment['amount'])); 

                $arr_tojson = array('id' => $response->id,'currency' =>$response->currency,'status' =>$response->status,'method' =>$response->method,'captured' =>$response->captured,'card_id' =>$response->card_id,'error_code' =>$response->error_code,'error_description' =>$response->error_description,'error_source' =>$response->error_source,'error_step' =>$response->error_step,'error_reason' =>$response->error_reason);
                $strresponse = json_encode($arr_tojson);

                if($response->status=="captured" || $response->status=="authorized")
                { 
                    $order = Order::where('id', $order_id)->first();

                    $transaction = new transaction();
                    $transaction->user_id = $order->user->id;
                    $transaction->order_id = $order_id;
                    $transaction->email = $response->email; 
                    $transaction->mobile = $response->contact; 
                    $transaction->amount = ($response->amount / 100); 
                    $transaction->payment_status ="Success"; 
                    $transaction->payment_id =$response->id; 
                    $transaction->response =$strresponse; 
                    $transaction->save();
                    
                    
                    $query = Cart::where('user_id', $order->user_id);
                    $carts = $query->get();
                    $tax = $query->sum('gst_amount');

                    $check = substr($order->address->postcode, 0, 1);
                    
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
                        $detail->order_id = $order_id;
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
                        
                        $lot = Product::where('id', $cart->product_id)->first();
                        if($lot!=null)
                        {
                          $data = VendorsProduct::where('id', $lot->lot_number)->decrement('quantity', $cart->quantity);
                        }
            
                        Cart::where('id', $cart->id)->delete();
                    }

                    // Order Status Update
                    Order::where('id', $order_id)->update([
                        'status' => 'Placed',
                        'tax' => $tax,
                        'delivery_status' => 'Order Received'
                    ]);

                    if($order_id){
                        $this->sendInvoice($order_id);
                    }
            
                }  
             
            } 

            catch (\Exception $e)
            {
                return  $e->getMessage();
                \Session::put('error',$e->getMessage());
                return redirect()->back();
            }
            
            return redirect(route('customer.orders'))->with([
                    'success' => 'Thankyou, Your Order Placed Successfully'
                ]);
        }
        else
        {
            return redirect()->back();
        }        
    }

    public function updateDeliveryFields(Request $request)
    {
        return Order::where('id', $request->order_id)->update([
            'order_time' => date('Y-m-d H:i:s'),
            'delivery_date' => $request->delivery_date,
            'delivery_slot_id' => $request->delivery_slot_id,
            'payment_mode' => 'Online'
        ]);
    }
}
