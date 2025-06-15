<table class="table">
    <thead>
        <tr>
            <th colspan="7" style="text-align:center;"><h4>Direct Farm Cart</h4></th>
        </tr>
        <tr>
            <th colspan="7" style="text-align:center;">Invoice</th>
        </tr>
        <tr>
            <th>Sl No</th>
            <th colspan="3">Product</th>
            <th>Price x Qty</th>
            <th>Amount</th>
        </tr>
    </thead>
    <tbody>
        @foreach ($order->order_details as $i => $order_detail)
        <tr>
            <td>{{ $i+1 }}</td>
            <td colspan="3"><span>{{$order_detail->product->name}}</span>
                <br>
                @if(@$order_detail->product->matrix1 != '')<b>{{ @$order_detail->product->matrix1 }}:</b> {{ @$order_detail->product_price->matrix1 }} @endif 
                @if(@$order_detail->product->matrix2 != '')<b>{{ @$order_detail->product->matrix2 }}:</b> {{ @$order_detail->product_price->matrix2 }} @endif
            </td>
            <td>{{ number_format($order_detail->price,2) }} x {{ $order_detail->quantity }}</td>
            <td>{{ number_format($order_detail->amount,2) }}</td>
        </tr>
        @endforeach
        <tr>
            <th colspan="2">Order Status</th>
            <td colspan="2">{{ $order->status }}</td>
            <td></td>
            <td><b>Sub Total:</b></td>
            <td>{{ number_format($order->sub_total,2) }}</td>
        </tr>
        <tr>
            <th colspan="2">Order Date</th>
            <td colspan="2">{{ $order->order_time ?  date('d/m/Y', strtotime($order->order_time)) : $order->created_at->toDateString() }}</td>
            <td></td>
            <td><b>Shipping:</b></td>
            <td>{{ number_format($order->shipping_charge,2) }}</td>
        </tr>
        <tr>
            <th colspan="2">Delivery Status</th>
            <td colspan="2">{{ $order->delivery_status }}</td>
            <td></td>
            <td><b>Total:</b></td>
            <td>{{ number_format($order->net_amount,2) }}</td>
        </tr>
        <tr>
            <th colspan="2">Customer Details</th>
            <td colspan="2">
                <span>
                    {{ ucfirst($order->user->name) }}
                </span><br>
                <span>
                    {{ $order->user->email }}
                </span><br>
                <span>
                    {{ $order->user->mobile }}
                </span>
            </td>
            <td colspan="3"></td>
        </tr>
        <tr>
            <th colspan="2">Customer Address</th>
            <td colspan="2">
                <span>
                    {{ $order->address->address }}
                </span><br>
                <span>  {{ $order->address->city }}, {{ $order->address->country }} - {{ $order->address->postcode }}</span>
            </td>
            <td colspan="3"></td>
        </tr>
    </tbody>
</table>