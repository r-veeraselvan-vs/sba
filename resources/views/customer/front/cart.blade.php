@extends('layouts.app-front')
@section('content')

<main class="main cart">
    <div class="page-header bg-dark"
        style="background-image: url('/images/shop/page-header-back.jpg'); background-color: #3C63A4;">
        <h1 class="page-title">My Cart</h1>
    </div>
    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.5/jquery.min.js"></script>
    <!-- End PageHeader -->
    <div class="page-content pt-10 pb-10">
        <div class="container mt-4 mb-4">
            <div class="row gutter-lg">
                <div class="col-lg-8">
                    <h3 class="title title-simple text-left">Products List</h3>
                    <table class="shop-table cart-table mt-2">
                        <thead class="d-none">
                            <tr>
                                <th class="product-name"><span>Product</span></th>
                                <th></th>
                                <th class="product-price"><span>Price</span></th>
                                <th class="product-quantity"><span>Amount</span></th>
                                <th class="product-subtotal">Total</th>
                                <th class="product-remove"></th>
                            </tr>
                        </thead>
                        <tbody>
                            @if(count($carts) > 0)
                                @foreach($carts as $cart)
                                    @php
                                        $product_price = ($cart->offer_price > 0) ? $cart->offer_price : $cart->price;
                                        $productUrl =  route('product.details', [ 'price_id' => $cart->product_price_id, 'slug' => $cart->product->slug ]);
                                    @endphp

                                    <tr>
                                        <td class="product-thumbnail">
                                            <a href="{{ $productUrl }}">
                                                <figure>
                                                    <img src="{{ $cart->product->ThumbnailUrl}}" width="100" height="100" alt="product">
                                                </figure>
                                            </a>
                                        </td>
                                        <td class="product-name">
                                            <a href="{{ $productUrl }}">{{ $cart->product->name }}</a>
                                            <br>
                                            @if($cart->product->matrix1 != '')<b>{{ $cart->product->matrix1 }}:</b> {{ $cart->product_price->matrix1 }} @endif 
                                            @if($cart->product->matrix2 != '')<b>{{ $cart->product->matrix2 }}:</b> {{ $cart->product_price->matrix2 }} @endif 
                                        </td>
                                        <td class="product-price">
                                            <span class="amount">₹ {{ number_format($product_price, 2) }}</span>
                                        </td>
                                        <td class="product-quantity">
                                            <div class="input-group">
                                                @if($cart->quantity > 1)
                                                    @php($minusOne = route('cart.minusOne', [ 'cart_id' => $cart->id ]) )
                                                @else
                                                    @php($minusOne = route('cart.remove', [ 'cart_id' => $cart->id ]) )
                                                @endif
                                                <button class="quantity-minus d-icon-minus" onclick="hitUrl('{{ $minusOne }}')"></button>
                                                <input value="{{$cart->quantity}}" class="form-control" type="number" readonly>
                                                @php($plusOne = route('cart.plusOne', [ 'cart_id' => $cart->id ]) )
                                                <button class="quantity-plus d-icon-plus" onclick="hitUrl('{{ $plusOne }}')"></button>
                                            </div>
                                        </td>
                                        <td class="product-subtotal">
                                            <span class="amount">₹ {{ number_format($product_price * $cart->quantity, 2) }}</span>
                                        </td>
                                        <td class="product-remove">
                                            <div>
                                                <a href="{{ route('cart.remove', [ 'cart_id' => $cart->id ]) }}" class="remove" title="Remove this product"><i
                                                        class="d-icon-times"></i></a>
                                            </div>
                                        </td>
                                    </tr>
                                @endforeach
                            @else
                                <tr>
                                    <td colspan="5"> No Items in cart </td>                                     
                                </tr>
                            @endif
                            @if(Session::has('success'))                    
                                <tr>
                                    <td colspan="5">
                                        <p style="color: green;">{{ Session::get('success') }}</p>
                                    </td>
                                </tr>
                            @endif
                        </tbody>
                    </table>
                    <br>
                    <div class="cart-actions mb-6">
                        <a href="/" class="btn btn-link btn-primary btn-reveal-right">Continue Shopping<i class="d-icon-arrow-right"></i></a>
                    </div>
                </div>
                <aside class="col-lg-4 sticky-sidebar-wrapper">
                    <div class="sticky-sidebar" data-sticky-options="{'bottom': 20}">
                        <div class="summary mb-4">
                            <h3 class="title title-simple text-left">Order Summary</h3>
                            <table class="shipping">
                                <tr class="shipping-row">
                                    <td>
                                        <div class="custom-radio">
                                            <label class="custom-control-label" for="free-shipping">Delivery Charge</label>
                                        </div>
                                    </td>
                                    <td>-</td>
                                </tr>
                            </table>
                            <div class="cart-total">
                                <table>
                                    <tr class="cart-subtotal">
                                        <th>Subtotal:</th>
                                        <td>₹ {{ number_format($carts->sum('amount'), 2) }}</td>
                                    </tr>
                                    <tr class="order-total">
                                        <th>Total:</th>
                                        <td>₹ {{ number_format($carts->sum('amount'), 2) }}</td>
                                    </tr>
                                </table>
                            </div>
                        </div>
                        @if(count($carts) > 0)
                        <a href="{{ route('cart.checkout') }}" class="btn btn-primary btn-checkout">Proceed to checkout</a>
                        @else
                        <a href="/" class="btn btn-success btn-checkout">Continue Shopping</a>
                        @endif
                    </div>
                </aside>
            </div>
        </div>
    </div>
</main>

<script>
    function hitUrl(url){
        window.location = url;
    }
</script>

@endsection