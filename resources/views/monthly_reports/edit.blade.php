@extends('layouts.app')

@section('content')

<div style="margin-top:3rem">
    <div class="row justify-content-center">
        <div class="col-12">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h4>Edit Payroll Generation</h4>
                  </div>
        <form method="POST" action="{{ route('monthly_reports.update', $monthlyReports->id) }}">
            @csrf
            @method('POST')
            <div class="row">
                <div class="col-md-12">

            <div class="col-md-6 form-group" style="margin-top:3rem">
                <label for="staff_id">Name</label>
                <select name="staff_id" id="staff_id" class="form-control" required>
                    <option value="">Select a Staff Name</option>
                    @foreach ($staff as $s)
                        <option value="{{ $s->id }}" {{ $s->id == $monthlyReports->staff_id ? 'selected' : '' }}>{{ $s->name }}</option>
                    @endforeach
                </select>
            </div>
@php
    $months = \App\Models\WorkingDays::distinct()->orderBy('month')->pluck('month')->sortBy(function($month) {
        return strtotime($month);
    });
@endphp
            <div class="col-md-6 form-group" style="margin-top:3rem">
                <label for="month">Month</label>
                <select name="month" class="form-control">
                    <option value="">Select Month</option>
                @foreach ($months as $month)
                    <option value="{{ date('F Y', strtotime($month)) }}" {{ (date('F Y', strtotime($month)) == $monthlyReports->month) ? 'selected' : '' }}>{{ date('F Y', strtotime($month)) }}</option>
                @endforeach
                </select>
            </div>
        <div class="col-md-6 form-group">
            <label for="leave_days">Leave Days</label>
            <input type="number" name="leave_days" id="leave_days" class="form-control" step="0.01" min="0" value="{{ $monthlyReports->leave_days }}" required>
        </div>
        <div class="col-md-6 form-group">
            <label for="ot_hours">OT Hours</label>
            <input type="number" name="ot_hours" id="ot_hours" class="form-control" step="0.01" min="0" value="{{ $monthlyReports->ot_hours }}" required>
        </div>
        <div class="col-md-6 form-group">
            <label for="holiday_work_days">Holiday Work Days</label>
            <input type="number" name="holiday_work_days" id="holiday_work_days" class="form-control" step="0.01" min="0" value="{{ $monthlyReports->holiday_work_days }}" required>
        </div>
        <div class="col-md-6 form-group">
            <label for="advance_received">Advance Received</label>
            <input type="number" name="advance_received" id="advance_received" class="form-control" min="0" value="{{ $monthlyReports->advance_received }}" required>
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