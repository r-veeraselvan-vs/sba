<?php

namespace App\Http\Controllers\Admin;

use Brian2694\Toastr\Facades\Toastr;
use App\Category;
use App\Http\Controllers\Controller;
use Illuminate\Http\Request;

class CategoryController extends Controller
{
    public function list()
    {
        $categories = Category::orderBy('id', 'desc')->get();

        return view('admin.category.category_list')->with([
            'categories' => $categories
        ]);
    }

    public function save(Request $request)
    {
        if($request->has('image')){
            $folder = 'category/';   
            $image = $this->upload_image('IMG', $folder, $request->image);
        }else{
            $image = null;
        }

        if($request->has('home_image')){
            $folder = 'category/home/';   
            $home_image = $this->upload_image('IMG', $folder, $request->image);
        }else{
            $home_image = null;
        }
        
        $slug = $this->getUniqueSlug($request->category, 'category');

        $new = new Category();
        $new->slug = $slug;
        $new->category = $request->category;
        $new->image = $image;
        $new->home_image = $home_image;
        $new->status = $request->status;
        $new->save();

        Toastr::success('Category Added');
        return redirect(route('category.list'));
    }

    public function edit($id)
    {
        $category = Category::where('id', $id)->first();

        return view('admin.category.category_edit')->with([
            'category' => $category
        ]);
    }

    public function update(Request $request)
    {
        
        if($request->has('image')){
            $folder = 'category/';   
            $image = $this->upload_image('IMG', $folder, $request->image);
        }else{
            $image = $request->old_image;
        }
        
        if($request->has('home_image')){
            $folder = 'category/home/';   
            $home_image = $this->upload_image('IMG', $folder, $request->home_image);
        }else{
            $home_image = $request->old_home_image;
        }

        $slug = $this->getUniqueSlug($request->category, 'category');

        $old = Category::find($request->id);
        $old->slug = $slug;
        $old->category = $request->category;
        $old->image = $image;
        $old->home_image = $home_image;
        $old->status = $request->status;
        $old->save();

        Toastr::success('Category Updated');
        return redirect(route('category.list'));
    }
}
