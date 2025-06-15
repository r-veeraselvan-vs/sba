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
                        $payslipwithpf = \App\Models\Payslipwithpf::where('staff_id',$staff->id)->orderby('id','desc')->first();
                    ?>
                     
                       @if($salary!=null)
        <table width="100%" style="border:1px solid black">
                            <tr>
                                <th style="text-align: left;">Staff Name:</th>
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
                                <?php
                                    $total = $salary->basic + $salary->da + $salary->other_allowances;
                                ?>
                                <td>{{($total != null) ? $total : 0}}</td>
                            </tr>
                             <tr>
                                <th style="text-align: left;">No of days leave taken : </th>
                                <td>{{($months != null) ? $months->leave_days : 0}}</td>
                            </tr>
                           
                                
                                <?php
                                    //$working_days = \App\Models\WorkingDays::where('month','=', $months->month)->sum('total_days');
                                    //$no_of_sundays = \App\Models\WorkingDays::where('month','=', $months->month)->sum('sundays');
                                if($staff->pf_or_esi == 'Yes'){
                                    $no_of_working_days = 26;
                                } else {
                                    $no_of_working_days = 30;
                                }
                                ?>
                            <tr>
                                <th style="text-align: left;">No of working days : </th>
                                <td>{{($no_of_working_days != null) ? $no_of_working_days : 0}}</td>
                            </tr>
                             <?php 
                                
                                    $working_days = cal_days_in_month(CAL_GREGORIAN, date('m'), date('Y'));
                                    $per_day_salary = ($salary->basic + $salary->da) / $no_of_working_days;
                                ?>
                            <tr>
                                <th style="text-align: left;">Deduction for leave  : </th>
                                <td> <b><span style="font-family: DejaVu Sans; sans-serif;">&#8377;</span>{{round(($payslipwithpf != null) ? $payslipwithpf->deduction_for_leave : 0 )}}</td>
                            </tr>
                            <tr>
                                <th style="text-align: left;">Bonus :</th>
                                <?php 
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
                                <th style="text-align: left;">Employee's PF contribution</th>
                                <td>{{($payslipwithpf != null) ? $payslipwithpf->employee_contribution_to_pf : 0}}</td>
                            </tr>
                            <tr>
                                <th style="text-align: left;">Employee's ESI contribution</th>
                                <td>{{($payslipwithpf != null) ? $payslipwithpf->employee_contribution_to_esi : 0}}</td>
                            </tr>
                             <tr>
                                <th style="text-align: left;">Advance Received  : </th>
                                <td>{{($months != null) ? $months->advance_received : 0}}</td>
                            </tr>
                            <tr>
                                <th style="text-align: left;">Net Salary transferred to Account : </th>
                                <td>{{($payslipwithpf != null) ? $payslipwithpf->net_amount : 0}}</td>
                            </tr>           
                            <tr>
                                <th style="text-align: left;">Cash Incentive  : </th>
                                <td><span style="font-family: DejaVu Sans; sans-serif;">&#8377;</span> {{round(($payslipwithpf != null) ? $payslipwithpf->total_cash : 0)}}</td>
                            </tr>
                            <tr>
                                <th style="text-align: left;">Employer's PF contribution</th>
                                <td><span style="font-family: DejaVu Sans; sans-serif;">&#8377;</span> {{ round(($payslipwithpf != null) ? $payslipwithpf->employers_contribution_to_pf : 0) }}</td>
                            </tr>
                            <tr>
                                <th style="text-align: left;">Employer's ESI contribution</th>
                                <td><span style="font-family: DejaVu Sans; sans-serif;">&#8377;</span> {{ round(($payslipwithpf != null) ? $payslipwithpf->employers_contribution_to_esi : 0) }}</td>
                            </tr>
                        </table>
                        @endif
                         
                       
               </body>
</html>
