<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Vendor;
use Hash;
use Brian2694\Toastr\Facades\Toastr;

class VendorController extends Controller
{
    
    public function add()
    {
        return view('admin.vendor.add');
    }

    public function save(Request $request)
    {
        $request->validate([
            'name' => 'required',
            'mobile' => 'required|integer',
          ]);
        $user = new Vendor();
        $user->name = $request->name;
        $user->mobile = $request->mobile;
        $user->address = $request->address;
        $user->password = Hash::make($request->password);
        $user->gst = $request->gst;
        $user->save();

        Toastr::success('Vendor Created');
        return redirect(route('vendor.list'));
    }

    public function list()
    {
        $users = Vendor::orderBy('id', 'DESC')->get();
        return view('admin.vendor.list')->with([
            'users' => $users
        ]);
    }

    public function edit($vendorId)
    {
        $user = Vendor::where('id', $vendorId)->first();
        return view('admin.vendor.edit')->with([
            'user' => $user
        ]);
    }

    public function update(Request $request)
    {
        $request->validate([
            'name' => 'required',
            'mobile' => 'required|integer',
          ]);
        Vendor::where('id', $request->id)->update([            
            'name'      => $request->name,
            'mobile'    => $request->mobile,
            'address'     => $request->address,
            'gst'    => $request->gst,
        ]);

        Toastr::success('Vendor Updated');
        return redirect(route('vendor.list'));
    }
}
