@extends('layouts.app')

@section('content')
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-10">
                <div class="panel">
                    <div class="panel-header">
                    <div class="row" style="margin-top: 2rem !important;">
                           <div class="col-md-10"><h4 class="page-header" style="margin-left: 10px; border-bottom: none"><b>Calculate Payslip with PF</b></h4></div>
                        
                       
                    </div>  
                </div>

                    <div class="panel-body">
                        <?php 
                            $department = \App\Models\Department::where('id',$staff->department_id)->first();
                            $salary = \App\Models\SalaryCalculation::where('staff_id',$staff->id)->first();
                            $months = \App\Models\MonthlyReport::where('staff_id',$staff->id)->where('month',$monthlyReport->month)->first();
                        ?>
                       
                       @if($salary!=null)
                       <form action="{{route('calculate.payslipwithpf')}}" method="POST">
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
                                <th>No. Of Working Days : </th>
                                <?php
                                    //$working_days = \App\Models\WorkingDays::where('month','=', $monthlyReport->month)->sum('total_days');
                                    //$no_of_sundays = \App\Models\WorkingDays::where('month','=', $monthlyReport->month)->sum('sundays');
                                    //$no_of_working_days = $working_days - $no_of_sundays;
                                if($staff->pf_or_esi == 'Yes'){
                                    $no_of_working_days = 26;
                                } else {
                                    $no_of_working_days = 30;
                                }
                                ?>
                                <td><input type="text" name="no_of_working_days" readonly value="{{$no_of_working_days}}" class="form-control"></td>
                            </tr>
                             <tr>
                                <th>Gross Salary 1 : </th>
                                <td>{{$salary->gross_salary}}</td>
                            </tr>
                             <tr>
                                <th>Basic : </th>
                                <td>{{$salary->basic}}</td>
                            </tr>
                             <tr>
                                <th>DA : </th>
                                <td>{{$salary->da}}</td>
                            </tr>
                             <tr>
                                <th>Other Allowances : </th>
                                <td>{{$salary->other_allowances}}</td>
                            </tr>
                            <tr>
                                <th>HRA : </th>
                                <td>{{$salary->hra}}</td>
                            </tr>
                            <tr>
                                <th>Total : </th>
                                <?php
                                    $total = $salary->basic + $salary->da + $salary->other_allowances;
                                    $basic = $salary->basic ?? 0;
                                    $da = $salary->da ?? 0;
                                    $other_allowances = $salary->other_allowances ?? 0;

                                    $total = $basic + $da + $other_allowances;
                                ?>
                                <td> Basic + DA + Other Allowances = {{$basic}} + {{$da}} + {{$other_allowances}} = <b><span style="font-family: DejaVu Sans; sans-serif;">&#8377;</span>{{round($total)}}</b><br><br><input type="text" name="total" readonly value="{{round($total)}}" class="form-control"></td>
                            </tr>
                            <tr>
                                <th>Per Day Salary : </th>
                                <?php 
                                    $per_day_salary = ($basic + $da + $other_allowances) / $no_of_working_days;
                                ?>
                                <td>(Basic + DA + Other Allowances) / No Of Working days = ( {{$basic}} + {{$da}} + {{$other_allowances}}) / {{$no_of_working_days}} = <b><span style="font-family: DejaVu Sans; sans-serif;">&#8377;</span>{{round($per_day_salary)}}</b><br><br><input type="text" name="per_day_salary" readonly value="{{round($per_day_salary)}}" class="form-control"></td>
                            </tr>
                            <tr>
                                <th>Per Hour Salary : </th>
                                <?php 
                                
                                     $per_hour_salary = $per_day_salary / 8;
                                ?>
                                <td>Per Day Salary / 8 = {{round($per_day_salary)}} / 8 = <b><span style="font-family: DejaVu Sans; sans-serif;">&#8377;</span>{{round($per_hour_salary)}}</b><br><br><input type="text" name="per_hour_salary" readonly value="{{round($per_hour_salary)}}" class="form-control"></td>
                            </tr>
                            <tr>
                                <th>No of days leave taken ( 1 day leave allowed without loss of pay) : </th>
   
                                <td>{{$months->leave_days}}</td>
                            </tr>
                             <tr>

                                <th>Deduction for leave:</th>
                                <?php 
                                    $no_of_leave_days = $months->leave_days;
                                    if ($no_of_leave_days < 1) {
                                        $deduction_for_leave = 0;
                                    } else {
                                        $deduction_for_leave = ($no_of_leave_days - 1) * $per_day_salary;
                                    }
                                ?>
                                <td>(No of leave days - 1) * Per day salary = {{ ($no_of_leave_days - 1) }} *  {{ round($per_day_salary) }} = <b><span style="font-family: DejaVu Sans; sans-serif;">&#8377;</span>{{ round($deduction_for_leave) }}</b><br><br><input type="text" name="deduction_for_leave" readonly value="{{ round($deduction_for_leave) }}" class="form-control"></td>

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
                                    $other_allowances = $salary->other_allowances ?? 0;
                                    $gross_salary = $salary->basic + $salary->da + $other_allowances - $deduction_for_leave;
                                ?>
                                <td> Basic + DA + Other Allowances - Deduction for leave = ({{$salary->basic}} + {{$salary->da}} + {{$other_allowances}}) - {{round($deduction_for_leave)}} = <b><span style="font-family: DejaVu Sans; sans-serif;">&#8377;</span>{{round($gross_salary)}}</b><br><br><input type="text" name="gross_salary" readonly value="{{round($gross_salary)}}" class="form-control"></td>
                            </tr>
                            <tr>
                                <th>Employee Contribution To PF : </th>
                                <?php 
                                    $gross_salary = ($gross_salary > 15000) ? 15000 : $gross_salary;
                                    $employee_contribution_to_pf =  (12 / 100) * $gross_salary;
                                ?>
                                <td> (12 / 100) * Gross Salary 2 = (12 / 100) * {{round($gross_salary)}} = <b><span style="font-family: DejaVu Sans; sans-serif;">&#8377;</span>{{round($employee_contribution_to_pf)}}</b><br><br><input type="text" name="employee_contribution_to_pf" readonly value="{{round($employee_contribution_to_pf)}}" class="form-control"></td>
                            </tr>
                            <tr>
                                <th>Employee Contribution To ESI : </th>
                                <?php 
                                    if ($salary->gross_salary >= 21000) {
                                        $employee_contribution_to_esi = 0;
                                    } else {
                                        $employee_contribution_to_esi =  (0.75 / 100) * $gross_salary;
                                    }
                                ?>
                                <td> (0.75 / 100) * Gross Salary 2 = (0.75 / 100) * {{round($gross_salary)}} = <b><span style="font-family: DejaVu Sans; sans-serif;">&#8377;</span>{{round($employee_contribution_to_esi)}}</b><br><br><input type="text" name="employee_contribution_to_esi" readonly value="{{round($employee_contribution_to_esi)}}" class="form-control"></td>
                            </tr>
                            <tr>
                                <th>Advance Received  : </th>
   
                                <td>{{$months->advance_received}}</td>
                            </tr>
                            <tr>
                                <th>Net Salary : </th>
                                <?php
                                $gross_salary2 =  $salary->basic + $salary->da + $salary->other_allowances - $deduction_for_leave;
                                    $net_salary = $gross_salary2 - $employee_contribution_to_pf - $employee_contribution_to_esi;
                                ?>
                                <td> Gross Salary 2 - Employee Contribution To PF - Employee Contribution To ESI = {{round($gross_salary2)}} - {{round($employee_contribution_to_pf)}} - {{round($employee_contribution_to_esi)}} = <b><span style="font-family: DejaVu Sans; sans-serif;">&#8377;</span>{{round($net_salary)}}</b><br><br><input type="text" name="net_salary" readonly value="{{round($net_salary)}}" class="form-control"></td>
                            </tr>
                            <tr>
                                <th>Net salary after deducting advance  : </th>
                                <?php 
                                     $net_amount =  $net_salary - $months->advance_received;
                                ?>
                                <td> Net salary - Advance received = {{round($net_salary)}}  - {{round($months->advance_received)}} = <b><span style="font-family: DejaVu Sans; sans-serif;">&#8377;</span>{{round($net_amount)}}</b><br><br><input type="text" name="net_amount" readonly value="{{round($net_amount)}}" class="form-control"></td>
                            </tr>
                            <tr>
                                <th>Pension Contribution by Employer:</th>
                                <?php
                                $gross_salary = ($gross_salary > 15000) ? 15000 : $gross_salary;
                                $pension_contribution = (8.33 / 100) * $gross_salary;
                                ?>
                                <td>(8.33 / 100) * Gross Salary 2 = (8.33 / 100) * {{ round($gross_salary) }} = <b><span style="font-family: DejaVu Sans; sans-serif;">&#8377;</span>{{ round($pension_contribution) }}</b><br><br><input type="text" name="pension_contribution" readonly value="{{ round($pension_contribution) }}" class="form-control"></td>
                            </tr>
                            <tr>
                                <th>PF Contribution by Employer : </th>
                                <?php 
                                    $pf_contribution =  (3.67 / 100) * $gross_salary;
                                ?>
                                <td> (3.67 / 100) * Gross Salary 2 = (3.67 / 100) * {{round($gross_salary)}} = <b><span style="font-family: DejaVu Sans; sans-serif;">&#8377;</span>{{round($pf_contribution)}}</b><br><br><input type="text" name="pf_contribution" readonly value="{{round($pf_contribution)}}" class="form-control"></td>
                            </tr>
                            <tr>
                                <th>EDL Insurance Contribution by Employer : </th>
                                <?php 
                                    $edl_insurance_contribution =  (0.5 / 100) * $gross_salary;
                                ?>
                                <td> (0.5 / 100) * Gross Salary 2 = (0.5 / 100) * {{round($gross_salary)}} = <b><span style="font-family: DejaVu Sans; sans-serif;">&#8377;</span>{{round($edl_insurance_contribution)}}</b><br><br><input type="text" name="edl_insurance_contribution" readonly value="{{round($edl_insurance_contribution)}}" class="form-control"></td>
                            </tr>
                            <tr>
                                <th>PF Administration Charges by Employer : </th>
                                <?php 
                                    $pf_administration_charges =  (0.5 / 100) * $gross_salary;
                                ?>
                                <td> (0.5 / 100) * Gross Salary 2 = (0.5 / 100) * {{round($gross_salary)}} = <b><span style="font-family: DejaVu Sans; sans-serif;">&#8377;</span>{{round($pf_administration_charges)}}</b><br><br><input type="text" name="pf_administration_charges" readonly value="{{round($pf_administration_charges)}}" class="form-control"></td>
                            </tr>
                            <tr>
                                <th>Employers Contribution To PF : </th>
                                <?php 
                                    $employers_contribution_to_pf =  $pension_contribution + $pf_contribution + $edl_insurance_contribution + $pf_administration_charges;
                                ?>
                                <td> Pension Contribution + PF Contribution + EDL Insurance Contribution + PF Administration Charges = {{round($pension_contribution,2)}} + {{round($pf_contribution,2)}} + {{round($edl_insurance_contribution,2)}} + {{round($pf_administration_charges)}} = <b><span style="font-family: DejaVu Sans; sans-serif;">&#8377;</span>{{round($employers_contribution_to_pf)}}</b><br><br><input type="text" name="employers_contribution_to_pf" readonly value="{{round($employers_contribution_to_pf)}}" class="form-control"></td>
                            </tr>
                            <tr>
                                <th>Employers Contribution To ESI : </th>
                                <?php 
                                    if ($salary->gross_salary >= 21000) {
                                        $employers_contribution_to_esi = 0;
                                    } else {
                                        $employers_contribution_to_esi =  (3.25 / 100) * $gross_salary;
                                    }
                                ?>    
                                <td> (3.25 / 100) * Gross Salary 2 = (3.25 / 100) * {{round($gross_salary)}} = <b><span style="font-family: DejaVu Sans; sans-serif;">&#8377;</span>{{round($employers_contribution_to_esi)}}</b><br><br><input type="text" name="employers_contribution_to_esi" readonly value="{{round($employers_contribution_to_esi)}}" class="form-control"></td>
                            </tr>
                            <tr>
                                <th>Total Amount Paid to PF : </th>
                                <?php
                                    $total_amount_paid_to_pf = $employee_contribution_to_pf + $employers_contribution_to_pf;
                                ?>
                                <td> Employee Contribution to PF + Employers Contribution to PF = {{round($employee_contribution_to_pf)}} + {{round($employers_contribution_to_pf)}} = <b><span style="font-family: DejaVu Sans; sans-serif;">&#8377;</span>{{round($total_amount_paid_to_pf)}}</b><br><br><input type="text" name="total_amount_paid_to_pf" readonly value="{{round($total_amount_paid_to_pf)}}" class="form-control"></td>
                            </tr>
                            <tr>
                                <th>Total Amount Paid to ESI : </th>
                                <?php
                                    $total_amount_paid_to_esi = $employee_contribution_to_esi + $employers_contribution_to_esi;
                                ?>
                                <td> Employee Contribution to ESI + Employers Contribution to ESI = {{round($employee_contribution_to_esi)}} + {{round($employers_contribution_to_esi)}} = <b><span style="font-family: DejaVu Sans; sans-serif;">&#8377;</span>{{round($total_amount_paid_to_esi)}}</b><br><br><input type="text" name="total_amount_paid_to_esi" readonly value="{{round($total_amount_paid_to_esi)}}" class="form-control"></td>
                            </tr>
                                
                            <tr>
                                <th>Cash <br> 
                                Incentive : </th>
                                <?php
                                    $incentive = $salary->gross_salary - $total + $bonus;
                                ?>
                                <td><br> Gross Salary 1 - Total + Bonus = {{$salary->gross_salary}} - {{$total}} + {{round($bonus)}} = <b><span style="font-family: DejaVu Sans; sans-serif;">&#8377;</span>{{round($incentive)}}</b><br><br><input type="text" name="incentive" readonly value="{{round($incentive)}}" class="form-control"></td>
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
                                
                                <td>{{$months->holiday_work_days}}</td>
                            </tr>
                            <tr>
                                <th>Holiday Working Pay (double pay for holiday working)  : </th>
                                <?php 
                                    $holiday_work_days = $months->holiday_work_days;
                                    $holiday_pay = ($holiday_work_days > 0) ? ($holiday_work_days * 2 * round($per_day_salary)) : 0;
                                ?>
                                <td>
                                    Worked During Holidays * 2 * Per day salary = {{$holiday_work_days}} *  2 * {{round($per_day_salary)}} = 
                                    <b><span style="font-family: DejaVu Sans; sans-serif;">&#8377;</span>{{round($holiday_pay)}}</b><br><br>
                                    <input type="text" name="holiday_pay" readonly value="{{$holiday_pay}}" class="form-control">
                                </td>
                            </tr>
                            <tr>
                                <th>Total Cash : </th>
                                <?php
                                    $total_cash = $incentive + $ot_pay + $holiday_pay;
                                ?>
                                <td> Incentive + OT Pay + Holiday Working Pay = {{round($incentive)}} + {{round($ot_pay)}} + {{round($holiday_pay)}} = <b><span style="font-family: DejaVu Sans; sans-serif;">&#8377;</span>{{round($total_cash)}}</b><br><br><input type="text" name="total_cash" readonly value="{{round($total_cash)}}" class="form-control"></td>
                            </tr>
                            <tr>
                                <th>CTC  : </th>
                                <?php
                                    $ctc = $net_salary + $total_amount_paid_to_pf + $total_amount_paid_to_esi + $total_cash;
                                ?>
                                <td> Net Salary + Total Amount Paid To PF + Total Amount Paid To ESI + Total Cash = {{round($net_salary)}} + {{round($total_amount_paid_to_pf)}} + {{round($total_amount_paid_to_esi)}} + {{round($total_cash)}} = <b><span style="font-family: DejaVu Sans; sans-serif;">&#8377;</span>{{round($ctc)}}</b><br><br><input type="text" name="ctc" readonly value="{{round($ctc)}}" class="form-control"></td>
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