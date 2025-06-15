<?php

namespace App\Http\Controllers\Admin;
use App\Http\Controllers\Controller;

use App\User;
use Brian2694\Toastr\Facades\Toastr;
use Hash;
use Illuminate\Http\Request;

class RiderController extends Controller
{

    public function addRider()
    {
        return view('admin.rider.add_rider');
    }

    public function saveRider(Request $request)
    {
        $request->validate([
            'name' => 'required',
            'mobile' => 'required|integer',
            'email' => 'required|email|unique:users',
            'password' => 'required'
        ]);
        $user = new User();
        $user->name = $request->name;
        $user->mobile = $request->mobile;
        $user->email = $request->email;
        $user->password = Hash::make($request->password);
        $user->role = 'Rider';
        $user->save();

        Toastr::success('Rider Created');
        return redirect(route('rider.list'));
    }

    public function list()
    {
        $riders = User::where('role', 'Rider')->orderBy('id', 'desc')->get();

        return view('admin.rider.rider_list')->with([
            'riders' => $riders
        ]);
    }

    public function view($rider_id)
    {
        $rider = User::where('id', $rider_id)->first();

        return view('admin.rider.rider_view')->with([
            'rider' => $rider
        ]);
    }
}
