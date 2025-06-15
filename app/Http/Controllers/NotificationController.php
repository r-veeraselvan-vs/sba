<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Notification;
use App\UserNotification;
use App\User;
use App\Rider;
use App\Customer;
use App\UserTag;
use Brian2694\Toastr\Facades\Toastr;

class NotificationController extends Controller
{
    public function riderNotification($id)
    {
        $user_tags = [];
        $selected_tags = [];
        $users = User::where('id',$id)->get();

        return view('admin.notification.notification_create')->with([
            'users' => $users,
            'type' => 'single',
            'notified_as' => 'Rider',
            'user_tags' => $user_tags,
            'selected_tags' => $selected_tags
        ]);
    }

    public function customerNotification($id)
    {
        $user_tags = [];
        $selected_tags = [];
        $users = User::where('id',$id)->get();

        return view('admin.notification.notification_create')->with([
            'users' => $users,
            'type' => 'single',
            'notified_as' => 'Customer',
            'user_tags' => $user_tags,
            'selected_tags' => $selected_tags
        ]);
    }

    public function groupNotification($type)
    {
        if(ucfirst($type) == 'Group'){
            $user_tags = UserTag::groupBy('tag')->pluck('tag');
        }else{
            $user_tags = UserTag::where('type', ucfirst($type))->groupBy('tag')->pluck('tag');
        }

        $selected_tags = [];
        
        if($type == 'rider') {
        	$users = User::where('role', 'Rider')->orderBy('id','Asc')->get();	
        } else {
        	$users = User::where('role', 'Customer')->orderBy('id','Asc')->get();
        }

        return view('admin.notification.notification_create')->with([
            'users' => $users,
            'type' => 'group',
            'notified_as' => $type,
            'user_tags' => $user_tags,
            'selected_tags' => $selected_tags
        ]);
    }

    // public function groupNotificationTag($type, Request $request)
    // {
    //     if(ucfirst($type) == 'Group'){
    //         $user_tags = UserTag::groupBy('tag')->pluck('tag');
    //     }else{
    //         $user_tags = UserTag::where('type', ucfirst($type))->groupBy('tag')->pluck('tag');
    //     }
        
    //     $selected_tags = [];
    //     $filter = false;
    //     if($request->selected_tags){
    //         $selected_tags = $request->selected_tags;
    //         $user_ids = UserTag::whereIn('tag', $request->selected_tags)->pluck('user_id')->toArray();
    //         $filter = true;
    //     }

    //     if($type == 'rider') {
    //     	$q = Rider::with('user')->orderBy('id','Asc');
    //         if($filter == true){
    //             $q->whereIn('user_id', $user_ids);
    //         }
    //         $users = $q->get();
    //     } else {
    //     	$q = Customer::with('user')->orderBy('id','Asc');
    //         if($filter == true){
    //             $q->whereIn('user_id', $user_ids);
    //         }
    //         $users = $q->get();
    //     }

    //     return view('admin.notification.notification_create')->with([
    //         'users' => $users,
    //         'type' => 'group',
    //         'notified_as' => $type,
    //         'user_tags' => $user_tags,
    //         'selected_tags' => $selected_tags
    //     ]);
    // }

    // public function groupNotificationFromMap($type, Request $request)
    // {
    //     if(ucfirst($type) == 'Group'){
    //         $user_tags = UserTag::groupBy('tag')->pluck('tag');
    //     }else{
    //         $user_tags = UserTag::where('type', ucfirst($type))->groupBy('tag')->pluck('tag');
    //     }

    //     $selected_tags = [];

    //     $selected_riders = explode(',', $request->selected_riders);
    //     if($type == 'rider') {
    //     	$query = Rider::with('user');
    //         if(count($selected_riders) > 0){
    //             $query->whereIn('id', $selected_riders);
    //         }	
    //     	$users = $query->orderBy('id','Asc')->get();	
    //     } else {
    //     	$users = Customer::with('user')->orderBy('id','Asc')->get();
    //     }

    //     return view('admin.notification.notification_create')->with([
    //         'users' => $users,
    //         'type' => 'group',
    //         'notified_as' => $type,
    //         'user_tags' => $user_tags,
    //         'selected_tags' => $selected_tags
    //     ]);
    // }

    public function saveNotification(Request $request)
    {
        $this->validate($request, [
            'title' => 'required',
            'description' => 'required',
            'image' => 'nullable|image|mimes:jpg,jpeg,png',
            'users' => 'required'
        ]);

        $image = '';
        if($request->image){
            $folder = 'notification';   
            $image = $this->upload_image('IMAGE', $folder, $request->image);
        }
        
        $notification = new Notification();
            $notification->title = $request->title;
            $notification->body = $request->description;
            $notification->posted_on = date('Y-m-d H:i:s');
            $notification->image = $image;
        $notification->save();
        
        foreach($request->users as $user){
            $noti = new UserNotification;
            $noti->notification_id = $notification->id;
            $noti->user_id = $user;
            $noti->notified_as = $request->notified_as;
            $noti->save();

            $user_type = ucfirst($request->notified_as);
            $user_id = $user;
            $title = $request->title;
            $body = $request->description;
            $add_data = [
                'type' => '1',
                'title' => $request->title,
                'body' => $request->description,
                'image' => $notification->ImageUrl,
                'user_notification_id' => $noti->id,
                'notification_id' => $notification->id,
            ];
            $this->sendNotification($user_type, $user_id, $title, $body, $add_data);
        }

        Toastr::success('Notification Sent');
        switch ($request->notified_as) {
             case 'Customer':
                 return redirect()->route('customer.list');
                 break;
             case 'Rider':
                 return redirect()->route('rider.list');
                 break;
             default:
                 # code...
                 break;
         } 
    }
}
