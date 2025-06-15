<?php

namespace App\Http\Controllers;

use App\Models\MonthlyReport;
use App\Models\Staff;
use App\Models\SalaryCalculation;
use Illuminate\Http\Request;
use App\Models\PaySlip;
use App\Models\Payslipwithpf;
use App\Models\ReportPayslipwithpf;
use PDF;
use View;
use Response; 
class MonthlyReportController extends Controller
{
    public function list(Request $request)
    {
        $monthlyReports = MonthlyReport::with('staff')->orderby('id','desc');
        
        $staff = Staff::where('name', 'like', '%' .$request->name . '%')->first();
        
        if($request->name!=null && $staff!=null)
       {
           $monthlyReports = $monthlyReports->where('staff_id',$staff->id);
       }
       if($request->month!=null)
       {
             $monthlyReports = $monthlyReports->where('month',$request->month);
       }
       $monthlyReports = $monthlyReports->get();
       
        $salaryCalculations = SalaryCalculation::all();
        
         if($request->ajax()){
             $records = View::make('monthly_reports.filter')->with([
            'monthlyReports' => $monthlyReports,
            'salaryCalculations' => $salaryCalculations,

            ])->render();
          
           
            return Response::json(['records' => $records]);
        }
        else
        {
            return view('monthly_reports.list',compact('monthlyReports', 'salaryCalculations'));
        }
        
     }

    public function create()
    {
        $staff = Staff::all();
        return view('monthly_reports.create', compact('staff'));
    }

    public function save(Request $request)
    {
        $validatedData = $request->validate([
            'staff_id' => 'required|exists:staff,id',
            'month' => 'required',
            'leave_days' => 'nullable|numeric|min:0',
            'ot_hours' => 'nullable|numeric|min:0',
            'holiday_work_days' => 'nullable|numeric|min:0',
            'advance_received' => 'nullable|numeric|min:0',
        ]);

        $monthlyReports = MonthlyReport::where('staff_id','=',$request->staff_id)->where('month','=',$request->month)->first();
        if($monthlyReports == null)
        {
            MonthlyReport::create($validatedData);
            $staff = Staff::where('id','=',$request->staff_id)->first();
            $monthlyReport = MonthlyReport::where('staff_id','=',$request->staff_id)->where('month','=',$request->month)->first();
            if ($staff->pf_or_esi == 'Yes') {
                return redirect()->intended('monthly_reports/payslipwithpf'."/".$request->staff_id."/".$monthlyReport->id."/".$monthlyReport->month);
            }else{
                return redirect()->intended('monthly_reports/payslip'."/".$request->staff_id."/".$monthlyReport->id."/".$monthlyReport->month);
            }
        }
        else
        {
            return redirect()->route('monthly_reports.list')->with('success', 'Payroll Already Added');
        }
    }

    public function edit($id)
    {
        $staff = Staff::all();
        $monthlyReports = MonthlyReport::findOrFail($id);
        return view('monthly_reports.edit', compact('monthlyReports', 'staff'));
    }

    public function update(Request $request, $id)
    {
        $validatedData = $request->validate([
            'staff_id' => 'required|exists:staff,id',
            'month' => 'required',
            'leave_days' => 'nullable|numeric|min:0',
            'ot_hours' => 'nullable|numeric|min:0',
            'holiday_work_days' => 'nullable|numeric|min:0',
            'advance_received' => 'nullable|numeric|min:0',
        ]);

        $monthlyReports = MonthlyReport::findOrFail($id);
        $monthlyReports->update($validatedData);

            $staff = Staff::where('id','=',$request->staff_id)->first();
            $monthlyReport = MonthlyReport::where('staff_id','=',$request->staff_id)->where('month','=',$request->month)->first();
            if ($staff->pf_or_esi == 'Yes') {
                return redirect()->intended('monthly_reports/payslipwithpf'."/".$request->staff_id."/".$monthlyReport->id."/".$monthlyReport->month);
            }else{
                return redirect()->intended('monthly_reports/payslip'."/".$request->staff_id."/".$monthlyReport->id."/".$monthlyReport->month);
            }
    }

    public function delete(Request $request, $id, $month)
    {
        $monthlyReport = MonthlyReport::where('id', $id)
                                     ->where('month', $month)
                                     ->first();

        if ($monthlyReport) {
            $staff = Staff::where('id', $monthlyReport->staff_id)->first();

            if ($staff) {
                if ($staff->pf_or_esi == 'Yes') {
                    $payslipwithpf =  Payslipwithpf::where('staff_id', $staff->id)
                                                    ->where('month', $month)
                                                    ->first();

                    if ($payslipwithpf) {
                        $payslipwithpf->delete();
                    }

                    $reportpayslipwithpf = ReportPayslipwithpf::where('staff_id', $staff->id)
                                                              ->where('month', $month)
                                                              ->first();

                    if ($reportpayslipwithpf) {
                        $reportpayslipwithpf->delete();
                    }
                } else {
                    $payslip = PaySlip::where('staff_id', $staff->id)
                                       ->where('month', $month)
                                       ->first();

                    if ($payslip) {
                        $payslip->delete();
                    }
                }
            }

            $monthlyReport->delete();
            return redirect()->route('monthly_reports.list')->with('success', 'Payroll Generation deleted successfully!');
        } else {
            return redirect()->route('monthly_reports.list')->with('error', 'Payroll Generation not found!');
        }
    }

    //------------- payslip without pf-----------//

    public function payslip($staff_id, $id)
    {
        $staff = Staff::where('id',$staff_id)->first();
        $monthlyReport = MonthlyReport::where('id',$id)->first();
        return view('monthly_reports.payslip', compact('staff_id', 'id', 'staff', 'monthlyReport'));
    }

    public function generate(Request $staff_id, $id)
    {
        $staff = Staff::findOrFail($id);
        
        // Get the month and year of the payslip
        $month = \App\Models\MonthlyReport::where('staff_id', $staff_id);
        
        // Get the gross salary of the staff member
        $gross_salary = $staff->salary_calculation->gross_salary;
        
        // Get the number of working days in the month
        $working_days = cal_days_in_month(CAL_GREGORIAN, date('m'), date('Y'));
        
        // Calculate the per day salary
        $per_day_salary = $gross_salary / $working_days;
        
        // Calculate the per hour salary
        $per_hour_salary = $per_day_salary / 10;
        
        // Get the number of overtime hours worked during weekdays
        $week_days_ot = $staff->overtime_calculation->week_days_ot;
        
        // Calculate the overtime pay
        $overtime_pay = $week_days_ot * $per_hour_salary;

        return view('payslip', [
            'staff' => $staff,
            'month' => $month,
            'gross_salary' => $gross_salary,
            'per_day_salary' => $per_day_salary,
            'per_hour_salary' => $per_hour_salary,
            'week_days_ot' => $week_days_ot,
            'overtime_pay' => $overtime_pay,
        ]);

    }
    
    public function calculate(Request $request)
    {
        $new = new PaySlip();
        $new->staff_id = $request->staff_id;
        $new->month = $request->month;
        $new->per_day_salary = $request->per_day_salary;
        $new->per_hour_salary = $request->per_hour_salary;
        $new->ot_pay = $request->ot_pay;
        $new->holiday_working_pay = $request->holiday_pay;
        $new->deduction_leave = $request->deduction_leave;
        $new->gross_salary = $request->gross_salary;
        $new->net_salary = $request->net_amount;
        $new->ctc = $request->net_amount;
        $new->save();
        
        return redirect()->route('monthly_reports.list')->with('success', 'Payslip calculated successfully!');
    }
    
    public function downloadPayslip($staff_id, $id, $month)
    {
        $staff = Staff::where('id',$staff_id)->first();
        $monthlyReport = MonthlyReport::where('id',$id)->where('month',$month)->first();
        $pdf = PDF::loadView('monthly_reports.payslipDownloadWithoutPF',  compact('staff_id', 'id', 'staff', 'monthlyReport'))->setOptions(['defaultFont' => 'sans-serif']);;
        return $pdf->download('payslip.pdf');
    }

    //------------- payslip with pf-----------//

    public function payslipwithpf($staff_id, $id)
    {
        $staff = Staff::where('id', $staff_id)->first();
        $monthlyReport = MonthlyReport::where('id', $id)->first();
        $salary = SalaryCalculation::where('staff_id', $staff_id)->first();
        
        $totalAllowances = $salary->basic + $salary->da + $salary->other_allowances;
        
        if ($totalAllowances > $salary->gross_salary) {
            session()->flash('warning', 'Sum of Basic + Da + Other Allowances exceed gross salary.');
            return redirect()->route('salary-calculations.edit', ['id' => $salary->id]);
        }
        
        return view('monthly_reports.payslipwithpf', compact('staff_id', 'id', 'staff', 'monthlyReport'));
    }

    public function calculatewithpf(Request $request)
    {
         $new = new Payslipwithpf();
        $new->staff_id = $request->staff_id;
        $new->month = $request->month;
        $new->total = $request->total;
        $new->no_of_working_days = $request->no_of_working_days;
        $new->per_day_salary = $request->per_day_salary;
        $new->per_hour_salary = $request->per_hour_salary;
        $new->deduction_for_leave = $request->deduction_for_leave;
        $new->gross_salary = $request->gross_salary;
        $new->employee_contribution_to_pf = $request->employee_contribution_to_pf;
        $new->employee_contribution_to_esi = $request->employee_contribution_to_esi;
        $new->net_salary = $request->net_salary;
        $new->net_amount = $request->net_amount;
        $new->pension_contribution = $request->pension_contribution;
        $new->pf_contribution = $request->pf_contribution;
        $new->edl_insurance_contribution = $request->edl_insurance_contribution;
        $new->pf_administration_charges = $request->pf_administration_charges;
        $new->employers_contribution_to_pf = $request->employers_contribution_to_pf;
        $new->employers_contribution_to_esi = $request->employers_contribution_to_esi;
        $new->total_amount_paid_to_pf = $request->total_amount_paid_to_pf;
        $new->total_amount_paid_to_esi = $request->total_amount_paid_to_esi;
        $new->incentive = $request->incentive;
        $new->ot_pay = $request->ot_pay;
        $new->holiday_pay = $request->holiday_pay;
        $new->total_cash = $request->total_cash;
        $new->ctc = $request->ctc;
        $new->save();

        $staff = Staff::where('id', $request->staff_id)->first();
        $monthlyReports = MonthlyReport::where('staff_id', $request->staff_id)->first();
        $salaryCalculation = SalaryCalculation::where('staff_id', $request->staff_id)->first();

        if ($staff != null) {
            $existingPayslip = ReportPayslipwithpf::where('staff_id', $staff->id)
                ->where('month', $request->month)
                ->first();

            if ($existingPayslip != null) {
                $existingPayslip->uan_number = $salaryCalculation->pan_no;
                $existingPayslip->name = $staff->name;
                $existingPayslip->gross_salary = $request->gross_salary;
                $existingPayslip->epf_wages = min($request->gross_salary, 15000);
                if ($staff->age > 60) {
                    $existingPayslip->eps_wages = 0;
                } else {
                    $existingPayslip->eps_wages = min($request->gross_salary, 15000);
                }
                $existingPayslip->edli_wages = min($request->gross_salary, 15000);
                $existingPayslip->epf_contri_remitted = $existingPayslip->epf_wages * (12 / 100);
                if ($staff->age > 60) {
                    $existingPayslip->eps_contri_remitted = 0;
                } else {
                    $existingPayslip->eps_contri_remitted = $existingPayslip->epf_wages * (8.33 / 100);
                }
                $existingPayslip->epf_eps_difference_remitted = $existingPayslip->epf_contri_remitted - $existingPayslip->eps_contri_remitted;
                if ($monthlyReports !== null) {
                    $existingPayslip->ncp_days = 2 + $monthlyReports->leave_days;
                } else {
                    $existingPayslip->ncp_days = 2;
                }
                $existingPayslip->refund_of_advances = 0;
                $existingPayslip->save();
            } else {
                $new = new ReportPayslipwithpf();
                $new->staff_id = $staff->id;
                $new->uan_number = $salaryCalculation->pan_no;
                $new->name = $staff->name;
                $new->month = $request->month;
                $new->gross_salary = $request->gross_salary;
                $new->epf_wages = min($request->gross_salary, 15000);
                if ($staff->age > 60) {
                    $new->eps_wages = 0;
                } else {
                    $new->eps_wages = min($request->gross_salary, 15000);
                }
                $new->edli_wages = min($request->gross_salary, 15000);
                $new->epf_contri_remitted = $new->epf_wages * (12 / 100);
                if ($staff->age > 60) {
                    $new->eps_contri_remitted = 0;
                } else {
                    $new->eps_contri_remitted = $new->epf_wages * (8.33 / 100);
                }
                $new->epf_eps_difference_remitted = $new->epf_contri_remitted - $new->eps_contri_remitted;
                if ($monthlyReports !== null) {
                    $new->ncp_days = 2 + $monthlyReports->leave_days;
                } else {
                    $new->ncp_days = 2;
                }
                $new->refund_of_advances = 0;
                $new->save();
            }
        }
        return redirect()->route('monthly_reports.list')->with('success', 'Payslip calculated successfully!');
    }
    public function downloadPayslipwithpf($staff_id, $id, $month)
    {
        $staff = Staff::where('id',$staff_id)->first();
        $monthlyReport = MonthlyReport::where('id',$id)->where('month',$month)->first();
        $pdf = PDF::loadView('monthly_reports.payslipDownloadWithPF',  compact('staff_id', 'id', 'staff', 'monthlyReport'))->setOptions(['defaultFont' => 'sans-serif']);;
        return $pdf->download('payslipwithpf.pdf');
    }
}