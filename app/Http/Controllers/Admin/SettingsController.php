<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Brian2694\Toastr\Facades\Toastr;
use App\Settings;

class SettingsController extends Controller
{
    
    public function edit()
    {
        $settings = Settings::orderBy('id', 'desc')->limit(1)->first();

        return view('admin.settings.edit', compact('settings'));
    }


    public function update(Request $request)
    {

        $settings = Settings::orderBy('id', 'desc')->limit(1)->first();

        if($settings){

            $settings->minimum_order_amount = $request->minimum_order_amount;
            $settings->online_payment = $request->online_payment;
            $settings->save();
            
            Toastr::success('Settings Updated Successfully');
            return redirect(route('setting.edit'));
        }else{

            $settings = new Settings();
            $settings->minimum_order_amount = $request->minimum_order_amount;
            $settings->online_payment = $request->online_payment;
            $settings->save();

            Toastr::success('Settings Updated Successfully');
            return redirect(route('setting.edit'));

        }
    }
}
