<?php

namespace App\Http\Controllers;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use Session;
use App\Models\heading;
use App\Models\subheading;

class SubHeadingController extends Controller
{
    public function list()
    {
        $subheading = subheading::all();
        return view('subheading.list', compact('subheading'));
    }

    public function create()
    {
        $headings = heading::all();
        return view('subheading.create', compact('headings'));
    }

    public function store(Request $request)
    {
        $validatedData = $request->validate([
            'name' => 'required|string|max:255',
            'heading_id' => 'required|exists:headings,id',
            'status' => 'required|string|in:active,inactive',
        ]);

        $subheading = subheading::create($validatedData);

        return redirect()->route('subheading.list')->with('success', 'subheading record created successfully!');
    }

    public function edit($id)
    {
        $subheading = subheading::findOrFail($id);
        $headings = heading::all();
        return view('subheading.edit', compact('subheading', 'headings'));
    }

    public function update(Request $request, $id)
    {
        $validatedData = $request->validate([
            'name' => 'required|string|max:255',
            'heading_id' => 'required|exists:headings,id',
            'status' => 'required|string|in:active,inactive',
        ]);

        $subheading = subheading::findOrFail($id);
        $subheading->update($validatedData);

        return redirect()->route('subheading.list')->with('success', 'subheading record updated successfully!');
    }


    public function delete(Request $request)
    {
        $subheading = subheading::where('id',$request->id)->delete();
        return \Redirect::back()->withSuccess('success', 'subheading Deleted  Successfully'); 
    }
}