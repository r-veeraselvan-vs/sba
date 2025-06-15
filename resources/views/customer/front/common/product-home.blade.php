@foreach($products as $product)

@php
    $url = route('product.details', [ 'price_id' => (@$product->one_price->id ? @$product->one_price->id : 'all'), 'slug' => $product->slug ]);
@endphp


            <!-- Offer Price Validation  -->
            @if(@$product->one_price->offer_percentage)   
                @php
                    $date = strtotime(date("Y-m-d"));
                    $start_date = strtotime($product->one_price->start_date);
                    $end_date = strtotime($product->one_price->end_date);
                    if($date >= $start_date && $date <= $end_date){
                        $price = $product->one_price->offer_price;
                        $strike_price = $product->one_price->price;
                        $show = true;
                    }else{
                        $price = @$product->one_price->price;
                        $strike_price = 0;
                        $show = false;
                    }
                @endphp
            @else
                @php
                    $price = @$product->one_price->price;
                    $strike_price = 0;
                    $show = false;
                @endphp
            @endif
            <!-- Offer Price Validation  -->

<div class="product-wrap">
    <div class="product shadow-media">
        <figure class="product-media">
            <a href="{{$url}}">
                <img src="{{ $product->ThumbnailUrl }}" alt="product" width="280" height="315">
            </a>
            @if(@$product->one_price->offer_percentage && $show == true)
            <div class="product-label-group">
                <label class="product-label label-sale">{{ @$product->one_price->offer_percentage }}% Off</label>
            </div>
            @endif
            <div class="product-action-vertical">
                <a onclick="$('#cart_form_{{$product->id}}').submit();" class="btn-product-icon btn-cart" data-toggle="modal" data-target="#addCartModal"
                    title="Add to cart"><i class="d-icon-bag"></i></a>
            </div>
            <form action="{{ route('cart.add') }}" method="post" id="cart_form_{{$product->id}}">
                <input type="hidden" name="product_id" value="{{ $product->id }}">
                <input type="hidden" name="product_price_id" value="{{ @$product->one_price->id }}">
                <input type="hidden" name="price" value="{{ $price }}">
                <input type="hidden" name="offer_price" value="{{ $show == true ? $price : 0 }}">
                <input type="hidden" name="offer_expiry_date" value="{{ $show == true ? @$product->one_price->end_date : '' }}">
                <input type="hidden" name="weight" value="{{ @$product->one_price->weight }}">
                <input type="hidden" name="quantity" id="quantity" value="1">   
                <input type="hidden" name="gst" value="{{ $product->gst }}">                            
            </form>

        </figure>
        <div class="product-details">
            @php
                $heart = in_array($product->id, $wishlists);
                $type = ($heart == true) ? 'false' : 'true';
            @endphp
            <a href="{{ route('wishlist.add', [ 'product_id' => $product->id, 'type' => $type ] ) }}" class="" title="@if($heart) Remove from wishlist @else Add to wishlist @endif"><i style="color:red; float:right" class=" @if($heart) d-icon-heart-full @else d-icon-heart @endif"></i></a>
            <div class="product-cat">
                <a href="{{ route('products', [ 'menu' => 'categories', 'slug' => $product->category->slug, 'sub_slug' => 'all' ]) }}">{{ @$product->category->category }}</a>
            </div>
            <h3 class="product-name">
                <a href="{{$url}}">{{ $product->name }}</a>
            </h3>


                <div class="product-price">
                    <ins class="new-price">₹ {{ number_format($price, 2) }}</ins>
                    @if(@$product->one_price->offer_percentage  && $show == true) 
                    <del class="old-price">₹ {{ number_format($strike_price, 2) }}</del>
                    @endif
                </div>
            <div class="ratings-container">
                @php
                    $average_ratings = $product->average_ratings;
                    $star = $average_ratings * 20;
                @endphp
                <div class="ratings-full">
                    <span class="ratings" style="width:{{$star}}%"></span>
                    <span class="tooltiptext tooltip-top">{{$average_ratings}}</span>
                </div>
                <!-- <a href="#" class="rating-reviews">( 6 reviews )</a> -->
            </div>
        </div>
    </div>
</div>
@endforeach