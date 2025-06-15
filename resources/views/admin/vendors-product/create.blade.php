@extends('layouts.app')
@section('content')
<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <div class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1 class="m-0 text-dark">Create Vendor Product</h1>
          </div>
        </div>
      </div>
    </div>
    <!-- /.content-header -->

    <div class="col-md-12">
            <div class="card">
              <div class="card-body">
                <div class="tab-content">
     <form method="POST" action="{{ route('vendors-product.save') }}">
        @csrf
        <div class="form-group">
            <label for="vendors_id">Vendor:</label>
            <select type="number" class="form-control" id="vendors_id" name="vendors_id" required>
            <?php
                $vendors = \App\Vendor::get();
            ?>
            <option value="">Select Vendor</option>
            @foreach($vendors as $vendor)
                <option value="{{$vendor->id}}">{{$vendor->name}}</option>
            @endforeach
            </select>
        </div>
         <div class="form-group">
            <label for="purchase_price">Item Name:</label>
            <input type="text" class="form-control" id="item_name" name="item_name" required>
        </div>
        <div class="form-group">
            <label for="purchase_price">Purchase Price:</label>
            <input type="text" class="form-control" id="purchase_price" name="purchase_price" required>
        </div>
        <div class="form-group">
            <label for="discount_to_customer">% Discount to Customer:</label>
            <input type="text" class="form-control" id="discount_to_customer" name="discount_to_customer" required>
        </div>
        <div class="form-group">
            <label for="margin_to_distribution">% Margin to Distribution:</label>
            <input type="text" class="form-control" id="margin_to_distribution" name="margin_to_distribution" required>
        </div>
        <div class="form-group">
            <label for="gst">GST:</label>
            <input type="text" class="form-control" id="gst" name="gst" min="0" required>
        </div>
        <div class="form-group">
            <label for="hsn_code">HSN Code:</label>
            <input type="text" class="form-control" id="hsn_code" name="hsn_code" required>
        </div>
        <div class="form-group">
            <label for="minimum_order">Number of Items:</label>
            <input type="number" class="form-control" id="minimum_order" name="minimum_order" min="1"  required>
        </div>
         <div class="form-group">
             <input type="hidden" class="form-control" id="quantity" name="quantity"  value="0">
        </div>
        <div class="form-group">
            <label for="expiry_date">Expiry Date:</label>
            <input type="date" class="form-control" id="expiry_date" name="expiry_date" min="{{date('Y-m-d')}}" required>
        </div>
        <div class="form-group">
            <label for="lot_no">Lot No:</label>
            <input type="text" class="form-control" id="lot_no" name="lot_no" required>
        </div>
        <button type="submit" class="btn btn-primary">Create</button>
    </form>
</div>
</div></div></div>
@endsection
