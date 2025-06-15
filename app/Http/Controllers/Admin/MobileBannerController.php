<?php

namespace App\Http\Controllers\Admin;

use App\MobileBanner;
use Brian2694\Toastr\Facades\Toastr;
use App\Http\Controllers\Controller;
use Illuminate\Http\Request;

class MobileBannerController extends Controller
{
    public function list()
    {
        $banners = MobileBanner::orderBy('display_order', 'asc')->get();

        return view('admin.mobile-banner.mobile_banner_list')->with([
            'banners' => $banners
        ]);
    }

    public function save(Request $request)
    {
        $folder = 'mobile-banners';   
        $image = $this->upload_image('IMG', $folder, $request->image);

        $new = new MobileBanner();
        $new->title = $request->title;
        $new->description = $request->description;
        $new->image = $image;
        $new->url = $request->url;
        $new->type = $request->type;
        $new->button_text = $request->button_text;
        $new->display_order = $request->display_order;
        $new->status = $request->status;
        $new->save();

        Toastr::success('Mobile Banner Added');
        return redirect(route('mobile.banner.list'));
    }
    
    public function edit($id)
    {
        $banner = MobileBanner::where('id', $id)->first();

        return view('admin.mobile-banner.mobile_banner_edit')->with([
            'banner' => $banner
        ]);
    }

    public function update(Request $request)
    {
        if($request->image){
            $folder = 'mobile-banners';   
            $image = $this->upload_image('IMG', $folder, $request->image);
        }else{
            $image = $request->old_image;
        }

        $old = MobileBanner::find($request->id);
        $old->title = $request->title;
        $old->description = $request->description;
        $old->image = $image;
        $old->url = $request->url;
        $old->type = $request->type;
        $old->button_text = $request->button_text;
        $old->display_order = $request->display_order;
        $old->status = $request->status;
        $old->save();

        Toastr::success('Mobile Banner Updated');
        return redirect(route('mobile.banner.list'));
    }
}
