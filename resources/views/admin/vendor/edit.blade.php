@extends('layouts.app')
@section('content')

  <div class="content-wrapper">
    <section class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1>Vendors</h1>
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
                <h3 class="card-title">Edit Vendor </h3>
              </div>
              <form role="form" method="post" class="col-md-6" action="{{ route('vendor.update') }}">
                  @csrf
                  <input type="hidden" name="id" value="{{ $user->id }}">
                <div class="card-body">
                  <div class="form-group">
                    <label for="exampleInputEmail1">Name</label>
                    <input type="text" class="form-control" name="name" placeholder="Enter Name" value="{{ old('name', $user->name) }}" onkeypress="return /[a-z,0-9, ]/i.test(event.key)" required>
                    @if ($errors->has('name')) 
                        <span class="error" for="site" style="display: inline-block;color:red;">{{ $errors->first('name') }}</span>
                    @endif
                  </div>
                   <div class="form-group">
                    <label for="exampleInputEmail1">Address</label>
                    <textarea   class="form-control" name="address" placeholder="Enter Address" value="{{ old('address') }}" required>{{$user->address}}</textarea>
                  </div>
                  <div class="form-group">
                    <label for="exampleInputEmail1">Contact Number</label>
                    <input type="text" class="form-control" name="mobile" placeholder="Enter Mobile" value="{{ old('mobile', $user->mobile) }}"  minlength="10" maxlength="10"   onkeypress="return /[0-9, ]/i.test(event.key)"  required>
                    @if ($errors->has('mobile')) 
                        <span class="error" for="site" style="display: inline-block;color:red;">{{ $errors->first('mobile') }}</span>
                    @endif
                  </div>
                    <div class="form-group">
                    <label for="exampleInputEmail1">GSTIN</label>
                    <input type="text" class="form-control" name="gst" placeholder="Enter GSTIN" value="{{ $user->gst }}" required>
                   
                  </div>
                   
                </div>

                <div class="card-footer">
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