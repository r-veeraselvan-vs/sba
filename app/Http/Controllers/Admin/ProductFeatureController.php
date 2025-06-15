<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\ProductFeature;
use Illuminate\Http\Request;
use Brian2694\Toastr\Facades\Toastr;

class ProductFeatureController extends Controller
{
    public function update(Request $request)
    {   
        if($request->data){
            foreach($request->data as $data){
                if($data['id'] == '0'){
                    $new = new ProductFeature();
                    $new->product_id        = $data['product_id'];
                    $new->feature           = $data['feature'];
                    $new->display_order     = $data['display_order'];
                    $new->status            = $data['status'];
                    $new->save();
                }else{
                    $old = ProductFeature::find($data['id']);
                    $old->feature       = $data['feature'];
                    $old->display_order = $data['display_order'];
                    $old->status        = $data['status'];
                    $old->save();
                }
            }
        }
        Toastr::success('Product Feature Updated');
        $page = $request->input('page') ?? 1;
        // return redirect(route('product.edit', [ 'id' => $request->id, 'tab' => 'feature' ]));
        return redirect()->route('product.edit', [
        'id' => $request->id,
        'tab' => 'feature',
        'page' => $page, // Include the page parameter in the redirect
    ])->with('success', 'Product feature updated successfully.');
    }

    public function delete($id, Request $request)
    {
        $product_id = ProductFeature::where('id', $id)->value('product_id');
        ProductFeature::where('id', $id)->delete();
        Toastr::success('Product Feature Deleted');
        $page = $request->input('page') ?? 1;
        // return redirect(route('product.edit', [ 'id' => $product_id, 'tab' => 'feature' ]));
        return redirect()->route('product.edit', [
        'id' => $product_id,
        'tab' => 'feature',
        'page' => $page, // Include the page parameter in the redirect
    ])->with('success', 'Product feature deleted   successfully.');
    }
}
