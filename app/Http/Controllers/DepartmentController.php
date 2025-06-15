<?php

namespace App\Http\Controllers;
use App\Models\Department;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use Session;
use App\Models\Staff;

class DepartmentController extends Controller
{

    public function list(){
        $d=Department::all();
        return view('department.list')->with(['departments'=>$d]);
    }

    public function create(){
        return view('department.create');
    }

    public function save(Request $request)
    {
        $validate = Validator::make($request->all(), [
          'name'=>'required',
          'status'=>'required',
        ]);
        if($validate->fails()){
            return back()->withErrors($validate->errors())->withInput();
        }

        $d=new Department();
        $d->name=$request->name;
        $d->status=$request->status;

        $d->save();
         return redirect('/department/list')->with('success', 'Department Successfully Added');
    }

    public function edit($id){
        $d = Department::where('id','=',$id)->first();
        return view('department.edit',compact('d'));
    }

    public function update(Request $request)
    {
        $validate = Validator::make($request->all(), [
          'name'=>'required',
          'status'=>'required',
        ]);
        if($validate->fails()){
            return back()->withErrors($validate->errors())->withInput();
        }

        $d=Department::find($request->id);
        $d->name=$request->name;
        $d->status=$request->status;

        $d->save();
         return redirect( '/department/list')->with('success', 'Department Successfully Updated');
    }

    public function delete(Request $request)
    {
        $satff = Staff::where('department_id', $request->id)->delete();
        $d = Department::where('id',$request->id)->delete();
        return \Redirect::back()->withSuccess( 'Department Deleted  Successfully'); 
    }

}
