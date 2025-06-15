<?php

namespace App\Http\Controllers;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use Session;
use App\Models\heading;
use App\Models\subheading;
use App\Models\daybook;
use App\Models\Denomination;
use App\Models\GodownDayBook;
use App\Models\OnlineDayBook;
use View;
use Response;

class GoDownDayBookController extends Controller
{
    public function list(Request $request)
    {
        if($request->start_date==null  && $request->end_date==null)
        {
             $daybook = GodownDayBook::where('date', date('Y-m-d'))->get();
            $godowndaybook = GodownDayBook::where('date', date('Y-m-d'))->get();
            $onlinedaybook = OnlineDayBook::where('date', date('Y-m-d'))->get();
        }
        else if($request->start_date!=null  && $request->end_date==null)
        {
             $daybook = GodownDayBook::where('date', $request->start_date)->get();
            $godowndaybook = GodownDayBook::where('date', $request->start_date)->get();
            $onlinedaybook = OnlineDayBook::where('date', $request->start_date)->get();
        }
         else if($request->start_date==null  && $request->end_date!=null)
        {
             $daybook = GodownDayBook::where('date', $request->end_date)->get();
            $godowndaybook = GodownDayBook::where('date', $request->end_date)->get();
            $onlinedaybook = OnlineDayBook::where('date', $request->end_date)->get();
        }
        else
        {
            $daybook = GodownDayBook::whereBetween('date',[$request->start_date,$request->end_date])->get();
            $godowndaybook = GodownDayBook::whereBetween('date',[$request->start_date,$request->end_date])->get();
            $onlinedaybook = OnlineDayBook::whereBetween('date',[$request->start_date,$request->end_date])->get();
           
        }
         return view('godowndaybook.list', compact('daybook','godowndaybook','onlinedaybook'));
        
    }

    

    public function create(Request $request)
    {
        $date = Session::get('date');
        if($date==null)
        {
            Session::put('date',date('Y-m-d'));
        }
        
        
        $daybook = daybook::all();

        $daybook1 =  GodownDayBook::whereBetween('date',[$request->date,$request->date])->pluck('id');
        $denominations = Denomination::WhereIn('godown_daybook_id',$daybook1);
        $denomination_1 = $denominations->sum('denomination_1');
        $denomination_2 = $denominations->sum('denomination_2');
        $denomination_5 = $denominations->sum('denomination_5');
        $denomination_10 = $denominations->sum('denomination_10');
        $denomination_20 = $denominations->sum('denomination_20');
        $denomination_50 = $denominations->sum('denomination_50');
        $denomination_100 = $denominations->sum('denomination_100');
        $denomination_200 = $denominations->sum('denomination_200');
        $denomination_500 = $denominations->sum('denomination_500');
        $denomination_2000 = $denominations->sum('denomination_2000');

        $headings = heading::orderBy('name', 'asc')->get();
        $subheading = subheading::orderBy('name', 'asc')->get();
        $denominations = Denomination::all();
        return view('godowndaybook.create', compact('daybook', 'headings', 'subheading', 'denominations','denomination_1','denomination_2','denomination_5','denomination_10','denomination_20','denomination_50','denomination_100','denomination_200','denomination_500'));
    }


    public function store(Request $request)
    {
             $validatedData = $request->validate([
            'heading_id' => 'required|exists:headings,id', 
        ]);
        
            Session::put('date',$request->date);
                $new = new GodownDayBook();
                $new->heading_id = $request->heading_id;
                $new->subheading_id = $request->subheading_id;
                $new->description_1 = $request->description_1;
                $new->description_2 = $request->description_2;
                $new->type = $request->type;
                $new->date = $request->date;
                $new->amount = $request->total_amount;
                $new->payment_mode = $request->payment_mode;
                $new->save();
        if($request->payment_mode=="cash")
        {
             
                $new1 = new Denomination();
                $new1->godown_daybook_id = $new->id;
                $new1->denomination_1 = $request->denomination_1;
                $new1->denomination_2 = $request->denomination_2;
                $new1->denomination_5 = $request->denomination_5;
                $new1->denomination_10 = $request->denomination_10;
                $new1->denomination_20 = $request->denomination_20;
                $new1->denomination_50 = $request->denomination_50;
                $new1->denomination_100 = $request->denomination_100;
                $new1->denomination_200 = $request->denomination_200;
                $new1->denomination_500 = $request->denomination_500;
                $new1->denomination_2000 = $request->denomination_2000;
                $new1->save();
              
             
        }                
               
            
                    
            //$daybook = daybook::create($request->all());
            if($request->has('add'))
            {
                        $totals = session('total');
                        if ($request->type == "C") {
                            $totals += $request->total_amount;
                        } elseif ($request->type == "D") {
                            $totals -= $request->total_amount;
                        }
                        session(['total' => $totals]);

                return redirect()->back()->with('success', 'Daybook record created successfully!');
            }
            return redirect()->back()->with('success', 'Daybook record created successfully!');
        
    }
    public function edit($id)
    {
        $date = Session::get('date');
         
            Session::put('date',date('Y-m-d'));
        
        $daybook = GodownDaybook::findOrFail($id);
        $headings = heading::orderBy('name', 'asc')->get();
        $subheading = subheading::orderBy('name', 'asc')->get();
        $denominations = Denomination::where('godown_daybook_id', $id)->get();

        $daybook1 =  GodownDaybook::whereBetween('date',[$daybook->date,$daybook->date])->pluck('id');
        $denominationsSum = Denomination::WhereIn('godown_daybook_id',$daybook1);
        $denomination_1 = $denominationsSum->sum('denomination_1');
        $denomination_2 = $denominationsSum->sum('denomination_2');
        $denomination_5 = $denominationsSum->sum('denomination_5');
        $denomination_10 = $denominationsSum->sum('denomination_10');
        $denomination_20 = $denominationsSum->sum('denomination_20');
        $denomination_50 = $denominationsSum->sum('denomination_50');
        $denomination_100 = $denominationsSum->sum('denomination_100');
        $denomination_200 = $denominationsSum->sum('denomination_200');
        $denomination_500 = $denominationsSum->sum('denomination_500');
        $denomination_2000 = $denominationsSum->sum('denomination_2000');

        $denominationTotal = Denomination::Where('godown_daybook_id',$daybook->id);
 
        $emptyRemoved = [$denomination_1!=0 ? '1':'' ,$denomination_2!=0?'2':'',$denomination_5!=0?'5':'',$denomination_10!=0?'10':'',$denomination_20!=0?'20':'',$denomination_50!=0?'50':'',$denomination_100!=0?'100':'',$denomination_200!=0?'200':'',$denomination_500!=0?'500':'' ];
        $denominationsArray = array_filter($emptyRemoved, 'strlen');
         return view('godowndaybook.edit', compact('daybook', 'headings', 'subheading', 'denominations', 'date','denomination_1','denomination_2','denomination_5','denomination_10','denomination_20','denomination_50','denomination_100','denomination_200','denomination_500','denominationsArray','denominationTotal'));
    }
    public function update(Request $request, $id)
            { 
                    $validatedData = $request->validate([
                        'heading_id' => 'required|exists:headings,id',
                    ]);
        
                    Session::put('date',$request->date);
                    $daybook = GodownDaybook::findOrFail($id);
                    $daybook->heading_id = $request->heading_id;
                    $daybook->subheading_id = $request->subheading_id;
                    $daybook->description_1 = $request->description_1;
                    $daybook->description_2 = $request->description_2;
                     $daybook->date = $request->date;
                    $daybook->amount = $request->total_amount;
                    $daybook->payment_mode = $request->payment_mode;
                    $daybook->save();
        if($request->payment_mode=="cash")
        {
            $new1 = Denomination::where('godown_daybook_id',$daybook->id)->first();
             if ($new1!= null) {
                    $new1->denomination_1 = $request->denomination_1;
                    $new1->denomination_2 = $request->denomination_2;
                    $new1->denomination_5 = $request->denomination_5;
                    $new1->denomination_10 = $request->denomination_10;
                    $new1->denomination_20 = $request->denomination_20;
                    $new1->denomination_50 = $request->denomination_50;
                    $new1->denomination_100 = $request->denomination_100;
                    $new1->denomination_200 = $request->denomination_200;
                    $new1->denomination_500 = $request->denomination_500;
                    $new1->denomination_2000 = $request->denomination_2000;
                    $new1->save();
                 
                 
             }
             else
             {
                
                    $new1 = new Denomination();
                    $new1->godown_daybook_id = $daybook->id;
                    $new1->denomination_1 = $request->denomination_1;
                    $new1->denomination_2 = $request->denomination_2;
                    $new1->denomination_5 = $request->denomination_5;
                    $new1->denomination_10 = $request->denomination_10;
                    $new1->denomination_20 = $request->denomination_20;
                    $new1->denomination_50 = $request->denomination_50;
                    $new1->denomination_100 = $request->denomination_100;
                    $new1->denomination_200 = $request->denomination_200;
                    $new1->denomination_500 = $request->denomination_500;
                    $new1->denomination_2000 = $request->denomination_2000;
                    $new1->save();
                 
             }
        }
        else
        {
             $new1 = Denomination::where('godown_daybook_id',$daybook->id)->delete();
        }
             return redirect()->route('godown.list')->with('success', 'Daybook record updated successfully!');  
        }

    public function delete(Request $request)
    {
        $new1 = Denomination::where('godown_daybook_id',$request->id)->delete();
        $daybook = GodownDaybook::where('id',$request->id)->delete();
        return \Redirect::back()->withSuccess('success', 'Daybook Deleted  Successfully'); 
    }
}
   