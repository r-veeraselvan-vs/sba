<?php

namespace App\Http\Controllers;

use App\Models\Staff;
use App\Models\SalaryCalculation;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;

class SalaryCalculationController extends Controller
{
    public function list()
    {
        $salaryCalculations = SalaryCalculation::all();

        return view('salary-calculations.list', compact('salaryCalculations'));
    }

    public function create()
    {
        $staff = Staff::all();
        return view('salary-calculations.create', compact('staff'));
    }

    public function save(Request $request)
    {
        $validatedData = $request->validate([
            'staff_id' => 'required|exists:staff,id',
            'gross_salary' => 'required|numeric',
            'basic' => [
                'nullable',
                'numeric',
                Rule::notGreaterThan($request->input('gross_salary'))->setMessage('The basic salary cannot be greater than the gross salary.'),
            ],
            'da' => [
                'nullable',
                'numeric',
                Rule::notGreaterThan($request->input('gross_salary'))->setMessage('The da cannot be greater than the gross salary.'),
            ],
            'other_allowances' => 'nullable|numeric',
            'hra' => 'nullable|numeric',
            'pan_no' => 'nullable|max:255',
            'bank' => 'nullable|max:255',
            'account_no' => 'nullable|max:255',
            'ifsc_code' => 'nullable|max:255',
        ]);

        SalaryCalculation::create($validatedData);
        return redirect()->route('salary-calculations.list')->with('success', 'Staff Salary Data added successfully.');
    }

    public function edit($id)
    {
        $staff = Staff::all();
        $salaryCalculations = SalaryCalculation::findOrFail($id);
        return view('salary-calculations.edit', compact('salaryCalculations', 'staff'));
    }

    public function update(Request $request, $id)
    {
        $data = $request->validate([
            'staff_id' => 'required|exists:staff,id',
            'gross_salary' => 'required|numeric',
            'basic' => 'nullable|numeric',
            'da' => 'nullable|numeric',
            'other_allowances' => 'nullable|numeric',
            'hra' => 'nullable|numeric',
            'pan_no' => 'nullable|max:255',
            'bank' => 'nullable|max:255',
            'account_no' => 'nullable|max:255',
            'ifsc_code' => 'nullable|max:255',
        ]);

        $errors = [];

        if (isset($data['basic']) || isset($data['da']) || isset($data['other_allowances'])) {
            $totalAllowances = ($data['basic'] ?? 0) + ($data['da'] ?? 0) + ($data['other_allowances'] ?? 0);

            if ($totalAllowances > $data['gross_salary']) {
                $errors[] = 'Sum of Basic + Da + Other Allowances exceed gross salary.';
            }

            if (isset($data['basic']) && $data['basic'] > $data['gross_salary']) {
                $errors['basic'] = 'The basic cannot be greater than the gross salary.';
            }
            if (isset($data['da']) && $data['da'] > $data['gross_salary']) {
                $errors['da'] = 'The da cannot be greater than the gross salary.';
            }
            if (isset($data['other_allowances']) && $data['other_allowances'] > $data['gross_salary']) {
                $errors['other_allowances'] = 'The other allowances cannot be greater than the gross salary.';
            }
        }

        if (!empty($errors)) {
            return redirect()
                ->route('salary-calculations.edit', $id)
                ->withErrors($errors);
        }

        $salaryCalculations = SalaryCalculation::findOrFail($id);
        $salaryCalculations->update($data);

        return redirect()->route('salary-calculations.list')->with('success', 'Staff Salary Data updated successfully.');
    }


    public function delete(Request $request)
    {
        $salaryCalculation = SalaryCalculation::where('id',$request->id)->delete();
        return \Redirect::back()->withSuccess( 'Staff Salary Data has been deleted  Successfully'); 
    }

}