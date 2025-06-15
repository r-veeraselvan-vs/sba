<?php

namespace App\Http\Controllers;

use App\User;
use App\Customer;
use App\Product;
use App\ProductPrice;
use App\Category;
use App\Subcategory;
use Illuminate\Foundation\Auth\Access\AuthorizesRequests;
use Illuminate\Foundation\Bus\DispatchesJobs;
use Illuminate\Foundation\Validation\ValidatesRequests;
use Illuminate\Routing\Controller as BaseController;
use App\Order;
use App\Cart;
use App\Address;
use App\DeliverySlot;
use App\PromoCode;
use App\Settings;
use App\DeliveryArea;
use Auth;
use Session;
use Illuminate\Support\Facades\Mail;

use LaravelFCM\Message\OptionsBuilder;
use LaravelFCM\Message\PayloadDataBuilder;
use LaravelFCM\Message\PayloadNotificationBuilder;
use FCM;
use App\DeviceToken;

class Controller extends BaseController
{
    use AuthorizesRequests, DispatchesJobs, ValidatesRequests;

    public function upload_image($file_name, $folder_name, $image)
    {
        // File name overwrite here
        $name = $image->getClientOriginalName();
       //  $name = str_replace(' ', '-', $name);
        $extension = $image->getClientOriginalExtension(); 
        $file_name = str_replace('.'.$extension, '', $name);
        // File name overwrite here

       $name = $file_name.'-'.rand().'-'.date('m_d_Y_h_i_a.').$image->getClientOriginalExtension();
       $path = '/'.$folder_name.'/';
       \Storage::disk('public')->put($path.$name, file_get_contents($image), 'public');
       return $name;
    }
    
    public function upload_bulk_image($file_name, $folder_name, $image)
    {
        // File name overwrite here
        $name = $image->getClientOriginalName();
       //  $name = str_replace(' ', '-', $name);
        $extension = $image->getClientOriginalExtension(); 
        $file_name = str_replace('.'.$extension, '', $name);
        // File name overwrite here

       $name = $file_name.'.'.$image->getClientOriginalExtension();
       $path = '/'.$folder_name.'/';
       \Storage::disk('public')->put($path.$name, file_get_contents($image), 'public');
       return $name;
    }



    public function sendNotification($user_type, $user_id, $title, $body, $add_data)
    {
        $count = 1;

        $user = User::where('id', $user_id)->first();

        switch ($user_type) {
            case 'Customer':
                # CUSTOMER_FCM_SERVER_KEY & CUSTOMER_FCM_SENDER_ID
                    $server_key = config('app.customer_fcm_server_key');
                    $sender_id = config('app.customer_fcm_sender_id');
                    $count = 3;
                break;
                case 'Rider':
                        # RIDER_FCM_SERVER_KEY & RIDER_FCM_SENDER_ID
                        $server_key = config('app.rider_fcm_server_key');
                        $sender_id = config('app.rider_fcm_sender_id');
                        $count = 1;
                break;
                       
        }

        $optionBuilder = new OptionsBuilder();
        $optionBuilder->setTimeToLive(60*20);

        $notificationBuilder = new PayloadNotificationBuilder($title);
        $notificationBuilder->setBody($body)
                            ->setSound('default');

        $dataBuilder = new PayloadDataBuilder();
        $dataBuilder->addData(['a_data' => $add_data ]);

        $option = $optionBuilder->build();
        $notification = $notificationBuilder->build();
        $data = $dataBuilder->build();

        $devices = null;
        if($user){
            $token = $user->device_token;
            // Get Tokens
            $devices = DeviceToken::where('user_id', $user_id)->where('status', 'Login')->latest()->take($count)->get();
            foreach($devices as $device){
                $device_type = $device->device_type;
                $token = $device->device_token;
                if($token){
                    if ($device_type == 'Android') {
                        $downstreamResponse = FCM::sendTo($token, $option, null, $data, $server_key, $sender_id);    
                    } elseif ($device_type == 'Web') {
                        $downstreamResponse = FCM::sendTo($token, $option, $notification, $data, $server_key, $sender_id);    
                    } else {
                        $downstreamResponse = FCM::sendTo($token, $option, $notification, $data, $server_key, $sender_id);
                    }
                }
            }
            // Get Tokens
        }
            
        return $devices;
    }


    public function sendInvoice($order_id)
    {
        $order = Order::where('id', $order_id)
        ->with('order_details.product')
        ->orderBy('id', 'desc')->first();

        $user = User::where('id', $order->user_id)->first();
        $name = $user->name;
        $email = $user->email;

        // Mail::send('email/invoice', compact('order'), function($q) use ($email, $name) {
        //     $q->to($email, ucfirst($name))
        //             ->subject('Invoice - Direct Farms');
        //     $q->from('directfarms.tech@gmail.com','Direct Farms');
        // });
        // Mail::send('email/invoice', compact('order'), function($q) use ($email, $name) {
        //        $q->to('direct2farms@gmail.com', ucfirst($name))
        //                ->subject('New Order');
        //        $q->from('directfarms.tech@gmail.com','Direct Farms');
        //    });
        return;
    }
    
    public function getUniqueSlug($name, $type)
    {
        do {
            $rules = [
                '@' => '-',
                '#' => '-',
                '$' => '-',
                '%' => '-',
                '&' => '-',
                '*' => '-',
                ')' => '-',
                '(' => '-',
                '_' => '-',
                '- ' => '-',
                ' -' => '-',
                '   ' => '-',
                '  ' => '-',
                ' ' => '-',
                '----' => '-',
                '---' => '-',
                '--' => '-',
                '-' => '-',
                '/' => '-',
            ];
            
            foreach($rules as $i => $rule){
                $name = str_replace($i, $rule,$name);
            }

            $count = 0;
            $random_number = '-'.rand(100,9999);
            $unique_slug = $name.$random_number;
            
            switch ($type) {
                case 'product':
                    $count = Product::where('slug', $unique_slug)->count();
                    break;
                case 'category':
                    $count = Category::where('slug', $unique_slug)->count();
                    break;
                case 'subcategory':
                    $count = Subcategory::where('slug', $unique_slug)->count();
                    break;
            }
        } while ($count > 0);
        return $unique_slug;
    }

    public function getOTP()
    {
        // $otp = rand(1000, 9999);
        $otp = '1234';
        return $otp;
    }

    public function getUserCart($user_id, $device_id, $count)
    { 
        // Check Offer Expiry Date
        $this->checkOfferExpiryDate();

        $query = Cart::with('product', 'product_price');
        if($user_id){
            $query->where('user_id', $user_id);
        }else{
            $query->where('session_id', $device_id);
        }

        return ($count == true) ? $query->count() : $query->get();
    }

    public function getUserCartTotal($user_id, $device_id)
    {
         
        // Check Offer Expiry Date
        $this->checkOfferExpiryDate();

        $query = Cart::with('product');
        if($user_id){
            $query->where('user_id', $user_id);
        }else{
            $query->where('session_id', $device_id);
        }

        return $query->sum('amount');
    }

    public function getAddress($user_id)
    {
        // Default Address
        $address = Address::where('user_id', $user_id)->where('default', 'Yes')->first();

        // Check Order 
        $order = Order::where('user_id', $user_id)->where('status', 'Created')->orderBy('id', 'desc')->first();
        if($order){
            $address = Address::where('id', $order->address_id)->first();
        }

        // get Last Enetered Address
        if(!$address){
            $address = Address::where('user_id', $user_id)->orderBy('updated_at', 'desc')->first();
        }

        return $address;
    }

    public function getAvailableSlots($order, $delivery_area_id)
    {
        // Days Validation
        $available_days = $order->address->delivery_area->days->pluck('day');
        // Days Validation
        $show_today = false;
        $show_tomorrow = false;
        if(count($available_days) > 0){
            $d1 = date('Y-m-d', strtotime( "+1 days" ));
            $d2 = date('Y-m-d', strtotime( "+2 days" ));

            $d3 = date('D', strtotime($d1));
            $d4 = date('D', strtotime($d2));

            $avdays = [];
            foreach($available_days as $u => $ad){
                $avdays[$u] = substr(ucfirst($ad), 0, 3);
            }

            if(in_array($d3, $avdays)){
                $show_today = true;
            }
            if(in_array($d4, $avdays)){
                $show_tomorrow = true;
            }
            // dd($avdays, $d1, $d2, $d3, $d4, $available_days);        
            
        }else{           
            $show_today = true;
            $show_tomorrow = true;
        }
        $t = "+1 days";
        $t1 = "+2 days";

        // Dates
        $today = date('Y-m-d', strtotime( $t ));
        $tomorrow = date('Y-m-d', strtotime( $t1 ));

            // Days
            $day = date('D', strtotime($today));
            // dd($day);
            switch ($day) {
                case 'Sun':
                    $days  = [ $today => 'Sunday', $tomorrow => 'Monday'];
                    break;
                    case 'Mon':
                    $days  = [ $today => 'Monday', $tomorrow => 'Tuesday'];
                    break;
                case 'Tue':
                    $days  = [ $today => 'Tuesday', $tomorrow => 'Wednesday'];
                    break;
                case 'Wed':
                    $days  = [ $today => 'Wednesday', $tomorrow => 'Thursday'];
                    break;
                case 'Thu':
                    $days  = [ $today => 'Thursday', $tomorrow => 'Friday'];
                    break;
                case 'Fri':
                    $days  = [ $today => 'Friday', $tomorrow => 'Saturday'];
                    break;
                case 'Sat':
                    $days  = [ $today => 'Saturday', $tomorrow => 'Sunday'];
                    break;
            }

            // Today Slots
            $today_delivery_slots = DeliverySlot::where('delivery_area_id', $delivery_area_id)->where('day', $days[$today])->where('status','Active')->get();
            
            $available_today_slots = [];
            foreach($today_delivery_slots as $d => $tds){
                $slots_already_booked = Order::where('delivery_date', $today)->where('delivery_slot_id', $tds->id)->count();
                if($tds->deliveries > $slots_already_booked){
                    $available_today_slots[$d] = $tds;
                }
            }

            // Tomorrow Slots  
            $tomorrow_delivery_slots = DeliverySlot::where('delivery_area_id', $delivery_area_id)->where('day', $days[$tomorrow])->where('status','Active')->get();
            $available_tomorrow_slots = [];
            foreach($tomorrow_delivery_slots as $d => $tds){
                $slots_already_booked = Order::where('delivery_date', $today)->where('delivery_slot_id', $tds->id)->count();
                if($tds->deliveries > $slots_already_booked){
                    $available_tomorrow_slots[$d] = $tds;
                }
            }
        // Available Slots Calculation
        $data['available_today_slots'] = $available_today_slots;
        $data['available_tomorrow_slots'] = $available_tomorrow_slots;
        $data['today'] = $today;
        $data['tomorrow'] = $tomorrow;
        $data['show_today'] = $show_today;
        $data['show_tomorrow'] = $show_tomorrow;

        return $data;
    }

    public function getUpcommingSlots($order, $delivery_area_id)
    {
        
        // Available Slots Calculation

        // Days Validation
        $available_days = $order->address->delivery_area->days->pluck('day');
        // dd($available_days);
        $upcommingSlots = [];
        if(count($available_days) > 0){

            $avDays = [];
            foreach($available_days as $u => $ad){
                $avDays[$u] = ucfirst($ad);
            }

            $option = 1;
            $noOfOptions = 2;
            $startDay = 1;
            $endDay = $noOfOptions * 7;

            do {
                $date = date('Y-m-d', strtotime( "+".$startDay." days" ));
                $day = date('l', strtotime($date));
                if(in_array($day, $avDays)){

                    // Cehck Available Slots
                    $slots = DeliverySlot::where('delivery_area_id', $delivery_area_id)->where('day', $day)->where('status','Active')->get();
                        $available_slots = [];
                        foreach($slots as $d => $tds){
                            $slots_already_booked = Order::where('delivery_date', $date)->where('delivery_slot_id', $tds->id)->count();
                            if($tds->deliveries > $slots_already_booked){
                                $available_slots[$d] = $tds;
                            }
                        }
                    
                        if($option <= $noOfOptions){
                            // Available slots only
                            if(count($available_slots) > 0){
                                $data = [];
                                $data['date'] = $date;
                                $data['day'] = $day;
                                $data['slots'] = $available_slots;
                                $upcommingSlots[$option - 1] = $data;
                                
                                $option ++;
                            }
                        }
                    
                }
                $startDay++;
            } while ($endDay >= $startDay);
            
        }

        return $upcommingSlots;

    }

    public function getUpcommingSlotsInAdmin($available_days, $delivery_area_id)
    {
        
        // Available Slots Calculation
        $upcommingSlots = [];
        // Default Today Slot
        $slot = [];
        $date = date('Y-m-d');
        $slot['date'] = $date;
        $day = date('l', strtotime($date));
        $slot['date'] = $date;
        $slot['day'] = $day.' - Today';
        $available_slots = DeliverySlot::where('default', 'Yes')->limit(1)->get();
        $slot['slots'] = $available_slots;
        
        $upcommingSlots[0] = ($slot);

        if(count($available_days) > 0){

            $avDays = [];
            foreach($available_days as $u => $ad){
                $avDays[$u] = ucfirst($ad);
            }

            $option = 1;
            $noOfOptions = 2;
            $startDay = 1; // 1 - from day after tomorrow, 0 - tomorrow, -1 - today 
            $endDay = $noOfOptions * 7;

            do {
                $date = date('Y-m-d', strtotime( "+".$startDay." days" ));
                $day = date('l', strtotime($date));
                if(in_array($day, $avDays)){

                    // Cehck Available Slots
                    $slots = DeliverySlot::where('delivery_area_id', $delivery_area_id)->where('day', $day)->get();
                        $available_slots = [];
                        foreach($slots as $d => $tds){
                            $slots_already_booked = Order::where('delivery_date', $date)->where('delivery_slot_id', $tds->id)->count();
                            if($tds->deliveries > $slots_already_booked){
                                $available_slots[$d] = $tds;
                            }
                        }
                    
                        if($option <= $noOfOptions){
                            // Available slots only
                            if(count($available_slots) > 0){
                                $data = [];
                                $data['date'] = $date;
                                $data['day'] = $day;
                                $data['slots'] = $available_slots;
                                $upcommingSlots[$option] = $data;
                                
                                $option ++;
                            }
                        }
                    
                }
                $startDay++;
            } while ($endDay >= $startDay);
            
        }

        return $upcommingSlots;

    }

    public function updateOrderData($promo_code_id)
    {
        $user_id = Auth::user()->id;
        $query = Cart::with('product')->where('user_id', $user_id);
        $sub_total = $query->sum('amount');
        $tax = $query->sum('gst_amount');
        $items = count($query->get());

        // Shipping Charge
        $order = Order::where('user_id', $user_id)->where('status', 'Created')->first();
        $order_id = $order->id;
        $data['order_id'] = $order_id;
        
        // Minimum Order Amount Calculation
        $shipping_charge = 0;
        $address_id = $order->address_id;
        $minimum_order_amount = $this->getMinimumOrderAmount();
        if(($sub_total < $minimum_order_amount) && $address_id){
            $postcode = Address::where('id', $address_id)->value('postcode');
            $shipping_excluded = Customer::where('user_id', Auth::user()->id)->value('shipping_excluded');
            if($postcode && $shipping_excluded == 'No'){
                $delivery_charge = DeliveryArea::where('pin_code', $postcode)->value('delivery_charge');
                $shipping_charge = $delivery_charge ? $delivery_charge : 0;
            }
            // dd($shipping_charge);
        }
        // $net_amount = $sub_total + $shipping_charge;
            
        $is_first_order = Order::where('user_id', $user_id)->where('status', '!=', 'Cancelled')->count() == 1 && Order::where('user_id', $user_id)->where('status', 'Created')->count() == 1;
        
            $first_order_discount_percent = $is_first_order ? 10 : 0; // Assuming 10% discount for the first order
            $first_order_discount_amount = $sub_total * ($first_order_discount_percent / 100);
            $net_amount = $is_first_order ? ($sub_total + $shipping_charge - $first_order_discount_amount) : $sub_total + $shipping_charge;

        $discount_amount = 0; 
        $discount_percent = 0;

        $today =  date('Y-m-d', strtotime(date('Y-m-d')));

        $promo = PromoCode::where('id', $promo_code_id)->first();

        // only Calculation
        if(!$promo){
            return $this->updateCalculation($order_id, $net_amount, $tax, $shipping_charge, $promo_code_id, $discount_percent, $discount_amount, $sub_total, $items);
        }

        // Is Valid       
        if($promo == null or $promo->status != 'Active'){
            $data['status'] = "Error";
            $data['message'] = "Invalid Promocode";
            $discount_amount = 0;
            $discount_percent = 0;
            $promo_code_id = null;
            $this->updateCalculation($order_id, $net_amount, $tax, $shipping_charge, $promo_code_id, $discount_percent, $discount_amount, $sub_total, $items);
            return $data;
        }
        // Is Expired
        $start_date = date('Y-m-d', strtotime(date($promo->start_date)));
        $end_date = date('Y-m-d', strtotime(date($promo->end_date)));
        if(($today < $start_date) or ($today > $end_date)){ 
            $data['status'] = "Error";
            $data['message'] = "Promocode Expired";
            $discount_amount = 0;
            $discount_percent = 0;
            $promo_code_id = null;
            $this->updateCalculation($order_id, $net_amount, $tax, $shipping_charge, $promo_code_id, $discount_percent, $discount_amount, $sub_total, $items);
            return $data;
        }

        $discount_percent = $promo->discount_percent;
        $minimum_order = $promo->minimum_order;
        $maximum_discount = $promo->maximum_discount;
        $budget = $promo->budget;
        $spent = $promo->spent;
        
        // Check Minimum Booking Rate
        if($net_amount < $minimum_order){
            $data['status'] = "Error";
            $data['message'] = 'Promocode valid only if rate greater than '.$minimum_order;
            $discount_amount = 0;
            $discount_percent = 0;
            $promo_code_id = null;
            $this->updateCalculation($order_id, $net_amount, $tax, $shipping_charge, $promo_code_id, $discount_percent, $discount_amount, $sub_total, $items);
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
            $discount_amount = 0;
            $discount_percent = 0;
            $promo_code_id = null;
            $this->updateCalculation($order_id, $net_amount, $tax, $shipping_charge, $promo_code_id, $discount_percent, $discount_amount, $sub_total, $items);
            return $data;
        }
        
        // Offer Success
        $data['status'] = "Success";
        $data['message'] = 'Promo Code Applied';
		$net_amount = $net_amount - $discount_amount;
        $this->updateCalculation($order_id, $net_amount, $tax, $shipping_charge, $promo_code_id, $discount_percent, $discount_amount, $sub_total, $items);

        $data['first_order_discount_percent'] = $first_order_discount_percent ?? 0;
            $data['first_order_discount_amount'] = $first_order_discount_amount ?? 0;
            $data['is_first_order'] = $is_first_order ? "True" : "False";
            $data['net_amount'] = $net_amount; 

        return $data;
    }

    public function updateCalculation($order_id, $net_amount, $tax, $shipping_charge, $promo_code_id, $discount_percent, $discount_amount, $sub_total, $items)
    {
        return Order::where('id', $order_id)->update([
            'tax' => $tax,
            'shipping_charge' => $shipping_charge,
            'sub_total' => $sub_total,
            'items' => $items,
            'net_amount' => $net_amount,
            'promo_code_id' => $promo_code_id,
            'discount_percent' => $discount_percent,
            'discount_amount' => $discount_amount
        ]);
    }

    public function checkInventory($carts)
    {
        if($carts){
           foreach($carts as $cart){
               if($cart && $cart->product_price){
                    if($cart->quantity > $cart->product_price->inventory){
                        return false;
                    }
               }
           }
        }
        return true;
    }

    public function getMinimumOrderAmount()
    {
        return Settings::limit(1)->value('minimum_order_amount');
    }

    public function checkOfferExpiryDate()
    {
        $query = Cart::where('offer_expiry_date', '<', date('Y-m-d'));
        
        if(Auth::user()){
            $user_id = Auth::user()->id;
            $query->where('user_id', $user_id);
        }else{
            $session_id = Session::getId();
            $query->where('session_id', $session_id);
        }
        $carts = $query->get();

        // update product price and offers
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

        return true;
    }

}
