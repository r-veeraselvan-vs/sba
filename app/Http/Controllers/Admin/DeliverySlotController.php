<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Brian2694\Toastr\Facades\Toastr;
use App\DeliverySlot;
use App\DeliveryArea;

class DeliverySlotController extends Controller
{
    public function list()
    {
        $slots = DeliverySlot::orderBy('id', 'desc')->get();
        $areas = DeliveryArea::orderBy('id', 'desc')->get();

        return view('admin.delivery-slot.delivery_slot_list')->with([
            'slots' => $slots,
            'areas' =>$areas
        ]);
    }

    public function save(Request $request)
    {
        $new = new DeliverySlot();
        $new->delivery_area_id = $request->delivery_area_id;
        $new->day = $request->day;
        $new->start = $request->start;
        $new->end = $request->end;
        $new->deliveries = $request->deliveries;
        $new->status = $request->status;
        $new->save();

        Toastr::success('Delivery Slot Added');
        return redirect(route('delivery.slot.list'));
    }

    public function edit($id)
    {
        $slot = DeliverySlot::where('id', $id)->first();
        $areas = DeliveryArea::orderBy('id', 'desc')->get();
        return view('admin.delivery-slot.delivery_slot_edit')->with([
            'slot' => $slot,
            'areas' =>$areas
        ]);
    }

    public function update(Request $request)
    {
        DeliverySlot::where('id', $request->id)->update([            
            'day'      => $request->day,
            'delivery_area_id' => $request->delivery_area_id,
            'start'    => $request->start,
            'end'    => $request->end,
            'deliveries'    => $request->deliveries,
            'status'     => $request->status
        ]);

        Toastr::success('Delivery Slot Updated');
        return redirect(route('delivery.slot.list'));
    }
}
