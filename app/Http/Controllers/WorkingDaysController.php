<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\WorkingDays;

class WorkingDaysController extends Controller
{
    public function list()
    {
        $workingDays = WorkingDays::all();
        return view('working_days.list', compact('workingDays'));
    }

    public function create()
    {
        return view('working_days.create');
    }

    public function save(Request $request)
    {
        $validatedData = $request->validate([
            'month' => 'required',
            'total_days' => 'required|numeric|min:0',
            'sundays' => 'required|numeric|min:0',
            'holidays' => 'required|numeric|min:0',
        ]);

        $month = WorkingDays::where('month', $validatedData['month'])->first();
        if ( $month ) {
            return redirect()->route('working_days.list')->with('error', 'Monthly Working Days record already exists!');
        }

        WorkingDays::create($validatedData);
        return redirect()->route('working_days.list')->with('success', 'Monthly Working Days record created successfully!');
    }

    public function edit($id)
    {
        $workingDays = WorkingDays::findOrFail($id);
        return view('working_days.edit', compact('workingDays'));
    }

    public function update(Request $request, $id)
    {
        $validatedData = $request->validate([
            'month' => 'required',
            'total_days' => 'required|numeric|min:0',
            'sundays' => 'required|numeric|min:0',
            'holidays' => 'required|numeric|min:0',
        ]);

        $workingDays = WorkingDays::findOrFail($id);
        $workingDays->update($validatedData);

        return redirect()->route('working_days.list')->with('success', 'Monthly Working Days record updated successfully!');
    }

    public function delete(Request $request)
    {
        $workingDay = WorkingDays::where('id',$request->id)->delete();
        return redirect()->route('working_days.list')->with('success', 'Monthly Working Days record deleted successfully!');
    }
}
