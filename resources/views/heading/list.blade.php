@extends('layouts.app')

@section('content')
    <div style="margin-top:1rem">
        <div class="row justify-content-center">
            <div class="col-12">
                <div class="panel panel-default">
                    <div class="panel-header">
                        
                         <div class="row" style="margin-top: -1rem !important;">
                           <div class="col-md-10"><h4 class="page-header" style="margin-left: 10px; border-bottom: none"><b>List of Headings</b></h4></div>
                        
                        <div class="col-md-2 text-end" style="margin: 35px 0 20px;    border-bottom: none; margin-top: 3rem !important;">
                             <a href="{{route('heading.create')}}"><button class="btn btn-primary">Add</button></a>
                        </div>
                    </div>  
                    
                       
                    </div>

                    <div class="panel-body" style="margin-top: -15px !important;">
                        @if( Session::has( 'success' ))
          <div class="alert alert-success alert-dismissible" role="alert">
  <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
  {{ Session::get('success') }}
</div>
        @endif
                        <table class="table table-striped table-hover table-bordered">
                            <thead>
                                <tr>
                                    <th>ID</th>
                                    <th>Name</th>
                                    <th>Status</th>
                                    <th>Action</th>
                                </tr>
                            </thead>
                            <tbody>
                                @foreach ($heading as $i=>$example)
                                    <tr>
                                        <td>{{ $i+1 }}</td>
                                        <td>{{ $example->name }}</td>
                                        <td>{{ $example->status }}</td>
                                        <td>
                                            <a href="{{ route('heading.edit', ['id' => $example->id ]) }}" ><i class="fa fa-edit" style="font-size:20px;color:blue"></i></a>&nbsp
                                            <a onclick="deleteHeading('{{$example->id}}')"><i class="fa fa-trash" style="font-size:20px;color:red"></i></a>
                                        </td>
                                    </tr>
                                @endforeach
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection
