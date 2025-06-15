@extends('layouts.app')

@section('content')

<div class="container">
    <div class="row justify-content-center">
        <div class="col-md-8">
            <div class="card">
                <div class="card-header">Delete Department</div>

                <div class="card-body">
                  <!--Model Delete-->
                  <form method="GET" action="delete">
                      @csrf
                    <div class="modal-header"></div>
                    <div class="modal-body">
                      <div class="row"></div>
                      <input type="" style="visibility:hidden;" name="id" value="{{$d->id}}">
                      <h5>Are you want to detele this Department ?</h5>
                    <div class="modal-footer">        
                      <button type="submit" class="btn btn-danger">Delete</button>
                    </div>
                  </form>
                </div>

                <div class="card-footer">
                    <div class="text-end">
                        <a href="/home">Home</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

@endsection