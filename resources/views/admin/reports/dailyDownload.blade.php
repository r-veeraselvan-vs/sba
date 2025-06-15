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
 
         <table width="100%" style="border:1px solid black">
    <thead>
        <tr> 
            <th class="text-center">S.No</th> 
            <th class="text-center">Month</th> 
            <th class="text-center">Total No of Orders</th> 
            <th class="text-center">Total Value of the Orders</th> 
        </tr> 
         
    </thead>
    <tbody id="timesheet_dailyreport">
        @if(request()->get('date')==null)
            <?php 
                $j=0;
            ?>
            @for($i=0;$i<=30;$i++)
                
                
                    <?php 
                        $date = Carbon\Carbon::now()->subDays($i)->format('Y-m-d');
                         $orders = \App\OrderDetail::whereDate('created_at',$date)->count();
                        $orderAmount = \App\OrderDetail::whereDate('created_at',$date)->sum('amount');
                    ?>
                      <?php 
                    $j= $j+1;
                ?>
                    <tr> 
                     <td>{{$j}}</td> 
                    <td>{{$date}}</td> 
                    <td>{{$orders}}</td> 
                    <td><span style="font-family: DejaVu Sans; sans-serif;">&#8377;</span>&nbsp;{{$orderAmount}}</td> 
                </tr>
                
            @endfor
          
         <tr> 
            <td colspan="2">Total</td> 
             <?php 
                         $orders = \App\OrderDetail::whereDay('created_at',$date)->count();
                        $orderAmount = \App\OrderDetail::whereDay('created_at',$date)->sum('amount');
                    ?>
                    
             <td>{{$orders}}</td> 
            <td><span style="font-family: DejaVu Sans; sans-serif;">&#8377;</span>&nbsp;{{$orderAmount}}</td> 
         </tr>
          @else
          <?php 
                        $date =request()->get('date');
                        $to_date =request()->get('to_date');
                        $orders = \App\OrderDetail::whereDate('created_at','>=',$date)->whereDate('created_at','<=',$to_date)->get();
                        
                        $dateRange = Carbon\CarbonPeriod::create($date, $to_date);
        $dates = $dateRange->toArray();
                      ?>
                    @foreach($dates as $i=>$order)
                      <?php 
                          $orders = \App\OrderDetail::whereDate('created_at','=',$order->format('Y-m-d'))->count();
                        $orderAmount = \App\OrderDetail::whereDate('created_at','=',$order->format('Y-m-d'))->sum('amount');
                    ?>
                    <tr> 
                     <td>{{$i+1}}</td> 
                    <td>{{$order->format('Y-m-d')}}</td> 
                    <td>{{$orders}}</td> 
                    <td><span style="font-family: DejaVu Sans; sans-serif;">&#8377;</span>&nbsp;{{$orderAmount}}</td> 
                </tr>
                @endforeach
                 <tr> 
            <td colspan="2">Total</td> 
             <?php 
                         $orders = \App\OrderDetail::whereDate('created_at','>=',$date)->whereDate('created_at','<=',$to_date)->count();
                        $orderAmount = \App\OrderDetail::whereDate('created_at','>=',$date)->whereDate('created_at','<=',$to_date)->sum('amount');
                    ?>
                    
             <td>{{$orders}}</td> 
            <td><span style="font-family: DejaVu Sans; sans-serif;">&#8377;</span>&nbsp;{{$orderAmount}}</td> 
         </tr>
           @endif
     </tbody>

  </table>
    </div>
</div>
</body>
</html>