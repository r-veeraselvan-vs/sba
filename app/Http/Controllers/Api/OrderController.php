<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Validator;
use Illuminate\Http\Request;
use App\Order;
use App\User;
use Auth;

class OrderController extends ResponseController
{
    public function orders(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'status' => "required|in:On Going,History",
        ]);

        if($validator->fails()){
            $error = $validator->errors()->first();
            return $this->sendResponse('Error', $error, 404, 'send-error');
        }

        $user_id = Auth::user()->id;

        $query = Order::with('delivery_slot', 'order_details.product.category', 'order_details.product.subcategory')
            ->where('user_id', $user_id)->where('status', 'Placed');

        if($request->status == 'History'){
            $query->whereIn('delivery_status', [ 'Delivered' ]);
        }else{
            $query->whereIn('delivery_status', [ 'Order Received','Packed','Out for Delivery' ]);
        }

        $order = $query->orderBy('order_time', 'desc')->get();

        return $this->sendResponse($order, 'Order Listed Successfully', 200, 'send-data');
    }

    public function order($order_id)
    {
        // Retrieve the order along with related data
        $order = Order::with('address', 'delivery_slot', 'order_details.product.category', 'order_details.product.subcategory', 'order_details.product_price')
            ->where('id', $order_id)->first();

        if (!$order) {
            return response()->json(['message' => 'Order not found'], 404);
        }

        // Retrieve the first entered order for the user
        $first_order = Order::where('user_id', $order->user_id)->orderBy('created_at', 'asc')->first();

        // Initialize discount related variables
        $is_first_order = false;
        $first_order_discount_percent = 0;
        $first_order_discount_amount = 0;
        $net_amount = $order->sub_total;

        if ($first_order && $first_order->id == $order_id) {
            // Check if it has the desired status
            $is_first_order = $first_order->status === 'Placed';

            if ($is_first_order) {
                // Assuming 10% discount for the first order
                $first_order_discount_percent = 10;
                $first_order_discount_amount = $order->sub_total * ($first_order_discount_percent / 100);
                $net_amount = $order->sub_total - $first_order_discount_amount;
            }
        }

        // Prepare additional data
        $data = [
            'is_first_order' => $is_first_order ? "True" : "False",
            'sub_total' => $order->sub_total,
            'net_amount' => $net_amount,
            'first_order_discount_percent' => $first_order_discount_percent,
            'first_order_discount_amount' => $first_order_discount_amount
        ];

        // Merge order data with additional data and send the response
        return $this->sendResponse(array_merge($order->toArray(), $data), 'Order Retrieved Successfully', 200, 'send-data');
    }

}
