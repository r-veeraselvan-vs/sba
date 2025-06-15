@extends('layouts.appdownload')
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
   
    <section class="content">
        <div class="container-fluid">
            <div class="row">
                     <div class="card card-primary">
                        <div class="card-body">

                           
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
                                            <p>
                                                @if(substr($order->address->postcode, 0, 1) == 6)
                                                    <b>CGST:</b> {{ number_format($order->order_details->sum('cgst_amount'),2) }} &nbsp; &nbsp;
                                                    <b>SGST:</b> {{ number_format($order->order_details->sum('sgst_amount'),2) }}
                                                @else
                                                    <b>IGST:</b> {{ number_format($order->order_details->sum('igst_amount'),2) }}
                                                @endif
                                            </p>                                        
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
                                            <span>
                                                {{ $order->address->address }}
                                            </span><br>
                                            <span> {{ $order->address->city }}, {{ $order->address->country }} - {{ $order->address->postcode }}</span>
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