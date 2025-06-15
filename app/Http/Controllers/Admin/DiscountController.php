<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Discount;
use App\Product;
use App\Category;
use Illuminate\Http\Request;

class DiscountController extends Controller
{
    public function index()
    {
        $discounts = Discount::all();
        $book = Product::get();

        // Decode JSON fields
        foreach ($discounts as $discount) {
            $discount->product_id = json_decode($discount->product_id) ?? [];
            $discount->category_id = json_decode($discount->category_id) ?? [];
        }

        // Fetch product names where the product_id is present in discounts
        $productIds = [];
        foreach ($discounts as $discount) {
            $productIds = array_merge($productIds, $discount->product_id);
        }

        // Remove duplicates and fetch product names
        $productIds = array_unique($productIds);
        $books = Product::whereIn('id', $productIds)->pluck('name', 'id');

        // Pass the discounts and books to the view
        return view('admin.discount.index', compact('discounts', 'books', 'book'));
    }

    public function store(Request $request)
    {
        $discount = new Discount();
        $discount->name = $request->name;
        $discount->persent = $request->persent;
        $discount->product_id = json_encode($request->input('product_id'));
        $discount->from_date = $request->from_date;
        $discount->to_date = $request->to_date;
        $discount->status = $request->status;
        $discount->save();

        return redirect()->route('discount.index')->with('success', 'Discount created successfully.');
    }

    public function edit($id)
    {
        $discount = Discount::find($id);
        $discount->product_id = json_decode($discount->product_id) ?? [];
        
        $books = Product::get();

        return view('admin.discount.edit', compact('discount', 'books'));
    } 

    public function update(Request $request, $id)
    {
        $discount = Discount::find($id);

        $discount->name = $request->input('name');
        $discount->persent = $request->input('persent');
        $discount->product_id = json_encode($request->input('product_id'));
        $discount->from_date = $request->input('from_date');
        $discount->to_date = $request->input('to_date');
        $discount->status = $request->input('status');

        $discount->save();

        return redirect()->route('discount.index')->with('success', 'Discount updated successfully');
    }   

    public function destroy($id)
    {
        $discount = Discount::findOrFail($id);
        $discount->delete();

        return redirect()->route('discount.index')->with('success', 'Discount deleted successfully.');
    }
}
