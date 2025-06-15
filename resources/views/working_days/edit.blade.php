@extends('layouts.app')

@section('content')

<div style="margin-top:3rem">
    <div class="row justify-content-center">
        <div class="col-12">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h4>Edit Monthly Working Days</h4>
                  </div>
        <form method="POST" action="{{ route('working_days.update', $workingDays->id) }}">
            @csrf
            @method('POST')
            <div class="row">
                <div class="col-md-12">

            <div class="col-md-6 form-group" style="margin-top:3rem">
                <label for="month">Month</label>
                 <select name="month" class="form-control" required>
                @foreach (range(1, 12) as $m) 
                    
                    <option value="{{date('F Y', mktime(0, 0, 0, $m, 1))}}" {{ date('F Y', mktime(0, 0, 0, $m, 1)) ==$workingDays->month ? 'selected' : '' }}>{{date('F Y', mktime(0, 0, 0, $m, 1))}}</option>
                 @endforeach

                </select>
            </div>

        <div class="col-md-6 form-group" style="margin-top:3rem">
                <label for="total_days">Total Days</label>
                <input type="number" class="form-control" id="total_days" name="total_days" value="{{ $workingDays->total_days }}" required>
        </div>
        <div class="col-md-6 form-group">
                <label for="sundays">Sundays</label>
                <input type="number" class="form-control" id="sundays" name="sundays" value="{{ $workingDays->sundays }}" required>
        </div>
        <div class="col-md-6 form-group">
                <label for="holidays">Holidays</label>
                <input type="number" class="form-control" id="holidays" name="holidays" value="{{ $workingDays->holidays }}" required>
        </div>
        </div>

            <div class="form-group text-center">
                <button type="submit" class="btn btn-primary">Update</button>
            </div>
    </div>
</form>
</div>
</div>
</div>
</div>

@endsection