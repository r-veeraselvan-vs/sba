<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Staff;
use App\Models\Payslipwithpf;
use App\Models\PaySlip;
use App\Models\SalaryCalculation;
use App\Models\ReportPayslipwithpf;
use Illuminate\Support\Facades\Validator;

class ReportsController extends Controller
{
    /*-----salary list of bank of baroda------*/
    public function slbob()
    {
        $staffs = Staff::orderby('id','desc')->get();
        return view('reports.slbob', compact('staffs'));
    }
    /*-----salary list of other bank accounts------*/
    public function sloba()
    {
        $staffs = Staff::orderby('id','desc')->where('pf_or_esi','Yes')->get();
        return view('reports.sloba', compact('staffs'));
    }
    /*-----salary list with pf------*/
    public function slwithpf()
    {
        $staffs = Staff::orderby('id','desc')->where('pf_or_esi','=','Yes')->get();
        return view('reports.slwithpf', compact('staffs'));
    }
    /*-----salary list without pf------*/
    public function slwithoutpf()
    {
        $staffs = Staff::orderby('id','desc')->where('pf_or_esi','=','No')->get();
        return view('reports.slwithoutpf', compact('staffs'));
    }
    /*-------excel report----------*/
    public function excel_report()
    {
        $excel_report = ReportPayslipwithpf::all();
        return view('reports.excel_report', compact('excel_report')); 
    }
    public function excel_report_edit($id)
    {
        $excel_report = ReportPayslipwithpf::findOrFail($id);
        return view('reports.excel_report_edit', compact('excel_report')); 
    }
    public function excel_report_update(Request $request, $id)
    {
        $validatedData = $request->validate([
            'refund_of_advances' => 'required',
        ]);
        $excel_report = ReportPayslipwithpf::findOrFail($id);
        $excel_report->update($validatedData);
        return redirect()->route('reports.excel_report')->with('success', 'Excel Report updated successfully.');
    }
}