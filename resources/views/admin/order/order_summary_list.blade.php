@extends('layouts.app')
@section('content')
<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <div class="content-header">
        <div class="container-fluid">
            <div class="row mb-2">
                <div class="col-sm-6">
                    <h1 class="m-0 text-dark">Order Summary</h1>
                </div>
            </div>
        </div>
    </div>
    <!-- /.content-header -->

    <div class="col-md-12">
        <div class="card">
            <div class="card-body">
                <div class="tab-content">

                    <!-- main Service -->
                    <div class="tab-pane active">
                        <form action="" method="post" class="filter-custom">
                            <label for="">Start Date: </label>
                            <input type="date" name="start_date" id="" value="{{ $start_date }}">
                            <label for=""> End Date: </label>
                            <input type="date" name="end_date" id="" value="{{ $end_date }}">
                            <label for=""> Delivery Status: </label>
                            <select name="delivery_status">
                                <option value=""> -- All -- </option>
                                <option value="Order Received" @if($delivery_status == "Order Received") selected @endif>Order Received</option>
                                <option value="Packed" @if($delivery_status == "Packed") selected @endif>Packed</option>
                                <option value="Out for Delivery" @if($delivery_status == "Out for Delivery") selected @endif>Out for Delivery</option>
                                <option value="Delivered" @if($delivery_status == "Delivered") selected @endif>Delivered</option>
                            </select>
                            <input type="submit" value="Filter">
                        </form>
                        <style>
                            .filter-custom{
                                padding: 20px;
                                background: #ececec;
                                margin-bottom: 10px;
                            }
                        </style>
                        <table id="export" class="table">
                            <thead>
                                <tr>
                                    <th>Sl No</th>
                                    <th>Category</th>
                                    <th>Product</th>
                                    <th>Metrics</th>
                                    <th>Varient</th>
                                    <th>Quantity</th>
                                </tr>
                            </thead>
                            <tbody>
                                @foreach ($order_details as $i => $order_detail)
                                <tr>
                                    <td>{{ $i+1 }}</td>
                                    <td>{{ @$order_detail->product->category_id }} . {{ @$order_detail->product->category->category }}</td>
                                    <td>
                                        <img width="50px" src="{{ @$order_detail->product->ThumbnailUrl }}" alt="">
                                        <b>{{$order_detail->product->name}}</b>
                                    </td>
                                    <td>
                                        <b>@if(@$order_detail->product->matrix1 != ''){{ @$order_detail->product->matrix1 }}@endif</b><b>@if(@$order_detail->product->matrix2 != ''), {{ @$order_detail->product->matrix2 }} @endif</b>
                                    </td>
                                    <td>
                                        @if(@$order_detail->product->matrix1 != '') {{ @$order_detail->product_price->matrix1 }}@endif @if(@$order_detail->product->matrix2 != ''),  {{ @$order_detail->product_price->matrix2 }} @endif
                                    </td>
                                    <td>{{ @$order_detail->quantity }}</td>
                                </tr>
                                @endforeach
                            </tbody>
                        </table>
                    </div>


                </div>
            </div>
        </div>
    </div>

</div>

<script>
  $(document).ready(function() {
        var date = "{{ date('d-m-Y') }}";
        $('#export').DataTable( {
            dom: 'Blfrtip',
            buttons: [ { extend: 'excel', title: 'Order_Summary_'+date } ],
            responsive: true,
            autoWidth: false,
            order: [[ 1, "asc" ]]
        } );
        $('.dt-button').html('<i class="fa fa-download" aria-hidden="true"></i> Export to Excel');
    } );
</script>

<style>
 .dt-button{
    color: #fff;
    background-color: #1050AF;
    border-color: #1050AF;
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
    border-color: #1050AF;
 }

 </style>

@endsection