@extends('layouts.app')

@section('content')

<div style="margin-top:3rem">
    <div class="row justify-content-center">
        <div class="col-12">
            <div class="panel panel-default">
                <div class="panel-header">
                    <div class="row" style="margin-top: -1rem !important;">
                           <div class="col-md-4"><h4 class="page-header" style="margin-left: 10px; border-bottom: none"><b>Salary list (Case incentive for Staff enrolled in PF)</b></h4></div>
                            <div class="col-md-6 text-end" style="margin-top: 3rem !important;">
                            <div class="row">
                                <div class="col-md-8">
                                    <form method="GET" action="{{ request('month') ? route('reports.slwithpf', ['month' => request('month')]) : route('reports.slwithpf') }}" id="monthlyReport-form">
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

                <div class="panel-body" style="margin-top: -15px !important">
                     @if( Session::has( 'success' ))
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
                <th>SI.No</th>
                <th>Name of the Staff</th>
                <th>Total Cash</th>
                <th>Cash Incentive</th>
            </tr>
        </thead>
        <tbody>
                                        @php
                                            $totalAmount = 0;
                                            $totalincentive = 0;
                                        @endphp

            @foreach($staffs as $staff)
                    <?php 
                        $salaryCalculation =  \App\Models\SalaryCalculation::where('staff_id',$staff->id)->first();
                    ?>
                @if($salaryCalculation!=null)
                    <tr>
                        <td>{{ $loop->iteration }}</td> 
                       
                        @if($staff != null)
                            <td>{{ $staff->name }}</td>
                        @else
                            <td>-</td>
                        @endif
                        <?php 
                         if(request('month')!=null)
                                {
                                    $payslipwithpf = \App\Models\Payslipwithpf::where('staff_id', $salaryCalculation->staff_id)->where('month',request('month'))->orderBy('updated_at', 'desc')->first();
                                }
                                else
                                {
                                    $payslipwithpf = \App\Models\Payslipwithpf::where('staff_id', $salaryCalculation->staff_id)->orderBy('updated_at', 'desc')->first();
                                }
                                 $amount = ($payslipwithpf != null) ? $payslipwithpf->total_cash : 0;
                                $cashincentive = ($payslipwithpf != null) ? $payslipwithpf->incentive : 0;
                            $totalincentive += $cashincentive;
                            $totalAmount += $amount;
                        ?>
                        <td>{{ $amount }}</td>
                        <td>{{ $cashincentive }}</td>
                    </tr>
                @endif
            @endforeach
                                        <tr>
                                            <td colspan="2" style="text-align:right"><strong>Total</strong></td>
                                            <td>{{ $totalAmount }}</td>
                                            <td>{{ $totalincentive }}</td>
                                        </tr>
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