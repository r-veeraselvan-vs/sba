<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Subcategory;
use App\Category;
use App\Type;
use Brian2694\Toastr\Facades\Toastr;

class TypeController extends Controller
{
    public function list()
    {
        $subcategories = Subcategory::orderBy('id', 'desc')->get();
        $categories = Category::orderBy('id', 'desc')->get();
        $types = Type::with('subcategory.category')->orderBy('id', 'desc')->get();

        return view('admin.type.type_list')->with([
            'subcategories' => $subcategories,
            'categories' => $categories,
            'types' => $types
        ]);
    }

    public function save(Request $request)
    {        
        $new = new Type();
        $new->subcategory_id = $request->subcategory_id;
        $new->type = $request->type;
        $new->status = $request->status;
        $new->save();

        Toastr::success('Type Added');
        return redirect(route('type.list'));
    }

    public function edit($id)
    {
        $subcategories = Subcategory::orderBy('id', 'desc')->get();
        $categories = Category::orderBy('id', 'desc')->get();
        $type = Type::with('subcategory.category')->where('id', $id)->first();

        return view('admin.type.type_edit')->with([
            'categories' => $categories,
            'subcategories' => $subcategories,
            'type' => $type
        ]);
    }

    public function update(Request $request)
    {
        $old = Type::find($request->id);
        $old->subcategory_id = $request->subcategory_id;
        $old->type = $request->type;
        $old->status = $request->status;
        $old->save();

        Toastr::success('Type Updated');
        return redirect(route('type.list'));
    }
}
