 <!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<style>
table, td, th {
  border: 1px solid;
}

table {
  width: 100%;
  border-collapse: collapse;
}
</style>
</head>
<body>
 
                    
                        <?php 
                            $department = \App\Models\Department::where('id',$staff->department_id)->first();
                            $salary = \App\Models\SalaryCalculation::where('staff_id',$staff->id)->first();
                            $months = \App\Models\MonthlyReport::where('staff_id',$staff->id)->where('month',$monthlyReport->month)->first();
                            $payslip = \App\Models\PaySlip::where('staff_id',$staff->id)->orderby('id','desc')->first();
                        ?>
                     
                       @if($salary!=null)
        <table width="100%" style="border:1px solid black">
                            <tr>
                                <th style="text-align: left;">Staff Name : </th>
                                <td>{{($staff != null) ? $staff->name : 0}}</td>
                            </tr>
                            <tr>
                                <th style="text-align: left;">Designation : </th>
                                <td>{{($department != null) ? $department->name : 0}}</td>
                            </tr>
                            <tr>
                                <th style="text-align: left;">Date of joining : </th>
                                <td>{{($staff != null) ? $staff->actual_date_of_joining : 0}}</td>
                            </tr>
                            <tr>
                                <th style="text-align: left;">Salary for the month of {{$months->month}} : </th>
                                <td>{{($salary != null) ? $salary->gross_salary : 0}}</td>
                            </tr>
                            <tr>
                                <th style="text-align: left;">Basic : </th>
                                <td>{{($salary != null) ? $salary->basic : 0}}</td>
                            </tr>
                            <tr>
                                <th style="text-align: left;">DA : </th>
                                <td>{{($salary != null) ? $salary->da : 0}}</td>
                            </tr>
                            <tr>
                                <th style="text-align: left;">Other allowances : </th>
                                <td>{{($salary != null) ? $salary->other_allowances : 0}}</td>
                            </tr>
                            <tr>
                                <th style="text-align: left;">HRA : </th>
                                <td>{{($salary != null) ? $salary->hra : 0}}</td>
                            </tr>
                            <tr>
                                <th style="text-align: left;">Total : </th>
                                <td>{{($salary != null) ? $salary->gross_salary : 0}}</td>
                            </tr>
                            <tr>
                                <th style="text-align: left;">No of days leave taken : </th>
                                <td>{{($months != null) ? $months->leave_days : 0}}</td>
                            </tr>
                            <tr>
                                <th style="text-align: left;">Deduction for leave  : </th>
                                <td> <b><span style="font-family: DejaVu Sans; sans-serif;">&#8377;</span>{{round(($payslip != null) ? $payslip->deduction_leave : 0 ) }}</td>
                            </tr>
                            <tr>
                                <th style="text-align: left;">Bonus :</th>
                                <?php 
                                    //$working_days = \App\Models\WorkingDays::where('month','=', $monthlyReport->month)->sum('total_days');
                                    if($staff->pf_or_esi == 'Yes'){
                                    $working_days = 26;
                                } else {
                                    $working_days = 30;
                                }
                                    $per_day_salary = $salary->gross_salary / $working_days;

                                    $no_of_leave_days = $months->leave_days;
                                    if ($no_of_leave_days != 0) {
                                        $bonus = 0;
                                    } else {
                                        $bonus = $per_day_salary;
                                    }
                                ?>
                                <td> <b><span style="font-family: DejaVu Sans; sans-serif;">&#8377;</span>{{round(($bonus != null) ? $bonus : 0)}}</td>

                            </tr>
                            <tr>
                                <th style="text-align: left;">Gross Salary 2 : </th>
                                <td>{{($payslip != null) ? $payslip->gross_salary : 0}}</td>
                            </tr>
                            <tr>
                                <th style="text-align: left;">Advance Received  : </th>
                                <td>{{($months != null) ? $months->advance_received : 0}}</td>
                            </tr>
                            <tr>
                                <th style="text-align: left;">OT Hours WeekDays : </th>
                                <td>{{ ($months != null) ? $months->ot_hours : 0 }} hours</td>
                            </tr>
                            <tr>
                                <th style="text-align: left;">No Of Day Worked During Holidays  : </th>
                                <td>{{($months != null) ? $months->holiday_work_days : 0}}</td>
                            </tr>
                            <tr>
                                <th style="text-align: left;">OT Pay : </th>
                                <td><b><span style="font-family: DejaVu Sans; sans-serif;">&#8377;</span>{{round(($payslip != null) ? $payslip->ot_pay : 0)}}</b></td>
                            </tr>
                            <tr>
                                <th style="text-align: left;">Holiday Working Pay: </th>
                                <td><b><span style="font-family: DejaVu Sans; sans-serif;">&#8377;</span>{{($payslip != null) ? $payslip->holiday_working_pay : 0}}</b></td>
                            </tr>
                            <tr>
                                <th style="text-align: left;">Net Salary  : </th>
                                <td><span style="font-family: DejaVu Sans; sans-serif;">&#8377;</span> {{round(($payslip != null) ? $payslip->net_salary : 0)}}</td>
                            </tr>
                            <tr>
                                <th style="text-align: left;">CTC  : </th>
                                <td><span style="font-family: DejaVu Sans; sans-serif;">&#8377;</span> {{round(($payslip != null) ? $payslip->ctc : 0)}}</td>
                            </tr>
                        </table>
                        @endif
                         
                       
               </body>
</html>
 