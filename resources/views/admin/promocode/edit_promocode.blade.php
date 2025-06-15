@extends('layouts.app')
@section('content')

  <div class="content-wrapper">
    <section class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1>Edit Promo Code</h1>
          </div>
        </div>
      </div>
    </section>
    <section class="content">
      <div class="container-fluid">
        <div class="row">
          <div class="col-md-12">
            <div class="card card-primary">
              <div class="card-header">
                <h3 class="card-title">Edit</h3>
              </div>
              <form role="form" method="post" class="col-md-6" enctype="multipart/form-data" action="{{ route('promocode.update', ['id' => $promocode->id ]) }}">
                    @csrf

                    <div class="form-group">
                        <label for="exampleInputEmail1">Name</label>
                        <input type="text" required class="form-control" name="name" value="{{$promocode->name}}" placeholder="Enter Name">
                    </div>

                    <div class="form-group">
                        <label for="exampleInputEmail1">Code</label>
                        <input type="text" required class="form-control" name="code" value="{{$promocode->code}}" placeholder="Enter Code">
                    </div>
                    <div class="form-group">
                        <label for="exampleInputEmail1">Discount Percent</label>
                        <input type="text" required class="form-control" name="discount_percent" value="{{$promocode->discount_percent}}" placeholder="Enter Discount Percent">
                    </div>
                    <div class="form-group">
                        <label for="exampleInputEmail1">Minimum Order</label>
                        <input type="text" required class="form-control" name="minimum_order" value="{{$promocode->minimum_order}}" placeholder="Enter Minimum Order">
                    </div>
                    <div class="form-group">
                        <label for="exampleInputEmail1">Maximum Discount</label>
                        <input type="text" required class="form-control" name="maximum_discount" value="{{$promocode->maximum_discount}}" placeholder="Enter Maximum Discount">
                    </div>
                    <div class="form-group">
                        <label for="exampleInputEmail1">Budget</label>
                        <input type="text" required class="form-control" name="budget" value="{{$promocode->budget}}" placeholder="Enter Budget">
                    </div>
                    <div class="form-group">
                        <label for="exampleInputEmail1">Spent</label>
                        <input type="text" required class="form-control" readonly name="spent" value="{{$promocode->spent}}" placeholder="Enter Spent">
                    </div>
                    <div class="form-group">
                        <label for="exampleInputEmail1">Start Date</label>
                        <input type="date" required class="form-control" name="start_date" value="{{$promocode->start_date}}" placeholder="Enter Start Date">
                    </div>
                    <div class="form-group">
                        <label for="exampleInputEmail1">End Date</label>
                        <input type="date" required class="form-control" name="end_date" value="{{$promocode->end_date}}" placeholder="Enter End Date">
                    </div>
                    <div class="form-group">
                        <label for="exampleInputPassword1">Status</label>
                        <select class="form-control" name="status" >
                            <option value="Active" @if($promocode->status == 'Active') selected @endif>Active</option>
                            <option value="Inactive" @if($promocode->status == 'Inactive') selected @endif>Inactive</option>
                        </select>
                    </div>

                    <div class="card-footer" style="background-color: #ffff;">
                        <button type="submit" class="btn btn-primary">Update</button>
                    </div>
                </form>
            </div>
          </div>
        </div>
      </div>
    </section>
  </div>
@endsection