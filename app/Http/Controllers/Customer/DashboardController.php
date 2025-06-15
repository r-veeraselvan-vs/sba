<?php

namespace App\Http\Controllers\Customer;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Address;
use App\Order;
use App\User;
use App\Product;
use App\Wishlist;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\Hash;
use App\OrderDetail;
use Session;
use Illuminate\Support\Facades\Redirect;
use Auth;

class DashboardController extends Controller
{
    public function profile()
    {
        $profile = Auth::user();

        return view('customer.back.profile')->with([
            'profile' => $profile
        ]);
    }

    public function profileUpdate(Request $request)
    {
        $success = 'Profile Updated Successfully';
        if($request->current_password != '' || $request->current_password != '' || $request->current_password != ''){

            $validator = Validator::make($request->all(), [
                'current_password' => ['required', function ($attribute, $value, $fail) {
                    if (!\Hash::check($value, Auth::user()->password)) {
                        return $fail(__('The current password is incorrect.'));
                    }
                }],
                'password' => 'required|min:4',
                'password_confirmation' => 'required|same:password'
            ]);

            if($validator->fails()){
                $error = $validator->errors()->first();
                return redirect(route('customer.profile'))->with([
                    'error' => $error
                ]);
            }
    
            User::where('email', $request->email)->update([ 'password' => Hash::make($request->password) ]);
            $success = 'Profile Updated and Password Changed Successfully';
        }


        User::where('id', Auth::user()->id)->update([
            'name' => $request->name,
            'mobile' => $request->mobile
        ]);

        return redirect(route('customer.profile'))->with([
            'success' => $success
        ]);
    }

    public function orders()
    {
        $orders = Order::where('user_id', Auth::user()->id)
                        ->with('order_detail.product')
                        ->where('status', '!=', 'Created')
                        ->orderBy('id', 'desc')->paginate(10);

        return view('customer.back.orders')->with([
            'orders' => $orders
        ]);
    }

    public function orderdetails($id)
    {
        $order = Order::where('id', $id)
                ->with('order_details.product', 'address')
                ->orderBy('id', 'desc')->first();
                
        return view('customer.back.order_details')->with([
            'order' => $order
        ]);
    }

    public function downloads()
    {
        $downloads = Order::where('user_id', Auth::user()->id)
        ->with('order_details.product')
        ->orderBy('id', 'desc')->get();

        return view('customer.back.downloads')->with([
            'downloads' => $downloads
        ]);
    }

    public function address()
    {
        Session::put('checkout', false);
        $addresses = Address::with('delivery_area.days')->where('user_id', Auth::user()->id)
            ->orderBy('id', 'desc')            
            ->where('status', 'Active')
            ->get();
            
        return view('customer.back.address.list')->with([
            'addresses' => $addresses
        ]);
    }

    public function deleteAddress($id)
    {
        Address::where('id', $id)->update([
            'status' => 'Deleted'
        ]);

        return Redirect::back()->with([
            'success' => 'Address Removed successfully'
        ]);
    }

    public function editAddress($id, $type)
    {
        $address = Address::where('id', $id)->first();

        return view('customer.back.address.edit')->with([
            'address' => $address,
            'type' => $type
        ]);
    }

    public function updateAddress(Request $request)
    {
        Address::where('id', $request->id)->update([
            'address' => $request->address,
            'building_name' => $request->building_name,
            'city' => $request->city,
            'short_name' => $request->short_name,
            'route' => $request->route,
            'postcode' => $request->postcode,
            'latitude' => $request->latitude,
            'longitude' => $request->longitude
        ]);
        
        if($request->type == 'my-address'){
            $route = route('customer.address');
        }else{
            $route = route('cart.order.checkout');
        }
        return redirect($route)->with([
            'success' => 'Address Updated successfully'
        ]);

    }

    public function wishlist()
    {
        $user_id = Auth::user() ? Auth::user()->id : 0;
        $wishlists = Wishlist::where('user_id', $user_id)->pluck('product_id')->toArray();
        
        $query = Product::with('category', 'one_price');
            $query->whereIn('id', $wishlists);
            $products = $query->where('status', 'Active')->paginate(20);
        
        return view('customer.back.wishlist')->with([
            'products' => $products,
            'wishlists' => $wishlists
        ]);
    }
}
