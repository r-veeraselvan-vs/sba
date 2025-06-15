@extends('layouts.app')

@section('content')

<div style="margin-top:1rem">
    <div class="row justify-content-center">
        <div class="col-12">
            <div class="panel panel-default">
                <div class="panel-header">
                    <div class="row" style="margin-top: -1rem !important;">
                        <div class="col-md-4">
                            <h4 class="page-header" style="margin-left: 10px; border-bottom: none"><b>List of PF Report</b></h4>
                        </div>
                        <div class="col-md-6 text-end" style="margin-top: 3rem !important;">
                            <div class="row">
                                <div class="col-md-8">
                                    <form method="GET" action="{{ request('month') ? route('reports.excel_report', ['month' => request('month')]) : route('reports.excel_report') }}" id="monthlyReport-form">
                                        <div class="form-group">
                                            <div class="row">
                                                <div class="col-md-12">
                                                    <label for="month" style="display: inline-block;">Filter by month:</label>
                                                    <select class="form-control" id="month" name="month" onchange="document.getElementById('monthlyReport-form').submit()" style="display: inline-block; width: auto;">
                                                        <option value="">All</option>
                                                        @php
                                                            $currentMonth = date('n');
                                                            $currentYear = date('Y');
                                                        @endphp

                                                        {{-- Last 11 months --}}
                                                        @for ($i = 11; $i >= 0; $i--)
                                                            @php
                                                                $date = date('F Y', mktime(0, 0, 0, $currentMonth - $i, 1, $currentYear));
                                                            @endphp
                                                            <option value="{{ $date }}" {{ (request('month') == $date) ? 'selected' : '' }}>
                                                                {{ $date }}
                                                            </option>
                                                        @endfor
                                                    </select>
                                                </div>
                                            </div>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-2 text-end" style="margin: 35px 0 20px;    border-bottom: none; margin-top: 3rem !important;">
                            <a onclick="exportTableToExcel('timesheet_dailyreport','report')" style="float:right;cursor: pointer;margin-right:10px" class="btn btn-primary"><i class="fa fa-download" aria-hidden="true" ></i> Download as Excel</a>  
                        </div>
                    </div>
                </div>

                <div class="panel-body" style="margin-top: -15px !important;">
                    @if(Session::has('success'))
                        <div class="alert alert-success alert-dismissible" role="alert">
                            <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                            {{ Session::get('success') }}
                        </div>
                    @endif

                    <div class="container-xl">
                        <div class="table-responsive">
                            <div class="table-wrapper">
                                <div class="table-title"></div>
                                <table class="table table-striped table-hover table-bordered" id="timesheet_dailyreport">
                                    <thead>
                                        <tr>
                                            <th>UAN Number</th>
                                            <th>Name</th>
                                            <th>Month</th>
                                            <th>Gross Salary</th>
                                            <th>EPF wages</th>
                                            <th>EPS wages</th>
                                            <th>EDLI wages</th>
                                            <th>EPF Contri Remitted</th>
                                            <th>EPS Contri Remitted</th>
                                            <th>EPF EPS Difference remitted</th>
                                            <th>NCP days</th>
                                            <th>Refund of Advances</th>
                                            <th>Action</th>
                                        </tr>
                                    </thead>
                                    <tbody id="departmentTableBody">
                                        @foreach($excel_report as $i => $er)
                                            @if(request('month') && $er->month !== date('F Y', strtotime(request('month'))))
                                                @continue
                                            @endif
                                            <tr>
                                                <td>{{ ($er != null) ? $er->uan_number : '-' }}</td>
                                                <td>{{ ($er != null) ? $er->name : '-'  }}</td>
                                                <td>{{ ($er != null) ? $er->month : '-' }}</td>
                                                <td>{{ ($er != null) ? $er->gross_salary : '-'  }}</td>
                                                <td>{{ ($er != null) ? $er->epf_wages : '-'  }}</td>
                                                <td>{{ ($er != null) ? $er->eps_wages : '-'  }}</td>
                                                <td>{{ ($er != null) ? $er->edli_wages : '-'  }}</td>
                                                <td>{{ ($er != null) ? $er->epf_contri_remitted : '-'  }}</td>
                                                <td>{{ ($er != null) ? $er->eps_contri_remitted : '-'  }}</td>
                                                <td>{{ ($er != null) ? $er->epf_eps_difference_remitted : '-'  }}</td>
                                                <td>{{ ($er != null) ? $er->ncp_days : '-'  }}</td>
                                                <td>{{ ($er != null) ? $er->refund_of_advances : '-'  }}</td>
                                                <td>
                                                    <a href="{{ route('reports.excel_report_edit', ['id' => $er->id]) }}"><i class="fa fa-edit" style="font-size:20px;color:blue"></i></a>&nbsp
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

<script>
    document.getElementById('month').addEventListener('change', function() {
        document.getElementById('monthlyReport-form').submit();
    });
</script>


@endsection
