<?php

namespace App\Http\Controllers\Api\Rider;

use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Validator;
use Illuminate\Http\Request;
use App\OrderDelivery;
use Auth;

class DeliveryController extends ResponseController
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
        $folder = 'order/delivery';   
        $image = $this->upload_image('DELIVERY', $folder, $request->proof);

        $new = new OrderDelivery();
        $new->order_id = $request->order_id;
        $new->proof = $image;
        $new->save();

        return $this->sendResponse($new,'Order Delivery Proof Uploaded Successfully', 200, 'send-data');
    }

    public function delete($id)
    {
        OrderDelivery::where('id', $id)->delete();        
        return $this->sendResponse([],'Order Delivery Proof Deleted Successfully', 200, 'send-data');
    }
    
}
