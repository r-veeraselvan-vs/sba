<div class="tab-pane" id="order_list">
    <div>
        <table id="export" class="table">
            <thead>
                <tr>
                    <th>Sl No</th>
                    <th>Date</th>
                    <th>Image</th>
                    <th>Product</th>
                    <th>Items</th>
                    <th>Price</th>
                    <th>Delivery Date</th>
                    <th>Slot</th>
                    <th>Payment Mode</th>
                    <th>Change</th>
                    <th>Status</th>
                    <th>Delivery Status</th>
                    <th>Action</th>
                </tr>
            </thead>
            <tbody>
                @foreach ($orders as $i => $order)
                <tr>
                    <td>{{ $i+1 }}</td>
                    <td>{{ $order->order_time ?  date('d/m/Y', strtotime($order->order_time)) : $order->created_at->toDateString() }}</td>
                    <td>
                        <img width="50px" src="{{ @$order->order_detail->product->ThumbnailUrl }}" alt=""></td>
                    <td><b>{{$order->order_detail->product->name}}</b>
                        <br>
                        @if(@$order->order_detail->product->matrix1 != '')<b>{{ @$order->order_detail->product->matrix1 }}:</b> {{ @$order->order_detail->product_price->matrix1 }} @endif 
                        @if(@$order->order_detail->product->matrix2 != '')<b>{{ @$order->order_detail->product->matrix2 }}:</b> {{ @$order->order_detail->product_price->matrix2 }} @endif
                    </td>
                    <td>{{ $order->items }}</td>
                    <td>{{ $order->net_amount }}</td>
                    <td>{{ @$order->delivery_date }}</td>
                    <td>{{ @$order->delivery_slot->start }} - {{ @$order->delivery_slot->end }}</td>
                    <td>{{ $order->payment_mode }}</td>
                    <td>{{ @$order->change_required }}</td>
                    <td>{{ $order->status }}</td>
                    <td>{{ $order->delivery_status }}</td>
                    <td>
                        <a href="{{ route('order.detail', [ 'id' => $order->id , 'type' => 'view' ]) }}"><span class="badge bg-info"><i class="fas fa-eye"></i></span></a>
                    </td>
                </tr>
                @endforeach
            </tbody>
        </table>
    </div>
    
</div>

<script>
    $(document).ready(function() {
        $('#export').DataTable( {
            dom: 'Blfrtip',
            buttons: [ { extend: 'excel', title: 'Customer Order List' } ],
            responsive: true,
            autoWidth: false
        } );
        $('.dt-button').html('<i class="fa fa-download" aria-hidden="true"></i> Reports');
    } );
 </script>

 
<style>
 .dt-button{
    color: #fff;
    background-color: #F66469;
    border-color: #F66469;
    box-shadow: none;
    display: inline-block;
    font-weight: 400;
    text-align: center;
    vertical-align: middle;
    cursor: pointer;
    border: 1px solid transparent;
    padding: .375rem .75rem;
    font-size: 1rem;
    line-height: 1.5;
    border-radius: .25rem;
    transition: color .15s ease-in-out,background-color .15s ease-in-out,border-color .15s ease-in-out,box-shadow .15s ease-in-out;
 }
 .dt-button:hover{
    color: #fff;
    background-color: #0069d9;
    border-color: #f99195;
 }
 </style>