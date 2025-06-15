@extends('layouts.app-front')
@section('content')
<main class="main">
    <div class="page-content">
        <section class="intro-section">

        <!-- Banners -->

        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
                <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
                <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

                <div class="new-container">
                    <div id="myCarousel" class="carousel slide" data-ride="carousel">
                        <!-- Indicators -->
                        <ol class="carousel-indicators">
                            @foreach($banners as $i => $banner)
                                <li data-target="#myCarousel" data-slide-to="0" class=" @if($i == 0) active @endif"></li>
                            @endforeach
                        </ol>

                        <!-- Wrapper for slides -->
                        <div class="carousel-inner">
                            @foreach($banners as $i => $banner)
                                <div class="item @if($i == 0) active @endif">
                                    <img src="{{ $banner->ImageUrl }}" alt="Image" style="width:100%;">
                                </div>
                            @endforeach
                        </div>

                        <!-- Left and right controls -->
                        <a class="left carousel-control" href="#myCarousel" data-slide="prev">
                            <span class="glyphicon glyphicon-chevron-left"></span>
                            <span class="sr-only">Previous</span>
                        </a>
                        <a class="right carousel-control" href="#myCarousel" data-slide="next">
                            <span class="glyphicon glyphicon-chevron-right"></span>
                            <span class="sr-only">Next</span>
                        </a>
                    </div>
                </div>
            <!-- Banners -->

            <!-- news -->
            <div class="service-list container-fluid news">
                <marquee width="100%" direction="left">
                    @foreach($news as $n)
                        <a @if($n->url) href="{{ $n->url }}" target="_blank" @endif><i class="fa fa-check-circle"></i> {{ $n->news }}</a>
                    @endforeach
                </marquee>
            </div>
            <style>
                .news{
                    padding: 20px;
                }

                .news a{
                    padding: 0px 10px;
                }
            </style>
            <!-- news -->
            
            <div class="service-list container appear-animate">
                <div class="owl-carousel owl-theme row cols-lg-3 cols-sm-2 cols-1" data-owl-options="{
                                'items': 3,
                                'nav': false,
                                'dots': false,
                                'margin': 20,
                                'autoplay': true,
                                'autoplayTimeout': 5000,
                                'responsive': {
                                    '0': {
                                        'items': 1
                                    },
                                    '576': {
                                        'items': 2
                                    },
                                    '992': {
                                        'items': 3,
                                        'loop': false
                                    }
                                }
                            }">
                    <div class="icon-box icon-box-side icon-box1 appear-animate" data-animation-options="{
                                    'name': 'fadeInRightShorter',
                                    'delay': '.3s'
                                }">
                        <i class="icon-box-icon d-icon-truck"></i>
                        <div class="icon-box-content">
                            <h4 class="icon-box-title">Free Delivery in Madurai</h4>
                            <p>For Orders Above Rs. {{ $settings->minimum_order_amount }}</p>
                        </div>
                    </div>

                    <div class="icon-box icon-box-side icon-box2 appear-animate" data-animation-options="{
                                    'name': 'fadeInRightShorter',
                                    'delay': '.4s'
                                }">
                        <i class="icon-box-icon d-icon-service"></i>
                        <div class="icon-box-content">
                            <h4 class="icon-box-title">Customer Support 24/7</h4>
                            <p>80125 55950</p>
                        </div>
                    </div>

                    <div class="icon-box icon-box-side icon-box3 appear-animate" data-animation-options="{
                                    'name': 'fadeInRightShorter',
                                    'delay': '.5s'
                                }">
                        <i class="icon-box-icon d-icon-secure"></i>
                        <div class="icon-box-content">
                            <h4 class="icon-box-title">Cash on Delivery</h4>
                            <p>Simple payment method!</p>
                        </div>
                    </div>
                </div>
            </div>
        </section>
            <div class="container home-suc-msg">
                @if(Session::get('success')) <div class="sxs">{{ Session::get('success') }}</div> @endif
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
                .home-suc-msg {
                    text-align: -webkit-center;
                }
                </style>
            </div>

        <section class="grey-section pt-10 pb-10 appear-animate" data-animation-options="{
                    'delay': '.3s'
                }">
            <div class="container pt-3">
                <h2 class="title">Browse Our Categories</h2>
                
                <!-- Caraosul new -->
                <section class="product-wrapper container appear-animate mt-10 pt-3 pb-8" data-animation-options="{ 'delay': '.3s' }">
                    <div class="owl-carousel owl-theme row owl-nav-full cols-2 cols-md-3 cols-lg-4" data-owl-options="{ 'items': 5, 'nav': false, 'loop': false, 'dots': true, 'margin': 20, 'responsive': { '0': { 'items': 2 }, '768': { 'items': 3 }, '992': { 'items': 4, 'dots': false, 'nav': true } } }">
                        @foreach($categories as $category)
                            <!-- <div class="col-md-3 col-6 mb-4"> -->
                                <div class="category category-default category-default-1 category-absolute overlay-zoom">
                                    <a href="{{ route('products', [ 'menu' => 'categories', 'slug' => $category->slug, 'sub_slug' => 'all' ]) }}">
                                        <figure class="category-media">
                                            <img src="{{ $category->HomeImageUrl }}" alt="category" width="280"
                                                height="280" />
                                        </figure>
                                    </a>
                                    <div class="category-content">
                                        <h4 class="category-name"><a href="{{ route('products', [ 'menu' => 'categories', 'slug' => $category->slug, 'sub_slug' => 'all' ]) }}">{{ $category->category }}</a></h4>
                                    </div>
                                </div>
                            <!-- </div> -->
                        @endforeach
                    </div>
                </section>
                <style>
                    .owl-nav .owl-next, .owl-nav .owl-prev {
                        color: #fff !important;
                        background-color: rgb(34 102 187) !important;
                    }

                </style>
                <!-- Caraosul new -->

                <!-- <div class="row">

                    @foreach($categories as $category)
                        <div class="col-md-3 col-6 mb-4">
                            <div class="category category-default category-default-1 category-absolute overlay-zoom">
                                <a href="{{ route('products', [ 'menu' => 'categories', 'slug' => $category->slug, 'sub_slug' => 'all' ]) }}">
                                    <figure class="category-media">
                                        <img src="{{ $category->HomeImageUrl }}" alt="category" width="280"
                                            height="280" />
                                    </figure>
                                </a>
                                <div class="category-content">
                                    <h4 class="category-name"><a href="{{ route('products', [ 'menu' => 'categories', 'slug' => $category->slug, 'sub_slug' => 'all' ]) }}">{{ $category->category }}</a></h4>
                                </div>
                            </div>
                        </div>
                    @endforeach

                </div> -->
            </div>
        </section>
        
        <section class="product-wrapper container appear-animate mt-10 pt-3 pb-8" data-animation-options="{ 'delay': '.3s' }">  
            <h2 class="title">{{ $one_title }}</h2>
            <div class="owl-carousel owl-theme row owl-nav-full cols-2 cols-md-3 cols-lg-4" data-owl-options="{ 'items': 5, 'nav': false, 'loop': false, 'dots': true, 'margin': 20, 'responsive': { '0': { 'items': 2 }, '768': { 'items': 3 }, '992': { 'items': 4, 'dots': false, 'nav': true } } }">
                @php($products = $ones)
                @include('customer.front.common.product-home')
            </div>
        </section>

        <section class="product-wrapper container appear-animate mt-10 pt-3 pb-8" data-animation-options="{ 'delay': '.3s' }">  
            <h2 class="title">{{ $two_title }}</h2>
            <div class="owl-carousel owl-theme row owl-nav-full cols-2 cols-md-3 cols-lg-4" data-owl-options="{ 'items': 5, 'nav': false, 'loop': false, 'dots': true, 'margin': 20, 'responsive': { '0': { 'items': 2 }, '768': { 'items': 3 }, '992': { 'items': 4, 'dots': false, 'nav': true } } }">
                @php($products = $twos)
                @include('customer.front.common.product-home')
            </div>
        </section>
        
        <section class="product-wrapper container appear-animate mt-10 pt-3 pb-8" data-animation-options="{ 'delay': '.3s' }">  
            <h2 class="title">{{ $three_title }}</h2>
            <div class="owl-carousel owl-theme row owl-nav-full cols-2 cols-md-3 cols-lg-4" data-owl-options="{ 'items': 5, 'nav': false, 'loop': false, 'dots': true, 'margin': 20, 'responsive': { '0': { 'items': 2 }, '768': { 'items': 3 }, '992': { 'items': 4, 'dots': false, 'nav': true } } }">
                @php($products = $threes)
                @include('customer.front.common.product-home')
            </div>
        </section>
        
        <section class="product-wrapper container appear-animate mt-10 pt-3 pb-8" data-animation-options="{ 'delay': '.3s' }">  
            <h2 class="title">{{ $four_title }}</h2>
            <div class="owl-carousel owl-theme row owl-nav-full cols-2 cols-md-3 cols-lg-4" data-owl-options="{ 'items': 5, 'nav': false, 'loop': false, 'dots': true, 'margin': 20, 'responsive': { '0': { 'items': 2 }, '768': { 'items': 3 }, '992': { 'items': 4, 'dots': false, 'nav': true } } }">
                @php($products = $fours)
                @include('customer.front.common.product-home')
            </div>
        </section>

    </div>
</main>

@endsection