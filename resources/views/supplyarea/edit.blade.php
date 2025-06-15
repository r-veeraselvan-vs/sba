@extends('layouts.app')

@section('content')

<div style="margin-top:3rem">

 <div class="row">
              <div class="col-12">
                <div class="panel panel-default">
                      
                  <div class="panel-heading">
                    <h4>Update SupplyArea</h4>
                  </div>

                <div class="panel-body">
                  <!--Model update-->
                  <form method="POST" action="{{route('supplyarea.update')}}">
                      @csrf
                      <input type="hidden" name="id" value="{{$d->id}}">
                      <div class="col-md-12 form-group">
                        <label for="status" class="col-md-2 col-form-label text-md-right">{{ __('Name') }}</label>
                        <div class="col-md-10">
                          <input type="" name="name" value="{{$d->name}}"class="form-control">
                        </div>
                      </div>
                      <div class="col-md-12 form-group">
                        <label for="status" class="col-md-2 col-form-label text-md-right">{{ __('Status') }}</label>
                          <div class="col-md-10">
                            <select id="status" type="text" class="form-control" name="status">
                              <option value="">Select</option>
                                <option value="Y" @if("Y" == $d->status) selected @endif>Active</option>
                                <option value="N" @if("N" == $d->status) selected @endif>Inactive</option>
                            </select>
                          </div>
                      </div>
                    </div>
                    <br>
                    <div class="modal-footer">
                      <button type="submit" class="btn btn-primary">Update</button>
                    </div>
                  </form>
                </div>
            </div>
        </div>
    </div>
</div>

@endsection