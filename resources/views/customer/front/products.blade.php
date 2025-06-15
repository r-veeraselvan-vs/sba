@extends('layouts.app-front')
@section('content')


<main class="main">
    <div class="page-content mb-10">
        <div class="container">
            <ul class="breadcrumb breadcrumb-sm">
            </ul>
            <!-- End Breadcrumb -->
            <div class="row main-content-wrap gutter-lg">
                <aside class="col-lg-3 sidebar sidebar-fixed shop-sidebar sticky-sidebar-wrapper">
                    <div class="sidebar-overlay">
                        <a class="sidebar-close" href="#"><i class="d-icon-times"></i></a>
                    </div>
                    <div class="sidebar-content">
                        <div class="sticky-sidebar">
                            <div class="widget widget-collapsible">
                                <h3 class="widget-title">All {{$menu}}</h3>
                                <ul class="widget-body filter-items search-ul">
                                    @foreach($menus as $men)
                                        @switch($menu)
                                            @case('categories')
                                                <li class="with-ul  @if($men->slug == $slug) show @endif ">
                                                    <a href="{{ route('products', [ 'menu' => $menu, 'slug' => $men->slug, 'sub_slug' => 'all' ]) }}">{{ $men->category }}<i class="fas fa-chevron-down"></i></a>
                                                    <ul style="@if($men->slug == $slug) display: block; @else display: none; @endif">
                                                        @foreach($men->subcategories as $sub)
                                                            <li class="@if($sub->slug == $sub_slug) show @endif"><a href="{{ route('products', [ 'menu' => $menu, 'slug' => $men->slug, 'sub_slug' => $sub->slug ]) }}">{{ $sub->subcategory }}</a></li>
                                                        @endforeach
                                                    </ul>
                                                </li>
                                            @break
                                        @endswitch
                                    @endforeach
                                </ul>
                            </div>
                        </div>
                    </div>
                </aside>
                <div class="col-lg-9 main-content">
                    <div class="">
                        <img src="{{$banner}}" class="img-fluid" alt="" height="500px">
                        <!-- style="background-image: url({{$banner}}); background-color: #f2f2f3;  width: 1280px; height: 330px; " -->
                        <!-- <div class="banner-content">
                            <h4 class="banner-subtitle mb-2  text-body text-uppercase ls-m font-weight-normal">
                                Donald Shop</h4>
                            <h1 class="banner-title font-weight-normal text-uppercase"><strong
                                    class="ls-m">Banner</strong> With<br /> Sidebar</h1>
                            <p class="font-primary lh-1 ls-m mb-0">Simple and Fresh ShopStyle</p>
                        </div> -->
                    </div>

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

                    <h4 style="padding: 10px; text-align: center;">{{ $title }}</h4>

                <!-- filter menu -->
                <nav class="toolbox sticky-toolbox sticky-content fix-top">
                        <div class="toolbox-left">
                            <a href="#"
                                class="toolbox-item left-sidebar-toggle btn btn-sm btn-outline btn-primary d-lg-none">Filters<i
                                    class="d-icon-arrow-right"></i></a>
                        </div>
                    </nav>
                <!-- filter menu -->

                    <div class="row cols-2 cols-sm-3 product-wrapper">
                        @include('customer.front.common.product') 
                    </div>
                    
                    <nav class="toolbox toolbox-pagination">
                        <p class="show-info">Showing <span>{{ (($products->currentPage() - 1) * $products->perPage() + 1) }} to {{ (($products->currentPage() - 1) * 4 + $products->count()) }} of {{ $products->total() }}</span> Products</p>
                        <ul class="pagination">
                            {{ $products->links() }}
                        </ul>
                    </nav>
                    
                </div>
            </div>
        </div>
    </div>
</main>


<style>
li.with-ul ul {
    padding-left: 20px;
}
</style>

@endsection