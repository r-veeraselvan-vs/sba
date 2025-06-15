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
             <thead>
                <tr> 
                    <th class="text-center">S.No</th> 
                    <th class="text-center">Product Name</th>
                    <th class="text-center">Price</th>
                    <th class="text-center">Payment Mode</th>
                     <th class="text-center">Date</th>
                </tr> 
            </thead>
            <tbody id="timesheet_dailyreport">
                  @if (count($orders) > 0)
                    @foreach($orders as $order)
                        <?php
                        $detail = \App\OrderDetail::where('order_id', $order->id)->first();
                        if($detail != null) {
                            $product = \App\Product::where('id', $detail->product_id)->first();
                        } else {
                            $product = null;
                        }
                        ?>
                        @if(request('date'))
                            @if($order->created_at->format('Y-m-d') == request('date'))
                                <tr>
                                    <td>{{ $loop->iteration }}</td>
                                    @if($product != null)
                                        <td>{{ $product->name }}</td>
                                        @else
                                        <td>-</td>
                                    @endif
                                    <td><span style="font-family: DejaVu Sans; sans-serif;">&#8377;</span>&nbsp;{{$order->net_amount }}</td>                                
                                    <td>{{ optional($order)->payment_mode }}</td>
                                    <td>{{ optional($order)->status }}</td>
                                    <td>{{ optional($order)->created_at ? optional($order)->created_at->format('d-m-Y') : '' }}</td>
                                </tr>
                            @endif
                         @else
                        <tr>
                                    <td>{{ $loop->iteration }}</td>
                                    @if($product != null)
                                        <td>{{ $product->name }}</td>
                                        @else
                                        <td>-</td>
                                    @endif
                                    <td><span style="font-family: DejaVu Sans; sans-serif;">&#8377;</span>&nbsp;{{$order->net_amount }}</td>                                
                                    <td>{{ optional($order)->payment_mode }}</td>
                                     <td>{{ optional($order)->created_at ? optional($order)->created_at->format('d-m-Y') : '' }}</td>
                                </tr>
                                @endif
                    @endforeach
                @endif
                <tr> 
            <td colspan="2">Total</td> 
              <?php 
              if(request('date'))
              {
                  $orderAmount = \App\Order::whereDate('created_at',request('date'))->sum('net_amount');
               }
            else
            {
                 $orderAmount = $orders->sum('net_amount');
            }
                    ?>
                    
             <td colspan="4">₹{{$orderAmount}}</td> 
         </tr>
            </tbody>
        </table>
    </div>
</div>
 </div>
</body>
</html>


