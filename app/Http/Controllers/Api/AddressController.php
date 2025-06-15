<?php

namespace App\Http\Controllers\Api;

use App\Address;
use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;

class AddressController extends ResponseController
{
    public function add(Request $request)
    {

        $validator = Validator::make($request->all(), [
            'user_id' => 'required|exists:users,id',
            'short_name' => 'required',
            'building_name' => 'required',
            'route' => 'required',
            'contact_number' => 'required',
            'address' => 'required',
            'latitude' => 'required',
            'longitude' => 'required',
            'default' => 'required|in:Yes,No',
            'city' => 'required',
            'postcode' => 'required',
        ]);

        if($validator->fails()){
            $error = $validator->errors()->first();
            return $this->sendResponse('Error', $error, 404, 'send-error');
        }

        // If Default Address = Yes, Set remaining address as No
        if($request->default == 'Yes'){
            Address::where('user_id',$request->user_id)->update([
                'default' => 'No'
            ]);
        }

        $address = new Address();
        $address->user_id = $request->user_id;
        $address->short_name = $request->short_name;
        $address->building_name = $request->building_name;
        $address->route = $request->route;
        $address->contact_number = $request->contact_number;
        $address->address = $request->address;
        $address->latitude = $request->latitude;
        $address->longitude = $request->longitude;
        $address->default = $request->default;
        $address->city = $request->city;
        $address->postcode = $request->postcode;
        $address->save();

        $data= Address::where('id',$address->id)->first();
        if($data == null)
        {
             return $this->sendResponse([],'No data Found', 404, 'send-error');
        }else
        {
            return $this->sendResponse($data,'Address Added Successfully', 200, 'send-data');
        }
    }

    public function update(Request $request)
    {

        $validator = Validator::make($request->all(), [
            'address_id' => 'required|exists:addresses,id',
            'latitude' => 'required',
            'longitude' => 'required',
            'default' => 'required|in:Yes,No',
        ]);

        if($validator->fails()){
            $error = $validator->errors()->first();
            return $this->sendResponse('Error', $error, 404, 'send-error');
        }

        // If Default Address = Yes, Set remaining address as No
        $address = Address::where('id', $request->address_id)->first();
        if($request->default == 'Yes'){
            Address::where('user_id',$address->user_id)->update([
                'default' => 'No'
            ]);
        }

        $old = Address::find($request->address_id);
        $old->latitude = $request->latitude;
        $old->longitude = $request->longitude;
        $old->default = $request->default;

        if($request->short_name != ''){
            $old->short_name = $request->short_name;
        }

        if($request->building_name != ''){
            $old->building_name = $request->building_name;
        }

        if($request->route != ''){
            $old->route = $request->route;
        }

        if($request->contact_number != ''){
            $old->contact_number = $request->contact_number;
        }

        if($request->address != ''){
            $old->address = $request->address;
        }

        if($request->city != ''){
            $old->city = $request->city;
        }

        if($request->postcode != ''){
            $old->postcode = $request->postcode;
        }
        $old->save();

        $data = Address::where('id',$request->address_id)->first();

        if($data == null)
        {
             return $this->sendResponse([],'No data Found', 404, 'send-error');
        }else
        {
            return $this->sendResponse($data,'Address Updated Successfully', 200, 'send-data');
        }
    }


    public function list(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'user_id' => 'required|exists:users,id'
        ]);

        if($validator->fails()){
            $error = $validator->errors()->first();
            return $this->sendResponse('Error', $error, 404, 'send-error');
        }

        $data= Address::where('user_id',$request->user_id)->get();

        if($data == null)
        {
            return $this->sendResponse([],'No data Found', 404, 'send-error');
        }
        
        return $this->sendResponse($data,'Data Retrieved Successfully', 200, 'send-data');
    }

}
