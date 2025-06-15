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
                        <h2 class="title title-simple text-left pt-3">Order Details</h2>
                        <div class="order-details mb-1">
                            <table class="order-details-table">
                                <thead>
                                    <tr class="summary-subtotal">
                                        <td class="summary-subtitle">Product</td>
                                        <td class="summary-subtitle"></td>
                                        <td class="summary-subtitle">Price</td>
                                        <td class="summary-subtitle">Quantity</td>
                                        <td class="product-price"><b>
                                                <h5>Amount</h5>
                                            </b></td>
                                    </tr>
                                </thead>
                                <tbody>
                                    @foreach(@$order->order_details as $order_detail)
                                    @php
                                    $productUrl = route('product.details', [ 'slug' => @$order_detail->product->slug, 'price_id' => @$order_detail->product_price_id ]);
                                    @endphp
                                    <tr>
                                        <td>
                                            <a href="{{$productUrl}}">
                                                <img src="{{ @$order_detail->product->ThumbnailUrl }}" width="50"
                                                    height="50" alt="{{ @$order->order_detail->product->name }}">
                                            </a>
                                        </td>
                                        <td> <a href="{{$productUrl}}">{{ @$order_detail->product->name }}</a> 
                                            <br>
                                            @if(@$order_detail->product->matrix1 != '')<b>{{ @$order_detail->product->matrix1 }}:</b> {{ @$order_detail->product_price->matrix1 }} @endif 
                                            @if(@$order_detail->product->matrix2 != '')<b>{{ @$order_detail->product->matrix2 }}:</b> {{ @$order_detail->product_price->matrix2 }} @endif
                                        </td>
                                        <td>{{ number_format($order_detail->price, 2) }}</td>
                                        <td>{{ @$order_detail->quantity }}</td>
                                        <td class="product-price">₹ {{ number_format($order_detail->amount, 2) }}</td>
                                    </tr>
                                    @endforeach

                                    <tr class="summary-subtotal">
                                        <td colspan="3"></td>
                                        <td class="summary-subtitle">Subtotal: </td>
                                        <td class="summary-subtotal-price">₹
                                            {{ number_format($order->order_details->sum('amount'), 2) }}</td>
                                    </tr>
                                    <tr class="summary-subtotal">
                                        <td colspan="3"></td>
                                        <td class="summary-subtitle">Shipping: </td>
                                        <td class="summary-subtotal-price">₹
                                            {{ number_format($order->shipping_charge, 2) }}</td>
                                    </tr>
                                    <tr class="summary-subtotal">
                                        <td colspan="3"></td>
                                        <td class="summary-subtitle">GST: </td>
                                        <td class="summary-subtotal-price">₹
                                            {{ number_format($order->tax, 2) }}</td>
                                    </tr>
                                    <tr class="summary-subtotal">
                                        <td colspan="3"></td>
                                        <td class="summary-subtitle">Total</h4>
                                        </td>
                                        <td>
                                            <p class="summary-total-price">₹ {{ number_format($order->net_amount, 2) }}</p>
                                        </td>
                                    </tr>
                                    <tr class="summary-subtotal">
                                        <td colspan="3"></td>
                                        <td class="summary-subtitle">Order Status: </td>
                                        <td class="summary-subtotal-price">{{ $order->status }}</td>
                                    </tr>
                                    <tr class="summary-subtotal">
                                        <td colspan="3"></td>
                                        <td class="summary-subtitle">Delivery Date: </td>
                                        <td class="summary-subtotal-price">{{ $order->delivery_date }}</td>
                                    </tr>
                                    <tr class="summary-subtotal">
                                        <td colspan="3"></td>
                                        <td class="summary-subtitle">Delivery Slot: </td>
                                        <td class="summary-subtotal-price">
                                            @if(@$order->delivery_slot->default == 'Yes') 
                                                Default Slot 
                                            @else
                                                {{ @$order->delivery_slot->start }} - {{ @$order->delivery_slot->end }}
                                            @endif
                                        </td>
                                    </tr>
                                    <tr class="summary-subtotal">
                                        <td colspan="3"></td>
                                        <td class="summary-subtitle">Payment Mode: </td>
                                        <td class="summary-subtotal-price">{{ $order->payment_mode }}</td>
                                    </tr>
                                    <tr class="summary-subtotal">
                                        <td colspan="3"></td>
                                        <td class="summary-subtitle">Delivery Status: </td>
                                        <td class="summary-subtotal-price">{{ $order->delivery_status }}</td>
                                    </tr>
                                    <tr class="summary-subtotal">
                                        <td colspan="3">
                                            <h2 class="title title-simple text-left pt-8">Billing Address</h2>
                                            <div class="address-info">
                                                <p class="address-detail pb-2">
                                                    {{ $order->address->address }}, <br>
                                                    {{ $order->address->city }} - {{ $order->address->postcode }},
                                                    {{ $order->address->country }}
                                                </p>
                                            </div>
                                        </td>
                                        <td colspan="3"></td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>

                        <a href="{{ route('customer.orders') }}" class="btn btn-icon-left btn-back btn-md mb-4"><i
                                class="d-icon-arrow-left"></i> Back to List</a>
                    </div>
                    <!-- my profile -->
                </div>
            </div>
        </div>
    </div>
</main>

@endsection