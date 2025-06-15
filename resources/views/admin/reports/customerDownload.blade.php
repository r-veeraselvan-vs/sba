 <!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<style>
table, td, th {
  border: 1px solid;
}

table {
  width: 100%;
  border-collapse: collapse;
}
</style>
</head>
<body>
 
<div style="margin: 0 auto;display: block;">
        <table width="100%" style="border:1px solid black">
    @if( request()->get('month')==null)
    <thead>
      
        <tr> 
            <th rowspan="2" class="text-center">S.No</th> 
            <th rowspan="2" class="text-center">Name of the customer</th> 
            <th colspan="4" class="text-center">Total Value of the Orders</th> 
        </tr> 
        <tr> 
            @for($i=3;$i>=0;$i--)
                        <?php 
                            $year = Carbon\Carbon::now()->subMonths($i)->format('M Y');
                         ?>
                        <th>{{$year}}</th> 
                    @endfor
                        </tr> 
</thead>
<tbody id="timesheet_report">
    @foreach($users as $i=>$user)
            
            <tr> 
                <td>{{$i+1}}</td> 
                <td>{{$user->name}}</td> 
                 @for($i=3;$i>=0;$i--)
                    <?php 
                        $year = Carbon\Carbon::now()->subMonths($i)->format('m');
                        $orders = \App\OrderDetail::where('user_id',$user->id)->whereMonth('created_at',$year)->sum('amount');
                    ?>
                    <td>₹{{$orders}}</td> 
                @endfor
            </tr>
        
    @endforeach
    
     <tr> 
        <td colspan="2">Total</td> 
         @for($i=3;$i>=0;$i--)
                    <?php 
                        $year = Carbon\Carbon::now()->subMonths($i)->format('m');
                        $orders = \App\OrderDetail::whereYear('created_at',$year)->sum('amount');
                    ?>
                    <td>₹{{$orders}}</td> 
                @endfor
         
    </tr>
</tbody>
@else
<thead>
      
        <tr> 
            <th rowspan="2" class="text-center">S.No</th> 
            <th rowspan="2" class="text-center">Name of the customer</th> 
            <th colspan="1" class="text-center">Total Value of the Orders</th> 
        </tr> 
        <tr> 
                         <?php 
                            $year = date('F', mktime(0, 0, 0, request()->get('month'), 10));;
                         ?>
                        <th>{{$year}}</th> 
                         </tr> 
</thead>
<tbody id="timesheet_report">
    @foreach($users as $i=>$user)
            
            <tr> 
                <td>{{$i+1}}</td> 
                <td>{{$user->name}}</td> 
                     <?php 
                         $orders = \App\OrderDetail::where('user_id',$user->id)->whereMonth('created_at',request()->get('month'))->sum('amount');
                    ?>
                    <td><span style="font-family: DejaVu Sans; sans-serif;">&#8377;</span>&nbsp;{{$orders}}</td> 
             </tr>
        
    @endforeach
    
     <tr> 
        <td colspan="2">Total</td> 
                     <?php 
                       $year = date('F', mktime(0, 0, 0, request()->get('month'), 10));;
                        $orders = \App\OrderDetail::whereMonth('created_at',request()->get('month'))->sum('amount');
                    ?>
                    <td><span style="font-family: DejaVu Sans; sans-serif;">&#8377;</span>&nbsp;{{$orders}}</td> 
          
    </tr>
</tbody>
@endif
  </table>

  </table> </div>
</body>
</html>
 