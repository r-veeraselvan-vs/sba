@extends('layouts.app')
@section('content')

  <div class="content-wrapper">
    <section class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1>Users</h1>
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
                <h3 class="card-title">Edit Admin / Executive</h3>
              </div>
              <form role="form" method="post" class="col-md-6" action="{{ route('user.update') }}">
                  @csrf
                  <input type="hidden" name="id" value="{{ $user->id }}">
                <div class="card-body">
                  <div class="form-group">
                    <label for="exampleInputEmail1">Name</label>
                    <input type="text" class="form-control" name="name" placeholder="Enter Name" value="{{ old('name', $user->name) }}">
                    @if ($errors->has('name')) 
                        <span class="error" for="site" style="display: inline-block;color:red;">{{ $errors->first('name') }}</span>
                    @endif
                  </div>
                  <div class="form-group">
                    <label for="exampleInputEmail1">Mobile</label>
                    <input type="text" class="form-control" name="mobile" placeholder="Enter Mobile" value="{{ old('mobile', $user->mobile) }}">
                    @if ($errors->has('mobile')) 
                        <span class="error" for="site" style="display: inline-block;color:red;">{{ $errors->first('mobile') }}</span>
                    @endif
                  </div>
                  <div class="form-group">
                    <label for="exampleInputEmail1">Email address</label>
                    <input type="email" class="form-control" name="email" placeholder="Enter email" value="{{ old('email', $user->email) }}" readonly>
                    @if ($errors->has('email')) 
                        <span class="error" for="site" style="display: inline-block;color:red;">{{ $errors->first('email') }}</span>
                    @endif
                  </div>
                  <div class="form-group">
                    <label for="exampleInputPassword1">Role</label>
                    <select class="form-control" name="role" >
                        <option></option>
                        <option value="Super Admin" {{ ('Super Admin' == $user->role) ? 'selected' : '' }}>Super Admin</option>
                        <option value="Admin" {{ ('Admin' == $user->role) ? 'selected' : '' }}>Admin</option>
                        <option value="Riders" {{ ('Riders' == $user->role) ? 'selected' : '' }}>Riders</option>
                    </select>
                    @if ($errors->has('role')) 
                        <span class="error" for="site" style="display: inline-block;color:red;">{{ $errors->first('role') }}</span>
                    @endif
                  </div>
                  <div class="form-group">
                      <label for="exampleInputPassword1">Status</label>
                      <select class="form-control" name="status" >
                          <option value="Active" @if('Active' == $user->status) selected @endif>Active</option>
                          <option value="Inactive" @if('Inactive' == $user->status) selected @endif>Inactive</option>
                      </select>
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