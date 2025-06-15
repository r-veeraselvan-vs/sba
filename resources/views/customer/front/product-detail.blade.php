@extends('layouts.app-front-demo2')
@section('content')

<main class="main mt-4">
    <div class="page-content mb-10">
        <div class="container">
            <div class="product product-single row mb-4">
                <div class="col-md-6">
                    <div class="product-gallery pg-vertical">
                        <div class="product-single-carousel owl-carousel owl-theme owl-nav-inner row cols-1" id="carousel">
                            @foreach($product->images as $img)
                                <figure class="product-image">
                                    <img src="{{ $img->ImageUrl }}" data-zoom-image="{{ $img->ImageUrl }}" alt="{{ $product->name }}" width="800" height="900">
                                </figure>
                            @endforeach
                            <!-- #caurosels -->
                        </div>
                        <div class="product-thumbs-wrap">
                            <div class="product-thumbs" id="thumbs">
                                @foreach($product->images as $i => $img)
                                    <div class="product-thumb @if($i == 0) active @endif">
                                        <img src="{{ $img->ImageUrl }}" alt="{{ $product->name }}" width="109" height="122">
                                    </div>
                                @endforeach
                            <!-- #thumbs -->
                            </div>
                            <button class="thumb-up disabled"><i class="fas fa-chevron-left"></i></button>
                            <button class="thumb-down disabled"><i class="fas fa-chevron-right"></i></button>
                        </div>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="product-details">
                        
                        @if(Session::get('success')) <p class="sxs">{{ Session::get('success') }}</p> @endif
                        <style>
                        .sxs{
                            color: #212f21;
                            padding: 15px 95px;
                            background-color: #cfe470;
                            font-size: 14px;
                            font-weight: bold;
                            width: fit-content;
                            border-radius: 25px;
                        }
                        </style>

                        <h1 class="product-name">{{ $product->name }}</h1>
                        @php
                            $heart = in_array($product->id, $wishlists);
                            $type = ($heart == true) ? 'false' : 'true';
                        @endphp 
                        <a href="{{ route('wishlist.add', [ 'product_id' => $product->id, 'type' => $type ] ) }}" class="" title="@if($heart) Remove from wishlist @else Add to wishlist @endif"><i style="color:red; float:right" class=" @if($heart) d-icon-heart-full @else d-icon-heart @endif"></i></a>
                        
                        <div class="product-meta">
                            CATEGORY: <a href="{{ route('products', [ 'menu' => 'categories', 'slug' => $product->category->slug, 'sub_slug' => 'all' ]) }}"><span class="product-sku">{{ $product->category->category }}</span></a> <br>
                            SUBCATEGORY: <a href="{{ route('products', [ 'menu' => 'categories', 'slug' => $product->category->slug, 'sub_slug' => $product->subcategory->slug ]) }}"><span class="product-sku">{{ $product->subcategory->subcategory }}</span></a>
                        </div>
                        
                        <div class="ratings-container">
                            <div class="ratings-full">
                                @php
                                    $average_ratings = $product->average_ratings;
                                    $star = $average_ratings * 20;
                                @endphp
                                <span class="ratings" style="width:{{$star}}%"></span>
                                <span class="tooltiptext tooltip-top">{{ $average_ratings }}</span>
                            </div>
                            <div>
                                @if($selected_price->inventory > 0)
                                <span class="tip tip-green">In Stock</span>
                                @else
                                <span class="tip tip-red">Out of Stock</span>
                                @endif
                                @if($product->nonreturnable == 'No')
                                    &nbsp; <span class="tip tip-info" style="padding-left: 10px;">Non Returnable</span>
                                @endif
                            </div>
                            
                            <style>
                                .tip-green{
                                    background-color: #559c15;
                                }
                                .tip-red{
                                    background-color: #9c1515;
                                }
                                .tip-info{
                                    background-color: #132398;
                                }
                            </style>

                        </div>
                        <p class="product-short-desc">{!! $product->description !!}</p>

                        @if($product->matrix1)
                            <div class="product-form product-variations product-color">
                                <label>{{ $product->matrix1 }}:</label>
                                <div class="select-box">
                                    <select name="color" class="form-control" onChange="loadMatrix2();" id="matrix1" required>
                                        <option value="" selected="selected">Choose an Option</option>
                                        @foreach($matrix1_array as $matrix_one)
                                            <option value="{{ $matrix_one }}" @if($matrix_one == $selected_price->matrix1) selected @endif>{{ ucfirst($matrix_one) }}</option>
                                        @endforeach
                                    </select>
                                </div>
                            </div>
                        @endif
                        @if($product->matrix2)
                            <div class="product-form product-variations product-size" onChange="selectMatrix2();" required>
                                <label>{{ $product->matrix2 }}:</label>
                                <div class="product-form-group">
                                    <div class="select-box">
                                        <select name="size" class="form-control" id="matrix2">
                                        </select>
                                    </div>
                                </div>
                            </div>
                        @endif
                        
                        <script>
                            $(function() { onloadMatrix2(); });
                            
                            function onloadMatrix2(){
                                $('#matrix2').empty();
                                var matrix1 = "{{$selected_price->matrix1}}";                                
                                setImage(matrix1);
                                var matrix1Arr = @json($matrix_ones);
                                var filteredArray = matrix1Arr.filter(x => x.matrix1 == matrix1);
                                var options = filteredArray.forEach( function(item, index){
                                    var sel = ('{{ $selected_price->matrix2}}' == item.matrix2) ? 'selected' : '';
                                    $('#matrix2').append('<option value="'+item.id+'"'+sel+'>'+item.matrix2+'</option>');
                                });
                            }

                            function loadMatrix2(){
                                 var matrix1 = $('#matrix1').val();
                                var matrix1Arr = @json($matrix_ones);
                                var filteredArray = matrix1Arr.filter(x => x.matrix1 == matrix1);
                                if(filteredArray){
                                    var url = '{{ url("product") }}'+'/'+(filteredArray[0].id)+'/'+'{{$product->slug}}';
                                    window.location = url;
                                }else{
                                    alert('Out of Stock');
                                }
                            }

                            function selectMatrix2(){
                                var matrix2 = $('#matrix2').val();
                                var matrix1Arr = @json($matrix_ones);
                                var filteredArray = matrix1Arr.filter(x => x.id == matrix2);
                                if(filteredArray){
                                    var url = '{{ url("product") }}'+'/'+(filteredArray[0].id)+'/'+'{{$product->slug}}';
                                    window.location = url;
                                }else{
                                    alert('Out of Stock');
                                }
                            }

                            // Images Rendering
                            function setImage(matrix1){
                                if(matrix1 != ''){
                                    $('#carousel').empty();
                                    $('#thumbs').empty();
                                    var imagesArr = @json($product->images);
                                    var filteredArray = imagesArr.filter(x => x.matrix1 == matrix1);
                                    console.log('Filtered Images of '+ matrix1, filteredArray)
                                    filteredArray.forEach( function(item, index){
                                        $('#carousel').append('<figure class="product-image">'+
                                            '<img src="'+item.ImageUrl+'" data-zoom-image="'+item.ImageUrl+'" alt="'+item.name+'" width="800" height="900">'+
                                        '</figure>');
                                        var act = (index == 0) ? 'active' : '';
                                        $('#thumbs').append('<div class="product-thumb '+act+'">'+
                                            '<img src="'+item.ImageUrl+'" alt="'+item.name+'" width="109"vheight="122">'+
                                        '</div>');
                                    });
                                }
                            }
                            // Images Rendering
                        </script>

                        
                        <!-- Offer Price Validation  -->
                        @if($selected_price->offer_percentage)   
                            @php
                                $date = strtotime(date("Y-m-d"));
                                $start_date = strtotime($selected_price->start_date);
                                $end_date = strtotime($selected_price->end_date);
                                if($date >= $start_date && $date <= $end_date){
                                    $price = $selected_price->offer_price;
                                    $strike_price = $selected_price->price;
                                    $show = true;
                                }else{
                                    $price = $selected_price->price;
                                    $strike_price = 0;
                                    $show = false;
                                }
                            @endphp
                        @else
                            @php
                                $price = $selected_price->price;
                                $strike_price = 0;
                                $show = false;
                            @endphp
                        @endif
                        <!-- Offer Price Validation  -->

                        <hr class="product-divider">


                        @if($selected_price->inventory > 0)
                        <div >
                            <div style="display: flex;">                                
                                <div class="product-price price px-2"> ₹ {{ number_format($price, 2) }} </div> 
                                @if($selected_price->offer_percentage && $show == true) 
                                <del class="old-price" style="padding-left: 10px;"> ₹ {{ number_format($strike_price, 2) }} </del> 
                                <i class="offer-percentage" style="font-size: 16px; padding: 7px 10px; color: green;">({{$selected_price->offer_percentage}}% OFF)</i>
                                @endif
                            </div>
                            @if($price && $selected_price->inventory > 0)
                            <div> Exclusive of taxes </div>
                            @endif
                        </div>
                        <!-- Add Cart -->
                            <form action="{{ route('cart.add') }}" method="post" id="add-cart">
                                <!-- product_id :  -->
                                    <input type="hidden" name="product_id" value="{{ $product->id }}">
                                    <!-- <br>
                                price id:  -->
                                    <input type="hidden" name="product_price_id" value="{{ $selected_price->id }}">
                                    <!-- <br>
                                price :  -->
                                    <input type="hidden" name="price" value="{{ $selected_price->price }}">
                                    <!-- <br>
                                offer_price :  -->
                                    <input type="hidden" name="offer_price" value="{{ $show == true ? $selected_price->offer_price : 0 }}">
                                    <input type="hidden" name="offer_expiry_date" value="{{ $show == true ? $selected_price->end_date : '' }}">
                                    <!-- <br>
                                Weight :  -->
                                    <input type="hidden" name="weight" value="{{ $selected_price->weight }}">
                                    <!-- <br>
                                quantity :  -->
                                    <input type="hidden" name="quantity" id="quantity" value="{{ $cart ? $cart->quantity : 1 }}">                            
                                    <!-- <br>
                                gst :  -->
                                    <input type="hidden" name="gst" value="{{ $product->gst }}">                            
                            </form>
                            <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.5/jquery.min.js"></script>
                            <script>
                                $( document ).ready(function( $ ) {
                                    $('#plus').click(function(){
                                        var qty = $('#qty').val();
                                        $('#qty').val(parseInt(qty) + 1);
                                    });
                                    $('#minus').click(function(){
                                        var qty = $('#qty').val();
                                        if(qty>1){
                                            $('#qty').val(parseInt(qty) - 1);
                                        }
                                    });

                                    $('.qty').click(function(e){
                                        var qty = $('#qty').val();
                                        $('#quantity').val(qty);
                                    });
                                    $('#add-to-cart').click(function(e){
                                        e.preventDefault();
                                        var quantity = $('#qty').val();

                                        var inventory = '{{ $selected_price->inventory }}';

                                        if(quantity > '0'){
                                            if(quantity <= parseInt(inventory)){
                                                $('#add-cart').submit();
                                                $('#error').html('');
                                            }else{
                                                $('#error').html('Out of stock, only '+inventory+' available.');
                                            }
                                        }else{
                                            $('#error').html('Please choose quantity');
                                        }
                                    });
                                });
                            </script>
                        <!-- Add Cart -->
                            <div class="product-form product-qty">
                                <label>QTY:</label>
                                <div class="product-form-group">
                                    <div class="input-group">
                                        <button id="minus" class="quantity-minus d-icon-minus qty"></button>
                                        <input id="qty" class="form-control" type="number" value="{{ $cart ? $cart->quantity : 1 }}" readonly>
                                        <button id="plus" class="quantity-plus d-icon-plus qty"></button>
                                    </div>
                                    <button class="btn-product btn-cart" type="submit" id="add-to-cart"><i class="d-icon-bag"></i>Add To Cart</button>
                                </div>
                            </div>
                        @else
                        <p style="color: red;">Out of stock, currently unavailable</p>
                        @endif

                    </div>
                </div>
            </div>

            
            @if(Session::has('success'))
                <div style="color:green;">{{ Session::get('success') }}</div>  <br>
            @endif
            
            <div class="tab tab-nav-simple product-tabs mb-4">
                <ul class="nav nav-tabs" role="tablist">
                    @if($product->features)
                        <li class="nav-item @if(Session::get('tab') != 'review') active @endif">
                            <a class="nav-link" href="#feature">Benefits</a>
                        </li>
                    @endif
                    @if($product->specifications)
                        <li class="nav-item">
                            <a class="nav-link" href="#product-tab-additional">Nutritional Data</a>
                        </li>
                    @endif
                    <li class="nav-item">
                        <a class="nav-link  @if(Session::get('tab') == 'review') active @endif" href="#product-tab-reviews">Reviews & Rating</a>
                    </li>
                </ul>
                <div class="tab-content">           
                    <!-- Features -->
                    @include('customer.front.common.features')
                    <!-- Specifications -->
                    @include('customer.front.common.specifications') 
                    <!-- Reviews -->
                    @include('customer.front.common.reviews')                   
                </div>
            </div>
            
            @if($products)
                <!-- Related Products -->
                <section>
                    <h2 class="title">Related Products</h2>
                    <div class="row">
                        @include('customer.front.common.product')
                    </div>
                </section>
                <!-- Related Products -->
            @endif

        </div>
    </div>
</main>

@endsection