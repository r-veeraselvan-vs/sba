<?php

namespace App\Http\Controllers\Admin;


use App\PromoCode;
use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Brian2694\Toastr\Facades\Toastr;

class PromoCodeController extends Controller
{
    public function index()
    {
        $promocode_list = PromoCode::orderBy('id','DESC')->get();
        return view('admin.promocode.list_promocode')->with([
            'promocode_list' => $promocode_list
        ]);
    }

    public function store(Request $request)
    {

        $promocode = new PromoCode();
        $promocode->name = $request->name;
        $promocode->code = $request->code;
        $promocode->discount_percent = $request->discount_percent;
        $promocode->minimum_order = $request->minimum_order;
        $promocode->maximum_discount = $request->maximum_discount;
        $promocode->budget = $request->budget;
        $promocode->spent = 0;
        $promocode->start_date = $request->start_date;
        $promocode->end_date = $request->end_date;
        $promocode->status = $request->status;
        $promocode->save();

        Toastr::success('PromoCode Created');
        return redirect(route('promocode.list'));
    }

    public function edit($id)
    { 
        $promocode = PromoCode::where('id',$id)->first();

        return view('admin.promocode.edit_promocode')->with([
            'promocode' => $promocode
        ]);
    }

    public function update(Request $request, $id)
    {
        $promocode = PromoCode::find($id);
        $promocode->name = $request->name;
        $promocode->code = $request->code;
        $promocode->discount_percent = $request->discount_percent;
        $promocode->minimum_order = $request->minimum_order;
        $promocode->maximum_discount = $request->maximum_discount;
        $promocode->budget = $request->budget;
        $promocode->spent = $request->spent;
        $promocode->start_date = $request->start_date;
        $promocode->end_date = $request->end_date;
        $promocode->status = $request->status;
        $promocode->save();

        Toastr::success('PromoCode Updated');
        return redirect(route('promocode.list'));
    }
}
