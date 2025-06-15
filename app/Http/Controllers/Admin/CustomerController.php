<?php

namespace App\Http\Controllers\Admin;
use App\Http\Controllers\Controller;

use App\Booking;
use App\City;
use App\CustomerAddress;
use App\User;
use App\Customer;
use Illuminate\Http\Request;
use Brian2694\Toastr\Facades\Toastr;

class CustomerController extends Controller
{
    public function list()
    {
        $customers = User::with('addresses')->where('role', 'Customer')->orderBy('id', 'desc')->get();

        return view('admin.customer.customer_list')->with([
            'customers' => $customers
        ]);
    }

    public function view($customer_id)
    {
        $customer = User::where('id', $customer_id)->first();

        return view('admin.customer.customer_view')->with([
            'customer' => $customer
        ]);
    }

    public function edit($user_id)
    {
        $customer = Customer::where('user_id', $user_id)->first();

        if(!$customer){
            $customer = new Customer();
            $customer->user_id = $user_id;
            $customer->gst = 0;
            $customer->shipping_excluded = 'No';
            $customer->save();
        }

        return view('admin.customer.customer_edit')->with([
            'customer' => $customer
        ]);
    }

    public function update(Request $request)
    {

        $customer = Customer::where('user_id', $request->user_id)->update([
            'shipping_excluded' => $request->shipping_excluded
        ]);

        Toastr::success('Customer Details Updated');
        return redirect(route('customer.list'));
    }
}
