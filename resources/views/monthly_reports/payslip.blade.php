@extends('layouts.app')

@section('content')
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-10">
                <div class="panel">
                    <div class="panel-header">
                    <div class="row" style="margin-top: 2rem !important;">
                           <div class="col-md-10"><h4 class="page-header" style="margin-left: 10px; border-bottom: none"><b>Calculate Payslip</b></h4></div>
                        
                       
                    </div>  
                </div>

                    <div class="panel-body">
                        <?php 
                            $department = \App\Models\Department::where('id',$staff->department_id)->first();
                            $salary = \App\Models\SalaryCalculation::where('staff_id',$staff->id)->first();
                            $months = \App\Models\MonthlyReport::where('staff_id',$staff->id)->where('month',$monthlyReport->month)->first();
                        ?>
                       @if($salary!=null)
                        
                       <form action="{{route('calculate.payslip')}}" method="POST">
                           @csrf
                           <input type="hidden" name="staff_id" value="{{$staff->id}}">
                           <input type="hidden" name="month" value="{{$months->month}}">
                         <table class="table table-bordered">
                            <tr>
                                <th>Name : </th>
                                <td>{{$staff->name}}</td>
                            </tr>
                             <tr>
                                <th>Department : </th>
                                <td>{{$department->name}}</td>
                            </tr>
                             <tr>
                                <th>Month : </th>
                                <td>{{$months->month}}</td>
                            </tr>
                             <tr>
                                <th>Gross Salary 1 : </th>
                                <td>{{$salary->gross_salary}}</td>
                            </tr>
                            <tr>
                                <th>Per Day Salary : </th>
                                <?php 
                                
                                    //$working_days = \App\Models\WorkingDays::where('month','=', $monthlyReport->month)->sum('total_days');
                                if($staff->pf_or_esi == 'Yes'){
                                    $working_days = 26;
                                } else {
                                    $working_days = 30;
                                }
                                    $per_day_salary = $salary->gross_salary / $working_days;
                                ?>
                                <td>Gross Salary 1 / No Of Working days = {{$salary->gross_salary}} / {{$working_days}} = <b><span style="font-family: DejaVu Sans; sans-serif;">&#8377;</span>{{round($per_day_salary)}}</b><br><br><input type="text" name="per_day_salary" readonly value="{{round($per_day_salary)}}" class="form-control"></td>
                            </tr>
                              <tr>
                                <th>Per Hour Salary : </th>
                                <?php 
                                
                                     $per_hour_salary = $per_day_salary / 10;
                                ?>
                                <td>Per Day Salary / 10 = {{round($per_day_salary)}} / 10 = <b><span style="font-family: DejaVu Sans; sans-serif;">&#8377;</span>{{round($per_hour_salary)}}</b><br><br><input type="text" name="per_hour_salary" readonly value="{{round($per_hour_salary)}}" class="form-control"></td>
                            </tr>
                             <tr>
                                <th>OT During WeekDays : </th>
                                 
                                <td>{{ $months->ot_hours}} hours</td>
                            </tr>
                            <tr>
                                <th>OT Pay : </th>
                                <?php 
                                
                                     $ot_pay = round($per_hour_salary) *  $months->ot_hours ;
                                ?>
                                <td> Per Hour Salary * OT Hours = {{round($per_hour_salary)}} * {{$months->ot_hours}} = <b><span style="font-family: DejaVu Sans; sans-serif;">&#8377;</span>{{round($ot_pay)}}</b><br><br><input type="text" name="ot_pay" readonly value="{{round($ot_pay)}}" class="form-control"></td>
                            </tr>
                            <tr>
                                <th>No Of Day Worked During Holidays  : </th>
                                
                                <td>{{ $months->holiday_work_days }}</td>
                            </tr>
                            <tr>
                                <th>Holiday Working Pay (double pay for holiday working)  : </th>
                                <?php 
                                
                                     $holiday_pay = $months->holiday_work_days *  2 *  round($per_day_salary);
                                ?>
                                <td>Worked During Holidays * 2 * Per day salary = {{$months->holiday_work_days}} *  2 * {{round($per_day_salary)}} = <b><span style="font-family: DejaVu Sans; sans-serif;">&#8377;</span>{{$holiday_pay}}</b><br><br><input type="text" name="holiday_pay" readonly value="{{$holiday_pay}}" class="form-control"></td>
                            </tr>
                            <tr>
                                <th>No of days leave taken ( 1 day leave allowed without loss of pay)  : </th>
   
                                <td>{{$months->leave_days}}</td>
                            </tr>
                             <tr>
                                <th>Deduction for leave  : </th>
                                <?php 
                                    $no_of_leave_days = $months->leave_days;
                                    if ($no_of_leave_days < 1) {
                                        $deduction_leave = 0;
                                    } else {
                                        $deduction_leave = ($no_of_leave_days - 1) * $per_day_salary;
                                    }
                                ?>
                                <td>(No of leave days - 1) * Per day salary = {{ ($no_of_leave_days - 1) }} *  {{ round($per_day_salary) }} = <b><span style="font-family: DejaVu Sans; sans-serif;">&#8377;</span>{{round($deduction_leave)}}</b><br><br><input type="text" name="deduction_leave" readonly value="{{round($deduction_leave)}}" class="form-control"></td>
                            </tr>
                            <tr>
                                <th>Bonus for not Taking Leave (If Leave days = 0 then bonus =  Per Day Salary if not bonus = 0) :</th>
                                <?php 
                                    $no_of_leave_days = $months->leave_days;
                                    if ($no_of_leave_days != 0) {
                                        $bonus = 0;
                                    } else {
                                        $bonus = $per_day_salary;
                                    }
                                ?>
                                <td>Bonus = Per Day Salary = <b><span style="font-family: DejaVu Sans; sans-serif;">&#8377;</span>{{ round($bonus) }}</b><br><br><input type="text" readonly value="{{ round($bonus) }}" class="form-control"></td>

                            </tr>
                             <tr>
                                <th>Gross Salary 2 : </th>
                                <?php 
                                
                                     $gross_salary =  $salary->gross_salary + $ot_pay + $holiday_pay - $deduction_leave;
                                ?>
                                <td> Gross salary 1 + OT pay + Holiday working pay - Deduction for leave = {{$salary->gross_salary}} + {{$ot_pay}} + {{round($holiday_pay)}} - {{round($deduction_leave)}} = <b><span style="font-family: DejaVu Sans; sans-serif;">&#8377;</span>{{round($gross_salary)}}</b><br><br><input type="text" name="gross_salary" readonly value="{{round($gross_salary)}}" class="form-control"></td>
                            </tr>
                             <tr>
                                <th>Advance Received  : </th>
   
                                <td>{{$months->advance_received}}</td>
                            </tr>
                            <tr>
                                <th>Net salary after deducting advance  : </th>
                                <?php 
                                
                                     $net_amount =  $gross_salary - $months->advance_received + $bonus;
                                ?>
                                <td> Gross salary 2 - Advance received + Bonus = {{round($gross_salary)}}  -  {{round($months->advance_received)}} + {{round($bonus)}}= <b><span style="font-family: DejaVu Sans; sans-serif;">&#8377;</span>{{round($net_amount)}}</b><br><br><input type="text" name="net_amount" readonly value="{{round($net_amount)}}" class="form-control"></td>
                            </tr>
                            <tr>
                                <th>CTC  : </th>
   
                                <td><span style="font-family: DejaVu Sans; sans-serif;">&#8377;</span> {{round($net_amount)}}</td>
                            </tr>
                        </table>
                        <div class="text-center">
                             <input type="submit" class="btn btn-primary" value="Submit">
                        </div>
                       
                        </form>
                           @else
                        
                        <div class="alert alert-danger">
                            <p>Must add salary details</p>
                        </div>
                        <div class="text-center">
                        <a href="{{route('salary-calculations.create')}}" class="btn btn-primary">Click</a>
                        </div>
                        @endif
                        
                       
                </div>
            </div>
        </div>
    </div>
@endsection