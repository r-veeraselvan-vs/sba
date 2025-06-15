<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use App\UserNotification;
use App\Notification;
use Auth;

class NotificationController extends ResponseController
{
    public function list(Request $request)
    {
    	$validator = Validator::make($request->all(), [
            'user_type' => 'required|in:Customer,Rider'
        ]);
    
        if($validator->fails()){
            $error = $validator->errors()->first();
            return $this->sendResponse([], $error, 404, 'send-error');
        }
        $user_id = Auth::user()->id;

        $data = UserNotification::with('notification')
        						->where('user_id', $user_id)
        						->where('notified_as', $request->user_type)
        						->where('deleted', 'No')
        						->orderBy('id', 'desc')
        						->get();
        return $this->sendResponse($data,'Notifications Listed Successfully', 200, 'send-data');
    }

    public function view($id)
    {
        $data = Notification::where('id', $id)->first();
        return $this->sendResponse($data,'Data Retrieved Successfully', 200, 'send-data');
    }

    public function read($id)
    {
        $data = UserNotification::where('id', $id)->first();
        if($data) {
            $data->read = 'Yes';
            $data->read_time = date('Y-m-d H:i:s');
            $data->save();

            return $this->sendResponse($data,'Read Status Updated', 200, 'send-data');    
        } else {
            return $this->sendResponse([],'Invalid ID', 404, 'send-error'); 
        }
    }

    public function delete($id)
    {
        $data = UserNotification::where('id', $id)->first();
        if($data) {
            $data->deleted = 'Yes';
            $data->deleted_time = date('Y-m-d H:i:s');
            $data->save();

            return $this->sendResponse($data,'Notification Deleted', 200, 'send-data');    
        } else {
            return $this->sendResponse([],'Invalid ID', 404, 'send-error'); 
        }
    }
}
