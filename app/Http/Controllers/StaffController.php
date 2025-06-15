<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Staff;
use App\Models\Department;
use App\Models\SupplyZone;
use App\Models\SupplyArea;
use App\Models\MonthlyReport;
use App\Models\SalaryCalculation;
use App\Models\ReportPayslipwithpf;
use App\Models\PaySlip;
use App\Models\Payslipwithpf;

use Illuminate\Support\Facades\DB;
class StaffController extends Controller
{
    
    public function list()
    {
        $staff = Staff::all();
        return view('staff.list', compact('staff'));
    }

    public function create()
    {
        $departments = Department::where('status','Y')->get();
        $supply_zones = SupplyZone::where('status','Y')->get();
        $supply_areas = SupplyArea::where('status','Y')->get();
        return view('staff.create', compact('departments', 'supply_zones', 'supply_areas'));
    }

    public function save(Request $request)
    {
        $validatedData = $request->validate([
            'name' => 'required|max:255',
            'department_id' => 'required|exists:departments,id',
            'phone_number' => 'required|max:20',
            'actual_date_of_joining' => 'required|date',
            'date_of_incorporation_in_pf' => 'nullable|date',
            'date_of_birth' => 'required|date',
            'age' => 'required|numeric',
            'uan_number' => 'nullable',
            'wedding_day' => 'nullable|date',
            'emergency_contact_name' => 'nullable',
            'relation' => 'nullable',
            'contact_number' => 'nullable',
        ]);
        
        $staff = Staff::where('phone_number',$request->phone_number)->first();
        if($staff==null)
        {
            Staff::create($request->all());
            $staff = Staff::orderby('id','desc')->first();
            $new = new SalaryCalculation();
            $new->staff_id = $staff->id;
            $new->save();
            return redirect()->route('staff.list')->with('success', 'Staff member has been created successfully!');
        }
        else
        {
            return redirect()->route('staff.list')->with('warning', 'Staff already exited!');
        }
       
    }

    public function show($id)
    {
        $staff = Staff::findOrFail($id);
        return view('staff.show', compact('staff'));
    }    

    public function edit($id)
    {
        $staff = Staff::findOrFail($id);
        $departments = Department::where('status','Y')->get();
        $supply_zones = SupplyZone::where('status','Y')->get();
        $supply_areas = SupplyArea::where('status','Y')->get();
        return view('staff.edit', compact('staff', 'departments', 'supply_zones', 'supply_areas'));
    }

    public function update(Request $request, $id)
    {
         $validatedData = $request->validate([
            'name' => 'required|max:255',
            'department_id' => 'required|exists:departments,id',
            'phone_number' => 'required|max:20',
            'actual_date_of_joining' => 'required|date',
            'date_of_incorporation_in_pf' => 'nullable|date',
            'date_of_birth' => 'required|date',
            'age' => 'required|numeric',
            'uan_number' => 'nullable',
            'wedding_day' => 'nullable|date',
        ]);

        $staff = Staff::findOrFail($id);
        $staff->update($request->all());

        return redirect()->route('staff.list')->with('success', 'Staff member has been updated successfully!');
    }
 
    public function delete(Request $request)
    {

        $staff = Staff::where('id', $request->id)->first();

        $salaryCalculation = SalaryCalculation::where('staff_id', $request->id)->first();
        if($salaryCalculation)
        {
            SalaryCalculation::where('staff_id', $request->id)->delete();
        }

        $monthlyReports = MonthlyReport::where('staff_id', $request->id)->first();
        if($monthlyReports)
        {
            MonthlyReport::where('staff_id', $request->id)->delete();
        }

        $payslip = PaySlip::where('staff_id', $request->id)->first();
        if($payslip)
        {
            PaySlip::where('staff_id', $request->id)->delete();
        }

        $payslipwithpf = Payslipwithpf::where('staff_id', $request->id)->first();
        if($payslipwithpf)
        {
            Payslipwithpf::where('staff_id', $request->id)->delete();
        }

        $excel_report = ReportPayslipwithpf::where('staff_id', $request->id)->first();
        if($excel_report)
        {
            ReportPayslipwithpf::where('staff_id', $request->id)->delete();
        }

        if ($staff) {
            Staff::where('id', $request->id)->delete();
            return redirect()->back()->withSuccess('Staff member has been deleted successfully.');
        } else {
            return redirect()->back()->withErrors('Failed to delete staff member.');
        }
    }

}