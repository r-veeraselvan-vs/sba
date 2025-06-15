<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\SupplyZone;
use Illuminate\Support\Facades\Validator;
use Session;

class SupplyzoneController extends Controller
{
    public function list(){
        $sz = SupplyZone::all();
        return view('supplyzone.list')->with(['supply_zones'=>$sz]);
    }

    public function create(){
        return view('supplyzone.create');
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

        $sz=new SupplyZone();
        $sz->name=$request->name;
        $sz->status=$request->status;

        $sz->save();
         return redirect('/supplyzone/list')->with('success', 'SupplyZone Successfully Added');
    }

    public function edit($id){
        $d = SupplyZone::where('id','=',$id)->first();
        return view('supplyzone.edit',compact('d'));
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

        $sz=SupplyZone::find($request->id);
        $sz->name=$request->name;
        $sz->status=$request->status;

        $sz->save();
         return redirect('/supplyzone/list')->with('success', 'SupplyZone Successfully Updated');
    }

    public function delete(Request $request)
    {
        $sz = SupplyZone::where('id',$request->id)->delete();
        return \Redirect::back()->withSuccess( 'SupplyZone Deleted  Successfully'); 
    }
}
