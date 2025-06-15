@extends('layouts.app')
@section('content')
<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <div class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1 class="m-0 text-dark">Vendor Products</h1>
          </div>
        </div>
      </div>
    </div>
    <!-- /.content-header -->

    <div class="col-md-12">
            <div class="card">
              <div class="card-body">
                <div class="tab-content">

                    <!-- main Service -->
                    <div class="tab-pane active">
                         <div class="add-button">
                             <a href="{{ route('vendors-product.create') }}" class="btn btn-primary mb-2">Add New</a>
                        </div>
                        <br>
   
    <table class="table table-bordered">
        <thead>
            <tr>
                <th>Vendor</th>
                <th>Item Name</th>
                <th>Purchase Price</th>
                <th>% Discount to Customer</th>
                <th>% Margin to Distribution</th>
                <th>GST</th>
                <th>HSN Code</th>
                <th>Minimum Order</th>
                <th>Expiry Date</th>
                <th>Lot No</th>
                <th>Action</th>
            </tr>
        </thead>
        <tbody>
            @foreach ($vendorsProducts as $vendorsProduct)
            <tr>
                <?php
                $vendors = \App\Vendor::where('id',$vendorsProduct->vendors_id)->first();
            ?>
                <td>{{ $vendors->name }}</td>
                 <td>{{ $vendorsProduct->item_name }}</td>
                <td>{{ $vendorsProduct->purchase_price }}</td>
                <td>{{ $vendorsProduct->discount_to_customer }}</td>
                <td>{{ $vendorsProduct->margin_to_distribution }}</td>
                <td>{{ $vendorsProduct->gst }}</td>
                <td>{{ $vendorsProduct->hsn_code }}</td>
                <td>{{ $vendorsProduct->minimum_order }}</td>
                <td>{{ $vendorsProduct->expiry_date }}</td>
                <td>{{ $vendorsProduct->lot_no }}</td>
                <td>
                    <a href="{{ route('vendors-product.edit', $vendorsProduct->id) }}" class="btn btn-primary btn-sm">Edit</a>
                    <form action="{{ route('vendors-product.destroy', $vendorsProduct->id) }}" method="POST" class="d-inline">
                        @csrf
                        @method('DELETE')
                        <button type="submit" class="btn btn-danger btn-sm" onclick="return confirm('Are you sure?')">Delete</button>
                    </form>
                </td>
            </tr>
            @endforeach
        </tbody>
    </table>
</div>
</div>
</div>
</div>
</div></div>
@endsection
