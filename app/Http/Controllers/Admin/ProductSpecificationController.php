<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\ProductSpecification;
use Illuminate\Http\Request;
use Brian2694\Toastr\Facades\Toastr;

class ProductSpecificationController extends Controller
{
    public function update(Request $request)
    {   
        if($request->data){
            foreach($request->data as $data){
                if($data['id'] == '0'){
                    $new = new ProductSpecification();
                    $new->product_id        = $data['product_id'];
                    $new->name              = $data['name'];
                    $new->details           = $data['details'];
                    $new->display_order     = $data['display_order'];
                    $new->status            = $data['status'];
                    $new->save();
                }else{
                    $old = ProductSpecification::find($data['id']);
                    $old->name          = $data['name'];
                    $old->details       = $data['details'];
                    $old->display_order = $data['display_order'];
                    $old->status        = $data['status'];
                    $old->save();
                }
            }
        }
        Toastr::success('Product Specification Updated');
        $page = $request->input('page') ?? 1;
        // return redirect(route('product.edit', [ 'id' => $request->id, 'tab' => 'specification' ]));
        return redirect()->route('product.edit', [
        'id' => $request->id,
        'tab' => 'specification',
        'page' => $page, // Include the page parameter in the redirect
    ])->with('success', 'Product specification updated successfully.');
    }

    public function delete($id, Request $request)
    {
        $product_id = ProductSpecification::where('id', $id)->value('product_id');
        ProductSpecification::where('id', $id)->delete();
        Toastr::success('Product Specification Deleted');
        $page = $request->input('page') ?? 1;
        // return redirect(route('product.edit', [ 'id' => $product_id, 'tab' => 'specification' ]));
        return redirect()->route('product.edit', [
        'id' => $product_id,
        'tab' => 'specification',
        'page' => $page, // Include the page parameter in the redirect
    ])->with('success', 'Product specification deleted   successfully.');
    }
}
