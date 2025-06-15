<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\SupplyArea;
use Illuminate\Support\Facades\Validator;
use Session;

class SupplyareaController extends Controller
{
    public function list(){
        $sa = SupplyArea::all();
        return view('supplyarea.list')->with(['supply_areas'=>$sa]);
    }

    public function create(){
        return view('supplyarea.create');
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

        $sa=new SupplyArea();
        $sa->name=$request->name;
        $sa->status=$request->status;

        $sa->save();
         return redirect('/supplyarea/list')->with('success', 'SupplyArea Successfully Added');
    }

    public function edit($id){
        $d = SupplyArea::where('id','=',$id)->first();
        return view('supplyarea.edit',compact('d'));
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

        $sa=SupplyArea::find($request->id);
        $sa->name=$request->name;
        $sa->status=$request->status;

        $sa->save();
         return redirect('/supplyarea/list')->with('success', 'SupplyArea Successfully Updated');
    }

    public function delete(Request $request)
    {
        $sa = SupplyArea::where('id',$request->id)->delete();
        return \Redirect::back()->withSuccess( 'SupplyArea Deleted  Successfully'); 
    }

}
