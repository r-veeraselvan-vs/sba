@extends('layouts.app-front')
@section('content')
<main class="main account">
    <div class="page-header" style="background-image: url('/images/page-header.jpg'); background-color: #3C63A4;">
        <h1 class="page-title">My Orders</h1>
    </div>
    <!-- End PageHeader -->
    <div class="page-content mt-10 mb-10">
        <div class="container pt-1">
            <div class="tab tab-vertical">
                <!-- Side Menu -->
                @include('customer.back.common.sidebar')
                <!-- Side Menu -->

                <div class="tab-content">

                    <!-- my profile -->
                    <div class="tab-pane active in" id="profile">
                        <div class="page-content pt-10 pb-10">
                                @if(Session::has('success'))
                                    <div>
                                        <div class="order-success" role="alert">
                                            <div class="thank">Thank You!</div>
                                            <div class="success-message">{{ Session::get('success') }}</div>
                                            <a href="{{ route('customer.orders') }}" class="btn btn-primary"> Order List</a>
                                        </div>  
                                    </div>
                                    <style>
                                        .order-success{   
                                            padding: 20px;                                         
                                            width: 100%;
                                            text-align: center;
                                            background-image: url('https://cdna.artstation.com/p/assets/images/images/024/747/692/large/julia-leister-20200303-140052000-ios.jpg?1583404073');
                                        }
                                        .thank {
                                            font-size: 50px;
                                        }
                                        .success-message {
                                            color: green;
                                            font-size: 25px;
                                        }
                                    </style>
                                @else
                                    <h5>My Orders List</h5>
                                    <table class="shop-table wishlist-table mt-2 mb-4">
                                        <thead>
                                            <tr>
                                                <th class="product-name"><span>Product</span></th>
                                                <th></th>
                                                <th class="product-add-to-cart">Item</th>
                                                <th class="product-price"><span>Total</span></th>
                                                <th class="product-stock-status"><span>status / Date / Slot</span></th>
                                                <th class="product-add-to-cart">Order Details</th>
                                            </tr>
                                        </thead>
                                        <tbody class="wishlist-items-wrapper">
                                            @foreach(@$orders as $order)
                                                @php
                                                    $productUrl =  route('product.details', [ 'slug' => @$order->order_detail->product->slug, 'price_id' => @$order->order_detail->product_price_id ]);
                                                @endphp
                                                <tr>
                                                    <td class="product-thumbnail">
                                                        <a href="{{$productUrl}}">
                                                            <figure>
                                                                <img src="{{ @$order->order_detail->product->ThumbnailUrl }}" width="100"
                                                                    height="100" alt="{{ @$order->order_detail->product->name }}">
                                                            </figure>
                                                        </a>                                                
                                                    </td>
                                                    <td class="product-name">
                                                        <a href="{{$productUrl}}">{{ @$order->order_detail->product->name }}</a> 
                                                        <br>
                                                        @if(@$order->order_detail->product->matrix1 != '')<b>{{ @$order->order_detail->product->matrix1 }}:</b> {{ @$order->order_detail->product_price->matrix1 }} @endif 
                                                        @if(@$order->order_detail->product->matrix2 != '')<b>{{ @$order->order_detail->product->matrix2 }}:</b> {{ @$order->order_detail->product_price->matrix2 }} @endif
                                                    </td>
                                                    <td class="product-name">{{ @$order->items }}</td>
                                                    <td class="product-price">
                                                        <span class="amount">₹ {{ number_format($order->net_amount, 2) }}
                                                        <br> <p style="color: #26b;">{{ $order->payment_mode }}</p> </span>
                                                    </td>
                                                    <td class="product-stock-status">
                                                        <span>
                                                            {{ @$order->delivery_status }} <br>
                                                            <b class="wishlist-in-stock">{{ @$order->created_at->format('d/m/Y') }}</b><br>
                                                            <i style="color: #26b;">{{ @$order->delivery_slot->start }} - {{ @$order->delivery_slot->end }}</i>
                                                        </span>
                                                    </td>
                                                    <td class="product-add-to-cart">
                                                        <a href="{{ route('customer.orderdetails', [ 'id' => $order->id ]) }}" class="btn-product"><span>View</span></a>
                                                        @if($order->change_required)
                                                            <a >Change Req: ₹ {{ $order->change_required }}</a>
                                                        @endif
                                                    </td>
                                                </tr>
                                            @endforeach
                                                <tr>
                                                    <td class="product-thumbnail"></td>
                                                    <td class="product-name"></td>
                                                    <td class="product-name"></td>
                                                    <td class="product-price"></td>
                                                    <td colspan="2">{{ $orders->links() }}</td>
                                                </tr>
                                        </tbody>
                                    </table>
                                @endif
                        </div>

                    </div>
                    <!-- my profile -->
                </div>
            </div>
        </div>
    </div>
</main>

@endsection