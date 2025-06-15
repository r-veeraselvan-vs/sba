<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\ProductImage;
use Illuminate\Http\Request;
use Brian2694\Toastr\Facades\Toastr;

class ProductImageController extends Controller
{
    public function update(Request $request)
    {
        if($request->data){
            foreach($request->data as $data){
                if($data['id'] == '0'){
                    $folder = 'product/image';   
                    $image = $this->upload_image('IMG', $folder, $data['image']);

                    $new = new ProductImage();
                    $new->product_id          = $data['product_id'];
                    $new->image               = $image;
                    $new->matrix1             = $data['matrix1'];
                    $new->display_order       = $data['display_order'];
                    $new->status              = $data['status'];
                    $new->save();
                }else{
                    if(isset($data['image'])){
                        $folder = 'product/image';   
                        $image = $this->upload_image('IMG', $folder, $data['image']);
                    }else{
                        $image = $data['old_image'];
                    }
                    $old = ProductImage::find($data['id']);
                    $old->image         = $image;
                    $old->matrix1       = $data['matrix1'];
                    $old->display_order = $data['display_order'];
                    $old->status        = $data['status'];
                    $old->save();
                }
            }
        }
        Toastr::success('Product Image Updated');
        $page = $request->input('page') ?? 1;
        // return redirect(route('product.edit', [ 'id' => $request->id, 'tab' => 'image' ]));

        return redirect()->route('product.edit', [
        'id' => $request->id,
        'tab' => 'image',
        'page' => $page, // Include the page parameter in the redirect
    ])->with('success', 'Product Image updated successfully.');
    }

    public function delete($id, Request $request)
    {
        $product_id = ProductImage::where('id', $id)->value('product_id');
        ProductImage::where('id', $id)->delete();
        Toastr::success('Product Image Deleted');
        $page = $request->input('page') ?? 1;
        // return redirect(route('product.edit', [ 'id' => $product_id, 'tab' => 'image' ]));
        return redirect()->route('product.edit', [
        'id' => $product_id,
        'tab' => 'specification',
        'page' => $page, // Include the page parameter in the redirect
    ])->with('success', 'Product Image deleted   successfully.');
    }
}
