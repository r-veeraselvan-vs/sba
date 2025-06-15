<?php

namespace App\Http\Controllers\Admin;

use App\Banner;
use Brian2694\Toastr\Facades\Toastr;
use App\Http\Controllers\Controller;
use Illuminate\Http\Request;

class BannerController extends Controller
{
    public function list()
    {
        $banners = Banner::orderBy('display_order', 'asc')->get();

        return view('admin.banner.banner_list')->with([
            'banners' => $banners
        ]);
    }

    public function save(Request $request)
    {
        $folder = 'banners';   
        $image = $this->upload_image('IMG', $folder, $request->image);

        $new = new Banner();
        $new->title = $request->title;
        $new->description = $request->description;
        $new->image = $image;
        $new->url = $request->url;
        $new->button_text = $request->button_text;
        $new->display_order = $request->display_order;
        $new->status = $request->status;
        $new->save();

        Toastr::success('Banner Added');
        return redirect(route('banner.list'));
    }
    
    public function edit($id)
    {
        $banner = Banner::where('id', $id)->first();

        return view('admin.banner.banner_edit')->with([
            'banner' => $banner
        ]);
    }

    public function update(Request $request)
    {
        if($request->image){
            $folder = 'banners';   
            $image = $this->upload_image('IMG', $folder, $request->image);
        }else{
            $image = $request->old_image;
        }

        $old = Banner::find($request->id);
        $old->title = $request->title;
        $old->description = $request->description;
        $old->image = $image;
        $old->url = $request->url;
        $old->button_text = $request->button_text;
        $old->display_order = $request->display_order;
        $old->status = $request->status;
        $old->save();

        Toastr::success('Banner Updated');
        return redirect(route('banner.list'));
    }
}
