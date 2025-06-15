@extends('layouts.app')

@section('content')

<div style="margin-top:3rem">
    <div class="row justify-content-center">
        <div class="col-12">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h4>Create SupplyArea</h4>
                  </div>
                <div class="panel-body">
                    <form method="POST" action="save">
                        @csrf
                      <div class="row">
                     <div class="col-md-12 form-group">
                      <label>Name</label>
                        <input type="text" name="name" class="form-control" required="">
                    </div>
                    
                     <div class="col-md-12 form-group">
                      <label>Status</label>
                        <select name="status" class="form-control">
                        <option value="">Select</option>
                          <option value="Y">Active</option>
                          <option value="N">Inactive</option>
                        </select>
                    </div>
                  </div>
                      </div>
                      <br>
                      <div class="panel-footer">
                        <button type="submit" class="btn btn-primary">Add</button>
                      </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>

@endsection