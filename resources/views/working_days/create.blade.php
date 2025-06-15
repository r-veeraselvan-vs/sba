@extends('layouts.app')

@section('content')

<div style="margin-top:3rem">
    <div class="row justify-content-center">
        <div class="col-12">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h4>Create Monthly Working Days</h4>
                  </div>
       <form method="POST" action="{{ route('working_days.save') }}">
            @csrf
            <div class="row">
                <div class="col-md-12">

        <div class="col-md-6 form-group" style="margin-top:3rem">
                <label for="month">Month</label>
                 <select name="month" class="form-control">
                @foreach (range(1, 12) as $m) 
                    
                    <option value="{{date('F Y', mktime(0, 0, 0, $m, 1))}}" >{{date('F Y', mktime(0, 0, 0, $m, 1))}}</option>
                 @endforeach

                </select>
        </div>
        <div class="col-md-6 form-group" style="margin-top:3rem">
                <label for="total_days">Total Days</label>
                <input type="number" class="form-control" id="total_days" name="total_days" required>
        </div>
        <div class="col-md-6 form-group">
                <label for="sundays">Sundays</label>
                <input type="number" class="form-control" id="sundays" name="sundays" required>
        </div>
        <div class="col-md-6 form-group">
                <label for="holidays">Holidays</label>
                <input type="number" class="form-control" id="holidays" name="holidays" required>
        </div>
    </div>
    
        <div class="form-group text-center">
            <button type="submit" class="btn btn-primary">Submit</button>
            <a href="{{ route('working_days.list')}}" type="button" class="btn btn-danger">Cancel</a>
        </div>
</div>
    </form>
</div>
</div>
</div>
</div>
@endsection

 