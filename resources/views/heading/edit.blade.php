@extends('layouts.app')

@section('content')
<div style="margin-top:3rem">

 <div class="row">
              <div class="col-12">
                <div class="panel panel-default">
                      
                  <div class="panel-heading">
                    <h4>Update Heading</h4>
                  </div>

                    <div class="panel-body">
                        <form method="POST" action="{{ route('heading.update', $heading->id) }}">
                            @csrf
                            @method('POST')
                            <div class="form-group row">
                                <label for="name" class="col-md-4 col-form-label text-md-right">Name</label>

                                <div class="col-md-6">
                                    <input id="name" type="text" class="form-control @error('name') is-invalid @enderror" name="name" value="{{ $heading->name }}" required autocomplete="name" autofocus>

                                    @error('name')
                                        <span class="invalid-feedback" role="alert">
                                            <strong>{{ $message }}</strong>
                                        </span>
                                    @enderror
                                </div>
                            </div>

                            <div class="form-group row">
                                <label for="status" class="col-md-4 col-form-label text-md-right">Status</label>

                                <div class="col-md-6">
                                    <select id="status" class="form-control @error('status') is-invalid @enderror" name="status" required>
                                        <option value="active" @if ($heading->status == 'active') selected @endif>Active</option>
                                        <option value="inactive" @if ($heading->status == 'inactive') selected @endif>Inactive</option>
                                    </select>

                                    @error('status')
                                        <span class="invalid-feedback" role="alert">
                                            <strong>{{ $message }}</strong>
                                        </span>
                                    @enderror
                                </div>
                            </div>

                            <div class="form-group row mb-0">
                                <div class="col-md-6 offset-md-4">
                                    <button type="submit" class="btn btn-primary">Save Changes</button>
                                    <a href="{{ route('heading.list') }}" class="btn btn-danger">Cancel</a>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection
