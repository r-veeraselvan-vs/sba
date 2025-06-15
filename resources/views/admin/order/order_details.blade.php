@extends('layouts.app')
@section('content')

<style>
      /*
          Use the DejaVu Sans font for displaying and embedding in the PDF file.
          The standard PDF fonts do not support Unicode characters.
      */
      div {
        font-family: "DejaVu Sans", "Arial", sans-serif;
        font-size: 12px;
      }

      /*
        The example loads the DejaVu Sans from the Kendo UI CDN.
        Other fonts have to be hosted from your application.
        The official site of the Deja Vu Fonts project is
        https://dejavu-fonts.github.io/.
      */
      @font-face {
        font-family: "DejaVu Sans";
        src: url("https://kendo.cdn.telerik.com/2021.2.511/styles/fonts/DejaVu/DejaVuSans.ttf") format("truetype");
      }

      @font-face {
        font-family: "DejaVu Sans";
        font-weight: bold;
        src: url("https://kendo.cdn.telerik.com/2021.2.511/styles/fonts/DejaVu/DejaVuSans-Bold.ttf") format("truetype");
      }

      @font-face {
        font-family: "DejaVu Sans";
        font-style: italic;
        src: url("https://kendo.cdn.telerik.com/2021.2.511/styles/fonts/DejaVu/DejaVuSans-Oblique.ttf") format("truetype");
      }

      @font-face {
        font-family: "DejaVu Sans";
        font-weight: bold;
        font-style: italic;
        src: url("https://kendo.cdn.telerik.com/2021.2.511/styles/fonts/DejaVu/DejaVuSans-Oblique.ttf") format("truetype");
      }

      .k-widget {
  font-family: "DejaVu Sans";
}
    </style>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
<script src="http://kendo.cdn.telerik.com/2017.2.621/js/kendo.all.min.js"></script>

<div class="content-wrapper">
    <section class="content-header">
        <div class="container-fluid">
            <div class="row mb-2">
                <div class="col-sm-6">
                    @if($type == 'edit')
                    <h1>Edit Order</h1>
                    @else
                    <h1>View Orders</h1>
                    @endif
                </div>
            </div>
        </div>
    </section>
    <section class="content">
        <div class="container-fluid">
            <div class="row">
                <div class="@if($type == 'edit') col-md-8 @else col-md-12 @endif">
                    <div class="card card-primary">
                        <div class="card-body">

                            <!-- <a onclick="ExportPdf()" class="btn btn-sm btn-primary" style="color:#fff;"> Download
                                Invoice</a> -->
                            <a href="{{ route('order.download.html', [ 'id' => $order->id ]) }}" target="_blank" class="btn btn-sm btn-primary" style="color:#fff;"> Download
                                Invoice as HTML</a>
                            <table id="bill-canvas" class="table">
                                <thead>
                                    <tr>
                                        <th colspan="7" style="text-align:center;">
                                            <h4>Madurai Kadai</h4>
                                            <p>
                                                #7, First Floor, North Gate, S.S Colony, Madurai - 625 016<br>
                                                Ph : 80125 55950 , 80125 55969<br>
                                                GSTIN : 33AGLPM5557F2Z8
                                            </p>
                                        </th>
                                    </tr>
                                    <tr>
                                        <th colspan="7" style="text-align:center;">Invoice</th>
                                    </tr>
                                    <tr>
                                        <th>Sl No</th>
                                        <!-- <th>Image</th> -->
                                        <th colspan="3">Product</th>
                                        <th>Price</th>
                                        <th>Qty</th>
                                        <th>Amount</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    @foreach ($order->order_details as $i => $order_detail)
                                    <tr>
                                        <td>{{ $i+1 }}</td>
                                        <td colspan="3">{{$order_detail->product->name}}
                                            <br>
                                            @if(@$order_detail->product->matrix1 != '')<b>{{ @$order_detail->product->matrix1 }}:</b> {{ @$order_detail->product_price->matrix1 }} @endif 
                                            @if(@$order_detail->product->matrix2 != '')<b>{{ @$order_detail->product->matrix2 }}:</b> {{ @$order_detail->product_price->matrix2 }} @endif
                                        
                                        </td>
                                        <td>
                                            <!-- <small>({{ $order_detail->weight }}x{{ $order_detail->quantity }}) {{ $order_detail->total_weight }} grams</small> -->
                                            {{ number_format($order_detail->price,2) }}
                                        </td>
                                        <td>{{ $order_detail->quantity }}</td>
                                        <td>{{ number_format($order_detail->amount,2) }}</td>
                                    </tr>
                                    @endforeach
                                    <tr>
                                        <th colspan="2">Payment Status</th>
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
                                        <th colspan="2"></th>
                                        <td></td>
                                        <td colspan="2">      
                                        @if($order->address!=null)
                                            <p>
                                                @if(substr($order->address->postcode, 0, 1) == 6)
                                                    <b>CGST:</b> {{ number_format($order->order_details->sum('cgst_amount'),2) }} &nbsp; &nbsp;
                                                    <b>SGST:</b> {{ number_format($order->order_details->sum('sgst_amount'),2) }}
                                                @else
                                                    <b>IGST:</b> {{ number_format($order->order_details->sum('igst_amount'),2) }}
                                                @endif
                                            </p>   
                                            @else
                                            <p> - </p>
                                            @endif
                                        </td>
                                        <td><b>Tax:</b></td>
                                        <td>{{ number_format($order->tax,2) }}</td>
                                    </tr>
                                    <tr>
                                        <th colspan="2">Delivery Status</th>
                                        <td colspan="2">{{ $order->delivery_status }}</td>
                                        <td > </td>
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
                                        <td colspan="3">
                                            <b>Delivery Date: </b> {{ $order->delivery_date }}
                                            <br> <b>Delivery Slot: </b> 
                                                @if(@$order->delivery_slot->default == 'Yes') 
                                                    Default Slot 
                                                @else
                                                    {{ @$order->delivery_slot->start }} - {{ @$order->delivery_slot->end }}
                                                @endif
                                            <br> <b>Payment Mode: </b> {{ $order->payment_mode }}
                                        </td>
                                    </tr>
                                    <tr>
                                        <th colspan="2">Customer Address</th>
                                        <td colspan="2">
                                            @if($order->address!=null)
                                            <span>
                                                {{ $order->address->address }}
                                            </span><br>
                                            <span> {{ $order->address->city }}, {{ $order->address->country }} - {{ $order->address->postcode }}</span>
                                            @else
                                                <span> - </span>
                                            @endif
                                        </td>
                                        <td colspan="3"></td>
                                    </tr>

                                    @if(Session::has('success'))
                                    <tr class="alert alert-success">
                                        <td colspan="7">{{ Session::get('success') }}</td>
                                    </tr>
                                    @endif
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
                @if($type == 'edit')
                <div class="col-md-4">
                    <div class="card card-primary">
                        <div class="card-header">
                            <h3 class="card-title">Delivery Update</h3>
                        </div>
                        <div class="card-body">
                            <form action="{{ route('order.update', [ 'id' => $order->id ]) }}" method="post">
                                <table id="" class="table">
                                    <tbody>
                                        <tr>
                                            <th>Status:</th>
                                            <td>
                                                <select name="delivery_status" class="form-control">
                                                    <option @if($order->delivery_status == 'Order Received') selected
                                                        @endif value="Order Received">Order Received</option>
                                                    <option @if($order->delivery_status == 'Packed') selected @endif
                                                        value="Packed">Packed</option>
                                                    <option @if($order->delivery_status == 'Out for Delivery') selected @endif
                                                        value="Out for Delivery">Out for Delivery</option>
                                                    <option @if($order->delivery_status == 'Delivered') selected @endif
                                                        value="Delivered">Delivered</option>
                                                </select>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th>Assign Rider:</th>
                                            <td>
                                                <select name="rider_id" class="form-control">
                                                    <option value="">-</option>
                                                    @foreach($riders as $rider)
                                                    <option @if($order->rider_id == $rider->id) selected @endif
                                                        value="{{ $rider->id }}">{{ $rider->name }}</option>
                                                    @endforeach
                                                </select>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <button class="btn btn-primary">Update</button>
                                            </td>
                                            <th></th>
                                        </tr>
                                    </tbody>
                                </table>
                            </form>
                        </div>
                    </div>
                </div>
                @endif
            </div>
        </div>
    </section>
</div>

<style>
.alert {
    position: relative;
    padding: .75rem 1.25rem;
    margin-bottom: 1rem;
    border: 1px solid transparent;
    border-radius: .25rem;
}

.alert-success {
    color: #155724;
    background-color: #d4edda;
    border-color: #c3e6cb;
}
</style>

<script>


kendo.pdf.defineFont({
        "DejaVu Sans":
             "https://cdn.kendostatic.com/2021.2.511/styles/fonts/DejaVu/DejaVuSans.ttf",

        "DejaVu Sans|Bold":
            "https://cdn.kendostatic.com/2021.2.511/styles/fonts/DejaVu/DejaVuSans-Bold.ttf",

        "DejaVu Sans|Bold|Italic":
             "https://cdn.kendostatic.com/2021.2.511/styles/fonts/DejaVu/DejaVuSans-Oblique.ttf",

        "DejaVu Sans|Italic":
             "https://cdn.kendostatic.com/2021.2.511/styles/fonts/DejaVu/DejaVuSans-Oblique.ttf"
    });

function ExportPdf() {
    kendo.drawing
        .drawDOM("#bill-canvas", {
            forcePageBreak: ".page-break",
            paperSize: "A4",
            margin: {
                top: "1cm",
                bottom: "1cm"
            },
            scale: 0.8,
            height: 500,
            template: $("#page-template").html(),
            keepTogether: ".prevent-split"
        })
        .then(function(group) {
            kendo.drawing.pdf.saveAs(group, "Invoice_{{$order->id}}_{{$order->created_at->toDateString()}}.pdf")
        });

}
</script>
@endsection