@extends('layouts.app-front')
@section('content')

<main class="main cart">
    <div class="page-header bg-dark"
        style="background-image: url('/images/shop/page-header-back.jpg'); background-color: #3C63A4;">
        <h1 class="page-title">Order Summary</h1>
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
                                    @endphp

                                    <tr>
                                        <td class="product-thumbnail">
                                            <a>
                                                <figure>
                                                    <img src="{{ $cart->product->ThumbnailUrl}}" width="100" height="100" alt="product">
                                                </figure>
                                            </a>
                                        </td>
                                        <td class="product-name">
                                            <a>{{ $cart->product->name }}</a>
                                            <br>
                                            @if($cart->product->matrix1 != '')<b>{{ $cart->product->matrix1 }}:</b> {{ $cart->product_price->matrix1 }} @endif 
                                            @if($cart->product->matrix2 != '')<b>{{ $cart->product->matrix2 }}:</b> {{ $cart->product_price->matrix2 }} @endif
                                        </td>
                                        <td class="product-price">
                                            <span class="amount">{{$cart->quantity}}</span>
                                        </td>
                                        <td>
                                            <span class="amount">X</span>
                                        </td>
                                        <td class="product-price">
                                            <span class="amount">₹ {{ number_format($product_price, 2) }}</span>
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
                            @endif
                        </tbody>
                    </table>
                    <br>
                    <div class="cart-actions mb-6">
                        <a href="{{ route('cart') }}" class="btn btn-link btn-primary btn-reveal-right">Go to Cart<i class="d-icon-arrow-right"></i></a>
                    </div>
                </div>
                <aside class="col-lg-4 sticky-sidebar-wrapper">
                    <div class="sticky-sidebar" data-sticky-options="{'bottom': 20}">
                        <div class="summary mb-4">
                                <h3 class="title title-simple text-left">Promo Code</h3>
                                <form action="" method="post">
                                    <table>
                                        <tr class="cart-subtotal">
                                            <th>
                                                <input type="text" name="promo_code" value="{{ @$data['promo_code'] }}" class="form-control" required>
                                            </th>
                                            <td>
                                                <input type="submit" value="Apply" class="btn btn-promary">
                                            </td>
                                        </tr>
                                        <tr>
                                            <td colspan="2">
                                                @if($data)
                                                    @if($data['status'] == 'Success')
                                                        <p style="color: green;">{{ $data['message'] }}</p>
                                                    @else
                                                        <p style="color: red;">{{ $data['message'] }}</p>
                                                    @endif
                                                @endif
                                            </td>
                                        </tr>
                                    </table>
                                </form>
                                <h3 class="title title-simple text-left">Order Summary</h3>
                                <table>
                                    <tr class="cart-subtotal">
                                        <th>Subtotal:</th>
                                        <td>₹ {{ number_format($carts->sum('amount'), 2) }}</td>
                                    </tr>
                                </table>
                            <div class="cart-total">
                                <table>
                                    <tr class="cart-subtotal">
                                        <th>Shipping:</th>
                                        <td>₹ {{ number_format($order->shipping_charge, 2) }}</td>
                                    </tr>
                                    <tr class="cart-subtotal">
                                        <th>GST:</th>
                                        <td>₹ {{ number_format($order->tax, 2) }}</td>
                                    </tr>
                                    <tr class="order-total">
                                        <th>Total:</th>
                                        <td>₹ {{ number_format($order->net_amount, 2) }}</td>
                                    </tr>
                                </table>
                            </div>
                            <br>
                            <form action="{{ route('cart.payment.cod', [ 'order_id' => $order->id ]) }}" method="post">
                            <div class="cart-total">
                                <table>
                                    <tr class="cart-subtotal">
                                        <th>
                                            <h3 class="title title-simple text-left">Choose Slot for delivery:</h3>
                                            <b style="float: left;">Delivery Date:</b>
                                            <select name="delivery_date" id="delivery_date" class="form-control" required onChange="changeSlots()">                                           
                                                <option value="">-- Select --</option>
                                                @foreach($upcomming_slots as $date)
                                                <option value="{{ $date['date'] }}">{{ Carbon\Carbon::parse($date['date'])->format('d-m-Y') }} ({{ $date['day'] }})</option>
                                                @endforeach
                                            </select>
                                            <br>
                                            <b style="float: left;">Choose Slots:</b>
                                            <select name="delivery_slot_id" id="delivery_slot_id" class="form-control" required>                                           
                                                <option value="">-- Select Slot --</option>
                                            </select>
                                            <script>
                                                function changeSlots(){
                                                    $('#delivery_slot_id').empty();
                                                    var delivery_date = $('#delivery_date').val();
                                                    var upcomming_slots = @json($upcomming_slots);
                                                    Object.keys(upcomming_slots).forEach(function(key) {
                                                        var val = upcomming_slots[key];
                                                        if(val.date == delivery_date){
                                                            console.log(val.date, delivery_date)
                                                            var slots = val.slots;
                                                            $('#delivery_slot_id').append('<option value="">-- Select Slot --</option>');
                                                            slots.forEach( function(item, index){
                                                                $('#delivery_slot_id').append('<option value="'+item.id+'">'+item.start+' - '+item.end+'</option>');
                                                            }); 
                                                        }
                                                    });
                                                }

                                                function updateDeliveryFields(){
                                                    var data = {
                                                        order_id: '{{ $order->id }}',
                                                        delivery_date : $('#delivery_date').val(),
                                                        delivery_slot_id : $('#delivery_slot_id').val()
                                                    };
                                                    var url = "{{ route('update.delivery.fields') }}";
                                                    $.post(url, data, function(response){
                                                        console.log('response', response)
                                                    });
                                                }
                                            </script>                                            
                                            <br>
                                            <b style="float: left;">Payment Method:</b>
                                            <select name="payment_mode" id="payment_mode" class="form-control" required onChange="checkCOD()">                                            
                                                <option value="">-- Select --</option>
                                                @if($online_payment == 'Yes')
                                                <option value="Online">Online</option>
                                                @endif
                                                <option value="COD">COD</option>
                                            </select>
                                            <br>
                                            <div id="change_required">
                                                <b style="float: left;">Change required:</b>
                                                <input type="number" name="change_required" class="form-control" placeholder="Enter Amount, if change need">
                                            </div>
                                        </th>
                                    </tr>
                                </table>
                            </div>
                        </div>
                        <!-- <button type="submit" id="payment_button" class="btn btn-success btn-checkout">Make Payment</button> -->
                        <button type="submit" id="place_order" class="btn btn-success btn-checkout">Place Order</button>
                        </form>

                        <!-- Razor Pay -->
                        <?php
                            $net_amount = $order->net_amount * 100;
                            $customer_name = $order->user->name;
                            $customer_mobile = $order->user->mobile;
                            $customer_email = $order->user->email;
                        ?>
                        <form id="payment_button" action="{{ route('cart.payment.online') }}" method="POST" >
                                @csrf
                                <script src="https://checkout.razorpay.com/v1/checkout.js"
                                        data-key="rzp_test_xWb7GHDjhrvmfl"
                                        data-amount="{{$net_amount}}"
                                        data-buttontext="Make Payment"
                                        data-name="Direct Farms"
                                        data-image="{{ asset('/logo/DFLogo1.jpg') }}"
                                        data-prefill.name="{{ $customer_name }}"
                                        data-prefill.email="{{ $customer_email }}"
                                        data-prefill.contact="{{ $customer_mobile }}"
                                        data-theme.color="#ff7529">
                                </script>
                            </form>
                        </div>
                        <style>
                            input.razorpay-payment-button {
                                color: #fff !important;
                                background-color: #2266bb !important;
                                width: 100% !important;
                                text-align: center !important;
                                padding: 7px;
                            }
                        </style>
                        <!-- Razor Pay -->
                    </div>
                </aside>
            </div>
        </div>
    </div>
</main>

<script>
    $('#payment_button').hide();
    $('#place_order').hide();
    $('#change_required').hide();

    function checkCOD(){
        var payment_mode = $('#payment_mode').val();
        if(payment_mode == 'COD'){
            $('#payment_button').hide();
            $('#place_order').show();
            $('#change_required').show();
        }else{
            $('#payment_button').show();
            $('#place_order').hide();
            $('#change_required').hide();
            updateDeliveryFields();
        }
    }
</script>

@endsection