<?php

namespace App\Http\Controllers\Admin;

use Brian2694\Toastr\Facades\Toastr;
use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Validator;
use App\User;
use App\Customer;
use App\ProductPrice;
use App\Address;
use App\DeliveryArea;
use App\Order;
use App\OrderDetail;
use App\VendorsProduct;
use App\Product;

class BillingController extends Controller
{
    public function add()
    {
        $product_prices = ProductPrice::with('product')->where('inventory', '>', '0')->get();

        return view('admin.billing.billing_add')->with([
            'product_prices' => $product_prices
        ]);
    }
    
    public function billing(Request $request)
    {

        // dd($request->all());

        $order = $request->order;
        $order_details = $request->order_details;

        // Create Order
        $ord = new Order();
        $ord->origin = 'Bill';
        $ord->user_id = $order['user_id'];
        $ord->address_id = $order['address_id'];
        $ord->items = count($order_details);
        $ord->sub_total = $order['sub_total'];
        $ord->tax = $order['tax'];
        $ord->shipping_charge = $order['shipping_charge'];
        $ord->net_amount = $order['net_amount'];
        $ord->delivery_date = $order['delivery_date'];
        $ord->order_time = date('Y-m-d H:i:s');
        $ord->delivery_slot_id = $order['delivery_slot_id'];
        $ord->payment_mode = 'COD';
        $ord->status = 'Placed';
        $ord->delivery_status = 'Order Received';
        $ord->save();

        $postcode = Address::where('id', $order['address_id'])->value('postcode');
        $check = substr($postcode, 0, 1);

        // Create Order Details
        foreach($order_details as $order_detail){
            // gst calculations
            $gst_percent    = $order_detail['gst_percent'];
            $gst_amount     = $order_detail['gst_amount'];
            $cgst_percent   = $gst_percent / 2;
            $cgst_amount    = $gst_amount / 2;
            $sgst_percent   = $gst_percent / 2;
            $sgst_amount    = $gst_amount / 2;
            $igst_percent   = $gst_percent;
            $igst_amount    = $gst_amount;
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
            $detail->order_id           = $ord->id;
            $detail->user_id            = $ord->user_id;
            $detail->product_id         = $order_detail['product_id'];
            $detail->price              = $order_detail['price'];
            $detail->product_price_id   = $order_detail['product_price_id'];
            $detail->offer_price        = $order_detail['offer_price'];
            $detail->weight             = $order_detail['weight'];
            $detail->quantity           = $order_detail['quantity'];
            $detail->amount             = $order_detail['amount'];
            $detail->total_weight       = $order_detail['total_weight'];
            $detail->gst_percent        = $gst_percent;
            $detail->gst_amount         = $gst_amount;
            $detail->cgst_percent       = $cgst_percent;
            $detail->cgst_amount        = $cgst_amount;
            $detail->sgst_percent       = $sgst_percent;
            $detail->sgst_amount        = $sgst_amount;
            $detail->igst_percent       = $igst_percent;
            $detail->igst_amount        = $igst_amount;
            $detail->save();

            // Inventory Update Here
            ProductPrice::where('product_id', $order_detail['product_id'])->decrement('inventory', $order_detail['quantity']);
            // Inventory Update Here
            
             $lot = Product::where('id',  $order_detail['product_id'])->first();
                        if($lot!=null)
                        {
                          $data = VendorsProduct::where('id', $lot->lot_number)->decrement('quantity',  $order_detail['quantity']);
                        }
            
        }


        Toastr::success('Bill Created Successfully');
        return redirect(url('/admin/order/detail/'.$ord->id.'/view'));
    }


    // Ajax APi's

    public function customers()
    {
       $users = User::where('role', 'Customer')->orderBy('name', 'asc')->get();
       return json_encode($users);
    }

    public function customer($id)
    {
       $user = User::where('id', $id)->with('customer', 'addresses')->first();
       return json_encode($user);
    }

    public function checkShipping($id, $sub_total)
    {
        $address = Address::where('id', $id)->first();

        if($address){
            // Shipping Address Calculations
            $postcode = $address->postcode;
            
            $delivery_area = DeliveryArea::where('pin_code', $postcode)->where('status', 'Active')->first();
    
            $data = [];
    
            if($delivery_area){
                // Minimum Order Amount Calculation
                $shipping_charge = 0;
                $minimum_order_amount = $this->getMinimumOrderAmount();
                if(($sub_total > $minimum_order_amount) && $id){
                    $postcode = Address::where('id', $id)->value('postcode');
                    $shipping_excluded = Customer::where('user_id', $address->user_id)->value('shipping_excluded');
                    if($postcode && $shipping_excluded == 'No'){
                        $delivery_charge = DeliveryArea::where('pin_code', $postcode)->value('delivery_charge');
                        $shipping_charge = $delivery_charge ? $delivery_charge : 0;
                    }
                }
                
                $available_days = $address->delivery_area->days->pluck('day');
                $slots = $this->getUpcommingSlotsInAdmin($available_days, $delivery_area->id);
                if($slots){
                    $data['shipping_charge'] = $shipping_charge;
                    $data['status'] = 'success';
                    $data['msg'] = 'Shipping Available';
                    $data['upcomming_slots'] = $slots;
                }else{
                    $data['shipping_charge'] = null;
                    $data['status'] = 'error';  
                    $data['msg'] = 'No Delivery slot available to this location';
                    $data['upcomming_slots'] = [];
                }
            }
            else{
                $data['shipping_charge'] = null;
                $data['status'] = 'error';  
                $data['msg'] = 'Shipping Unavailable';
                $data['upcomming_slots'] = [];
            }
            $data['address_id'] = $id;
            if($sub_total <= 0){
                $data['shipping_charge'] = null;
                $data['status'] = 'error';
                $data['msg'] = "Can't calculate shipping while total is 0";
                $data['upcomming_slots'] = [];
            }
        }
        return json_encode($data);
    }

    public function createUser(Request $request)
    {

        $validator = Validator::make($request->all(), [
            'name' => "required",
            'email' => "required|email|unique:users",
            'mobile' => 'required'
        ]);

        $data = [];
        if($validator->fails()){
            $data['msg'] = $validator->errors()->first();
            $data['status'] = 'error';
            $data['data'] = null;
        }else{

            // Generate Password
            $substring = substr(preg_replace("/\s+/", "", $request->name), 0, 4 );
            $length = 8 - strlen($substring);
            $password = $substring.substr(str_shuffle("0123456789"), 0, $length);
            
            $user = new User();
            $user->name = $request->name;
            $user->email = $request->email;
            $user->password = Hash::make($password);
            $user->mobile = $request->mobile;
            $user->status = 'Active';
            $user->bill_user = 'Yes';
            $user->bill_password = $password;
            $user->save();

            $data['msg'] = 'Customer Created Successfully';
            $data['status'] = 'success';
            $data['data'] = $user;
        }


        return json_encode($data);
    }

    public function createAddress(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'user_id' => "required",
            'address' => "required",
            'building_name' => 'required',
            'city' => 'required',
            'short_name' => 'required',
            'route' => 'nullable',
            'postcode' => 'required'
        ]);

        $data = [];
        if($validator->fails()){
            $data['msg'] = $validator->errors()->first();
            $data['status'] = 'error';
            $data['data'] = null;
        }else{
            
            $add = new Address();
            $add->user_id = $request->user_id;
            $add->short_name = $request->short_name;
            $add->building_name = $request->building_name;
            $add->route = $request->route;
            $add->address = $request->address;
            $add->city = $request->city;
            $add->postcode = $request->postcode;
            $add->save();

            $data['msg'] = 'Address Created Successfully';
            $data['status'] = 'success';
            $data['data'] = $add;
        }


        return json_encode($data);
    }

}
