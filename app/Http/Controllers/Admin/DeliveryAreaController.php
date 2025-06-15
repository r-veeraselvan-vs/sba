<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Brian2694\Toastr\Facades\Toastr;
use App\DeliveryArea;
use App\DeliveryDay;
use App\DeliverySlot;

class DeliveryAreaController extends Controller
{
    public function list()
    {
        $areas = DeliveryArea::orderBy('id', 'desc')->get();

        return view('admin.delivery-area.delivery_area_list')->with([
            'areas' => $areas
        ]);
    }

    public function save(Request $request)
    {
        $new = new DeliveryArea();
        $new->pin_code = $request->pin_code;
        $new->area = $request->area;
        $new->delivery_charge = $request->delivery_charge;
        $new->status = $request->status;
        $new->save();

        $id = $new->id;
        if($request->days){
            foreach($request->days as $i => $day){
                $new = new DeliveryDay();
                $new->delivery_area_id = $id;
                $new->day = $i;
                $new->save();
            }
        }

        Toastr::success('Delivery Area Added');
        return redirect(route('delivery.area.list'));
    }

    public function edit($id, $tab)
    {
        $area = DeliveryArea::with('days')->where('id', $id)->first();
        $slots = DeliverySlot::where('delivery_area_id', $id)->orderBy('id', 'asc')->get();

        return view('admin.delivery-area.delivery_area_edit')->with([
            'area' => $area,
            'slots' => $slots,
            'tab' => $tab
        ]);
    }

    public function update(Request $request)
    {
        DeliveryArea::where('id', $request->id)->update([            
            'pin_code'      => $request->pin_code,
            'area'    => $request->area,
            'delivery_charge'    => $request->delivery_charge,
            'status'     => $request->status
        ]);
        
        DeliveryDay::where('delivery_area_id', $request->id)->delete();
        
        if($request->days){
            foreach($request->days as $i => $day){
                $new = new DeliveryDay();
                $new->delivery_area_id = $request->id;
                $new->day = $i;
                $new->save();
            }
        }

        Toastr::success('Delivery Area Updated');
        return redirect(route('delivery.area.edit', [ 'id' => $request->id, 'tab' => 'edit' ]));
    }

    
    public function updateSlots(Request $request)
    {
        if($request->data){
            foreach($request->data as $data){
                if($data['id'] == '0'){
                    $new = new DeliverySlot();
                    $new->delivery_area_id  = $data['delivery_area_id'];
                    $new->day               = $data['day'];
                    $new->start             = $data['start'];
                    $new->end               = $data['end'];
                    $new->deliveries        = $data['deliveries'];
                    $new->status            = $data['status'];
                    $new->save();
                }else{
                    $old = DeliverySlot::find($data['id']);
                    $old->day        = $data['day'];
                    $old->start      = $data['start'];
                    $old->end        = $data['end'];
                    $old->deliveries = $data['deliveries'];
                    $old->status     = $data['status'];
                    $old->save();
                }
            }
        }
        
        Toastr::success('Delivery Slot Updated');
        return redirect(route('delivery.area.edit', [ 'id' => $request->id, 'tab' => $request->tab ]));
    }
}
