<?php

namespace App\Http\Controllers\Api\Rider;

use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Validator;
use Illuminate\Http\Request;
use App\Order;
use Auth;

class OrderController extends ResponseController
{
    public function list(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'status' => "required|in:Available,Completed",
        ]);

        if($validator->fails()){
            $error = $validator->errors()->first();
            return $this->sendResponse('Error', $error, 404, 'send-error');
        }

        $user_id = Auth::user()->id;

        $query = Order::with('customer', 'address', 'delivery_slot', 'order_details.product.category', 'order_details.product.subcategory', 'order_details.product_price')
            ->where('rider_id', $user_id)->where('status', 'Placed');

        if($request->status == 'Completed'){
            $query->whereIn('delivery_status', [ 'Delivered' ]);
        }else{
            $query->whereIn('delivery_status', [ 'Order Received','Packed','Out for Delivery' ]);
        }

        $order = $query->orderBy('order_time', 'desc')->get();

        return $this->sendResponse($order, 'Rider Order Listed Successfully', 200, 'send-data');
    }

    public function view($order_id)
    {
        $order = Order::with('customer', 'address', 'delivery_slot', 'order_details.product.category', 'order_details.product.subcategory', 'order_details.product_price', 'customer', 'rider', 'order_pickups', 'order_deliveries')
            ->where('id', $order_id)->first();
        return $this->sendResponse($order, 'Rider Order Retrived Successfully', 200, 'send-data');
    }

    public function pickup(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'order_id' => "required|exists:orders,id",
            'rider_id' => "required|exists:orders,rider_id"
        ]);

        if($validator->fails()){
            $error = $validator->errors()->first();
            return $this->sendResponse('Error', $error, 404, 'send-error');
        }

        Order::where('id', $request->order_id)->where('rider_id', $request->rider_id)->update([
            'pickup_time' => date('Y-m-d H:i:s')
        ]);

        $order = Order::with('customer', 'address', 'delivery_slot', 'order_details.product.category', 'order_details.product.subcategory', 'order_details.product_price', 'order_pickups', 'order_deliveries')
            ->where('id', $request->order_id)->first();

        return $this->sendResponse($order, 'Order Pickup Updated Successfully', 200, 'send-data');
    }

    public function onjob(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'order_id' => "required|exists:orders,id",
            'rider_id' => "required|exists:orders,rider_id"
        ]);

        if($validator->fails()){
            $error = $validator->errors()->first();
            return $this->sendResponse('Error', $error, 404, 'send-error');
        }

        Order::where('id', $request->order_id)->where('rider_id', $request->rider_id)->update([
            'rider_status' => 'On Job',
            'delivery_status' => 'Out for Delivery',
            'on_job_time' => date('Y-m-d H:i:s')
        ]);

        $data = Order::where('id', $request->order_id)->first();

        // Send Push Notifications
        $user_type = 'Customer';
        $user_id = $data->user_id;
        $title = 'Order Collected';
        $body = 'Rider is on his way to deliver the order';
        $add_data = [
            'type' => '5',
            'order_id' => $data->id,
            'title' => 'Order Collected',
            'body' =>'Rider is on his way to deliver the order',
        ];
        $this->sendNotification($user_type, $user_id, $title, $body, $add_data);
        // Send Push Notifications

        $order = Order::with('customer', 'address', 'delivery_slot', 'order_details.product.category', 'order_details.product.subcategory', 'order_details.product_price', 'order_pickups', 'order_deliveries')
            ->where('id', $request->order_id)->first();

        return $this->sendResponse($order, 'Rider Status Updated Successfully', 200, 'send-data');
    }

    public function reached(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'order_id' => "required|exists:orders,id",
            'rider_id' => "required|exists:orders,rider_id"
        ]);

        if($validator->fails()){
            $error = $validator->errors()->first();
            return $this->sendResponse('Error', $error, 404, 'send-error');
        }
		
		Order::where('id', $request->order_id)->where('rider_id', $request->rider_id)->update([
            'reached_time' => date('Y-m-d H:i:s')
        ]);

        $data = Order::where('id', $request->order_id)->first();

        // Send Push Notifications
        $user_type = 'Customer';
        $user_id = $data->user_id;
        $title = 'Reached Delivery Location';
        $body = 'Rider has reached the delivery location';
        $add_data = [
            'type' => '6',
            'order_id' => $data->id,
            'title' => 'Reached Delivery Location',
            'body' =>'Rider has reached the delivery location',
        ];
        $this->sendNotification($user_type, $user_id, $title, $body, $add_data);
        // Send Push Notifications

        $order = Order::with('customer', 'address', 'delivery_slot', 'order_details.product.category', 'order_details.product.subcategory', 'order_details.product_price', 'order_pickups', 'order_deliveries')
            ->where('id', $request->order_id)->first();

        return $this->sendResponse($order, 'Reached Notification Sent Successfully', 200, 'send-data');
    }

    public function delivered(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'order_id' => "required|exists:orders,id",
            'rider_id' => "required|exists:orders,rider_id"
        ]);

        if($validator->fails()){
            $error = $validator->errors()->first();
            return $this->sendResponse('Error', $error, 404, 'send-error');
        }

        Order::where('id', $request->order_id)->where('rider_id', $request->rider_id)->update([
            'rider_status' => 'Delivered',
            'delivery_status' => 'Delivered',
            'delivery_time' => date('Y-m-d H:i:s')
        ]);

        $data = Order::where('id', $request->order_id)->first();

        // Send Push Notifications
        $user_type = 'Customer';
        $user_id = $data->user_id;
        $title = 'Delivered';
        $body = 'Your order has been delivered Successfully';
        $add_data = [
            'type' => '7',
            'order_id' => $data->id,
            'title' => 'Delivered',
            'body' =>'Your order has been delivered Successfully',
        ];
        $this->sendNotification($user_type, $user_id, $title, $body, $add_data);
        // Send Push Notifications

        $order = Order::with('customer', 'address', 'delivery_slot', 'order_details.product.category', 'order_details.product.subcategory', 'order_details.product_price', 'order_pickups', 'order_deliveries')
            ->where('id', $request->order_id)->first();

        return $this->sendResponse($order, 'Order Delivery Status Updated Successfully', 200, 'send-data');
    }
}
