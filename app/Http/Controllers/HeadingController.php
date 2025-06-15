<?php

namespace App\Http\Controllers;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use Session;
use App\Models\heading;

class HeadingController extends Controller
{
    public function list()
    {
        $heading = heading::all();
        return view('heading.list', compact('heading'));
    }

    public function create()
    {
        return view('heading.create');
    }

    public function store(Request $request)
    {
        $validatedData = $request->validate([
            'name' => 'required|string|max:255',
            'status' => 'required|string|in:active,inactive',
        ]);

        $heading = heading::create($validatedData);

        return redirect()->route('heading.list')->with('success', 'heading record created successfully!');
    }

    public function edit($id)
    {
        $heading = heading::findOrFail($id);
        return view('heading.edit', compact('heading'));
    }

    public function update(Request $request, $id)
    {
        $validatedData = $request->validate([
            'name' => 'required|string|max:255',
            'status' => 'required|string|in:active,inactive',
        ]);

        $heading = Heading::findOrFail($id);
        $heading->update($validatedData);

        return redirect()->route('heading.list')->with('success', 'Heading record updated successfully!');
    }


    public function delete(Request $request)
    {
        $heading = heading::where('id',$request->id)->delete();
        return \Redirect::back()->withSuccess('success', 'Heading Deleted  Successfully'); 
    }
}
