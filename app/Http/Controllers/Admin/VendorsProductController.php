<?php

namespace App\Http\Controllers\Admin;
use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\VendorsProduct;
use App\Product;
use App\ProductPrice;

class VendorsProductController extends Controller
{
    public function index()
    {
        $vendorsProducts = VendorsProduct::all();
        return view('admin.vendors-product.index', compact('vendorsProducts'));
    }

    public function create()
    {
        return view('admin.vendors-product.create');
    }

    public function save(Request $request)
    {
        $request->validate([
            'vendors_id' => 'required',
            'purchase_price' => 'required',
            'discount_to_customer' => 'required',
            'margin_to_distribution' => 'required',
            'gst' => 'required',
            'hsn_code' => 'required',
             'expiry_date' => 'required',
            'lot_no' => 'required',
        ]);
        
         VendorsProduct::create($request->all());

        return redirect()->route('vendors-product.list')->with('success', 'Record created successfully.');
    }

    public function edit($id)
    {
        $vendorsProduct = VendorsProduct::find($id);
        return view('admin.vendors-product.edit', compact('vendorsProduct'));
    }

    public function update(Request $request, $id)
    {
       // dd($request);
         $request->validate([
            'vendors_id' => 'required',
            'purchase_price' => 'required',
            'discount_to_customer' => 'required',
            'margin_to_distribution' => 'required',
            'gst' => 'required',
            'hsn_code' => 'required',
             'expiry_date' => 'required',
            'lot_no' => 'required'
        ]);
      
        $vendorsProduct = VendorsProduct::find($id);
        $vendorsProduct->update($request->all());
        
        return redirect()->route('vendors-product.list')->with('success', 'Record updated successfully.');
    }

    public function destroy($id)
    {
        $vendorsProduct = VendorsProduct::find($id);
        $vendorsProduct->delete();

        return redirect()->route('vendors-product.list')->with('success', 'Record deleted successfully.');
    }
}

