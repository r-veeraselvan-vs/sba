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
    <tbody id="timesheet_monthlyreport">
        @if(request()->get('month')==null)
            <?php 
                $j=0;
            ?>
            @for($i=3;$i>=0;$i--)
                <tr> 
                <?php 
                    $j= $j+1;
                    $year = Carbon\Carbon::now()->subMonths($i)->format('m');
                    $monthyear = Carbon\Carbon::now()->subMonths($i)->format('M Y');
                    $orders = \App\OrderDetail::whereMonth('created_at',$year)->count();
                    $orderAmount = \App\OrderDetail::whereMonth('created_at',$year)->sum('amount');
                ?>
                    <td>{{$j}}</td> 
                    <td>{{$monthyear}}</td> 
                    <td>{{$orders}}</td> 
                    <td><span style="font-family: DejaVu Sans; sans-serif;">&#8377;</span>&nbsp;{{$orderAmount}}</td> 
                </tr>
            @endfor

            <tr> 
                <td colspan="2">Total</td> 
                <?php 
                    $orders = \App\OrderDetail::whereMonth('created_at',$year)->count();
                    $orderAmount = \App\OrderDetail::whereMonth('created_at',$year)->sum('amount');
                ?>
                <td>{{$orders}}</td> 
                <td><span style="font-family: DejaVu Sans; sans-serif;">&#8377;</span>&nbsp;{{$orderAmount}}</td> 
            </tr>

        @else
            <?php 
                $j=0;
                $j= $j+1;
                $monthName = date('F', mktime(0, 0, 0, request()->get('month'), 10));
                $orders = \App\OrderDetail::whereMonth('created_at',request()->get('month'))->count();
                $orderAmount = \App\OrderDetail::whereMonth('created_at',request()->get('month'))->sum('amount');
            ?>
            <tr> 
                <td>{{$j}}</td> 
                <td>{{$monthName}}</td> 
                <td>{{$orders}}</td> 
                <td><span style="font-family: DejaVu Sans; sans-serif;">&#8377;</span>&nbsp;{{$orderAmount}}</td> 
            </tr>

            <tr> 
                <td colspan="2">Total</td> 
                <?php 
                    $orders = \App\OrderDetail::whereMonth('created_at',request()->get('month'))->count();
                    $orderAmount = \App\OrderDetail::whereMonth('created_at',request()->get('month'))->sum('amount');
                ?>
                <td>{{$orders}}</td> 
                <td><span style="font-family: DejaVu Sans; sans-serif;">&#8377;</span>&nbsp;{{$orderAmount}}</td> 
            </tr>
        @endif
    </tbody>
</table>

</body>
</html>
