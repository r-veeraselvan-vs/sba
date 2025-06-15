@extends('layouts.app')

@section('content')

<div style="margin-top:3rem">
    <div class="row justify-content-center">
        <div class="col-12">
            <div class="panel panel-default">
                <div class="panel-header">
                    <div class="row" style="margin-top: -1rem !important;">
                        <div class="col-md-10"><h4 class="page-header" style="margin-left: 10px; border-bottom: none"><b>List of Monthly Working Days</b></h4></div>
                        
                        <div class="col-md-2 text-end" style="margin: 35px 0 20px;    border-bottom: none; margin-top: 3rem !important;">
                            <a href="{{route('working_days.create')}}"><button class="btn btn-primary">Add</button></a>
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
                @if( Session::has( 'error' ))
          <div class="alert alert-warning alert-dismissible" role="alert">
  <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
  {{ Session::get('error') }}
</div>
@endif
                  
                    <div class="container-xl">
                        <div class="table-responsive">
                            <div class="table-wrapper">
                                <div class="table-title"></div>
                                <table class="table table-striped table-hover table-bordered">
        <thead>
            <tr>
                    <th>Month</th>
                    <th>Total No. of Days</th>
                    <th>No. of Sundays</th>
                    <th>No of Government Holidays</th>
                    <th>Actions</th>
            </tr>
        </thead>
        <tbody>
                @foreach($workingDays as $workingDay)
                    <tr>
                        <td>{{ $workingDay->month }}</td>
                        <td>{{ $workingDay->total_days }}</td>
                        <td>{{ $workingDay->sundays }}</td>
                        <td>{{ $workingDay->holidays }}</td>
                        <td>
                            <a href="{{ route('working_days.edit', ['id' => $workingDay->id ]) }}" ><i class="fa fa-edit" style="font-size:20px;color:blue"></i></a>&nbsp       
                            <a onclick="DeleteWorkingDays('{{$workingDay->id}}')"><i class="fa fa-trash" style="font-size:20px;color:red"></i></a>
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
        </div>
    </div>
</div>

@endsection