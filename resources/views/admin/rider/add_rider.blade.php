@extends('layouts.app')
@section('content')

  <div class="content-wrapper">
    <section class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1>Add Rider</h1>
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
                <h3 class="card-title">Create Rider</h3>
              </div>
              <form role="form" method="post" class="col-md-6" action="{{ route('rider.save') }}">
                  @csrf
                <div class="card-body">
                  <div class="form-group">
                    <label for="exampleInputEmail1">Name</label>
                    <input type="text" class="form-control" name="name" placeholder="Enter Name" value="{{ old('name') }}">
                    @if ($errors->has('name')) 
                        <span class="error" for="site" style="display: inline-block;color:red;">{{ $errors->first('name') }}</span>
                    @endif
                  </div>
                  <div class="form-group">
                    <label for="exampleInputEmail1">Mobile</label>
                    <input type="text" class="form-control" name="mobile" placeholder="Enter Mobile" value="{{ old('mobile') }}">
                    @if ($errors->has('mobile')) 
                        <span class="error" for="site" style="display: inline-block;color:red;">{{ $errors->first('mobile') }}</span>
                    @endif
                  </div>
                  <div class="form-group">
                    <label for="exampleInputEmail1">Email address</label>
                    <input type="email" class="form-control" name="email" placeholder="Enter email" value="{{ old('email') }}">
                    @if ($errors->has('email')) 
                        <span class="error" for="site" style="display: inline-block;color:red;">{{ $errors->first('email') }}</span>
                    @endif
                  </div>
                  <div class="form-group">
                    <label for="exampleInputPassword1">Password</label>
                    <input type="password" class="form-control" name="password" placeholder="Password">
                    @if ($errors->has('password')) 
                        <span class="error" for="site" style="display: inline-block;color:red;">{{ $errors->first('password') }}</span>
                    @endif
                  </div>
                  
                </div>

                <div class="card-footer">
                  <button type="submit" class="btn btn-primary">Create</button>
                </div>
              </form>
            </div>
          </div>
        </div>
      </div>
    </section>
  </div>
@endsection