<?php

namespace App\Http\Controllers\Api\Rider;

use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Validator;
use Illuminate\Http\Request;
use App\OrderPickup;
use Auth;

class PickupController extends ResponseController
{
    public function upload(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'order_id' => 'required',
            'proof' => 'required|image'
        ]);
    
        if($validator->fails()){
            $error = $validator->errors()->first();
            return $this->sendResponse('Error', $error, 404, 'send-error');
        }
        $folder = 'order/pickup';   
        $image = $this->upload_image('PICKUP', $folder, $request->proof);

        $new = new OrderPickup();
        $new->order_id = $request->order_id;
        $new->proof = $image;
        $new->save();

        return $this->sendResponse($new,'Order Pickup Proof Uploaded Successfully', 200, 'send-data');
    }

    public function delete($id)
    {
        OrderPickup::where('id', $id)->delete();        
        return $this->sendResponse([],'Order Pickup Proof Deleted Successfully', 200, 'send-data');
    }
    
}
