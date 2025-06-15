@extends('layouts.new.app')

@section('content')
<div class="row">
    <div class="col-lg-12 product-first-blog">
        <a href="{{ route('home') }}" style="text-decoration: none; color: inherit;"> 
            <span> Home</span>
        </a> 
        <span>&gt; Athirasam</span>
    </div>
</div>

<div class="row product-container">
    <div class="col-lg-2 product-side-img">
        @if($product->productImages->isNotEmpty())
            @foreach($product->productImages as $image)
                <img src="{{ $image->image_url ?? asset('images/default.png') }}" class="side-img" alt="Side Image"/>
            @endforeach
        @else
            <img src="{{ asset('images/default.png') }}" class="side-img" alt="Default Image"/>
        @endif
    </div>
    
    <div class="col-lg-5 product-main-img">
        <img src="{{ $product->productImages->first()->image_url ?? asset('images/default.png') }}" id="mainProductImage" alt="{{ $product->name ?? 'Product' }}"/>
    </div>
    
    <div class="col-lg-4 product-right-img">
        <p class="product-p-1">{{ $product->name ?? 'Unnamed Product' }}</p>
        <p class="product-p-2"><i class="fa-solid fa-stopwatch"></i>{{ $product->shelf_life ?? 'N/A' }} shelf life</p>
        <p class="product-p-3">
            <del>Rs {{ $product->productPrice->price ?? 'N/A' }}</del>
            <span class="p-3-sp-1">Rs {{ $product->price ?? 'N/A' }}</span>
            @if(isset($product->discount))
                <span class="p-3-sp-2">SAVE {{ $product->discount }}%</span>
            @endif
            <span class="p-3-sp-3">({{ $product->productPrice->weight ?? 'N/A' }})</span>
        </p>
        <p class="product-p-4">
            <span class="p-4-sp-1"><i class="fa-solid fa-star"></i>{{ $product->rating ?? 'N/A' }}</span>
            <span class="p-4-sp-2">
                <i class="fa-regular fa-circle-check"></i>
                {{ $product->reviews->count() ?? 0 }} Verified Reviews
            </span>
        </p>
        <p class="product-p-5">PACKS: {{ $product->pack_type ?? 'N/A' }}</p>
        <p class="product-p-6">
            <span class="p-6-sp-1">{{ $product->pack_size ?? 'N/A' }}</span>
            <span class="p-6-sp-2">{{ $product->pack_size ?? 'N/A' }}</span>
        </p>
        <p class="product-p-7">Quantity:</p>
        <p class="product-p-8">
            <span>
                <i class="fa-solid fa-minus"></i>1<i class="fa-solid fa-plus"></i>
            </span>
        </p>
        <p class="product-p-9">Availability (India):</p>
        <p class="product-p-10">
            <span>Eg. 400324</span>
            <span>Check</span>
        </p>
        <p class="product-p-11">*Enter your pin code to check if we deliver to you</p>
        <form action="{{ route('cart.add') }}" method="POST">
            @csrf  <!-- This adds the CSRF token required by Laravel for POST requests -->
            
            <input type="hidden" name="product_id" value="{{ $product->id }}">  <!-- Assuming $product is passed to the view -->
            
            <button type="submit" class="product-p-13">Add to Cart</button>
        </form>
    </div>
</div>

<div class="row product-conatiner" style="display: none;">
    <div class="col-lg-2 product-side-img">
       <img src="{{ asset('images/product-images/left-side-1.png') }}" class="side-img" alt="Side Image 1"/>
       <img src="{{ asset('images/product-images/left-side-2.png') }}" class="side-img" alt="Side Image 2"/>
       <img src="{{ asset('images/product-images/left-side-3.png') }}" class="side-img" alt="Side Image 3"/>
       <img src="{{ asset('images/product-images/left-side-4.png') }}" class="side-img" alt="Side Image 4"/>
       <img src="{{ asset('images/product-images/left-side-1.png') }}" class="side-img" alt="Side Image 5"/>
       <img src="{{ asset('images/product-images/left-side-2.png') }}" class="side-img" alt="Side Image 6"/>
       <img src="{{ asset('images/product-images/left-side-3.png') }}" class="side-img" alt="Side Image 7"/>
       <img src="{{ asset('images/product-images/left-side-4.png') }}" class="side-img" alt="Side Image 8"/>
    </div>
    <div class="col-lg-5 product-main-img">
        <img src="{{ asset('images/product-images/center-img.png') }}" id="mainProductImage"/>
    </div>
    <div class="col-lg-4 product-right-img">
     <p class="product-p-1">Assorted Mysorepa</p>
     <p class="product-p-2"><i class="fa-solid fa-stopwatch"></i>30 days shelf life</p>
     <p class="product-p-3"><del>Rs 325</del><span class="p-3-sp-1">Rs 325</span><span class="p-3-sp-2">SAVE 26%</span><span class="p-3-sp-3">(300 g)</span></p>
     <p class="product-p-4"><span class="p-4-sp-1"><i class="fa-solid fa-star"></i>4.5</span><span class="p-4-sp-2"><i class="fa-regular fa-circle-check"></i>590 Verified Reviews</span></p>
     <p class="product-p-5">PACKS: 300 G PACK</p>
     <p class="product-p-6"><span class="p-6-sp-1">300g Pack</span><span class="p-6-sp-2">300g Pack</span></p>
     <p class="product-p-7">Quantity:</p>
     <p class="product-p-8"><span><i class="fa-solid fa-minus"></i>1<i class="fa-solid fa-plus"></i></span></p>
     <p class="product-p-9">Availability (India):</p>
     <p class="product-p-10"><span>Eg. 400324</span><span>Check</span></p>
     <p class="product-p-11">*Enter your pin code to check if we deliver to you</p>
     <button class="product-p-12">Add to cart</button>
     <button class="product-p-13">Add to cart</button>
    </div>
</div>

<script>
    const sideImages = document.querySelectorAll('.side-img');
    const mainProductImage = document.getElementById('mainProductImage');
    sideImages.forEach(image => {
        image.addEventListener('click', function() {
        const newSrc = this.src;
        mainProductImage.src = newSrc;
        });
    });
</script>

@endsection