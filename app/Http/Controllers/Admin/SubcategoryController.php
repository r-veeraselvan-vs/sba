<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Subcategory;
use App\Category;
use Brian2694\Toastr\Facades\Toastr;

class SubcategoryController extends Controller
{
    public function list()
    {
        $subcategories = Subcategory::with('category')->orderBy('id', 'desc')->get();
        $categories = Category::orderBy('id', 'asc')->get();

        return view('admin.subcategory.subcategory_list')->with([
            'subcategories' => $subcategories,
            'categories' => $categories,
        ]);
    }

    public function save(Request $request)
    {        
        $slug = $this->getUniqueSlug($request->subcategory, 'subcategory');

        $new = new Subcategory();
        $new->category_id = $request->category_id;
        $new->slug = $slug;
        $new->subcategory = $request->subcategory;
        $new->status = $request->status;
        $new->save();

        Toastr::success('Subcategory Added');
        return redirect(route('subcategory.list'));
    }

    public function edit($id)
    {
        $subcategory = Subcategory::where('id', $id)->first();
        $categories = Category::orderBy('id', 'asc')->get();

        return view('admin.subcategory.subcategory_edit')->with([
            'categories' => $categories,
            'subcategory' => $subcategory
        ]);
    }

    public function update(Request $request)
    {
        $slug = $this->getUniqueSlug($request->subcategory, 'subcategory');
        
        $old = Subcategory::find($request->id);
        $old->category_id = $request->category_id;
        $old->slug = $slug;
        $old->subcategory = $request->subcategory;
        $old->status = $request->status;
        $old->save();

        Toastr::success('Subcategory Updated');
        return redirect(route('subcategory.list'));
    }
}
