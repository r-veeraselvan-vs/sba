@extends('layouts.app-front')
@section('content')
<main class="main account">
    <div class="page-header" style="background-image: url('/images/page-header.jpg'); background-color: #3C63A4;">
        <h1 class="page-title">My Wishlist</h1>
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
                            <h5>My Wishlist</h5>
                                <div class="row main-content-wrap gutter-lg"> <div class="container home-suc-msg">
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
                            <div class="container">
                            <br>
                                <div class="col-lg-12 main-content">

                                    <div class="row cols-2 cols-sm-3 product-wrapper">
                                        @include('customer.front.common.product') 
                                    </div>
                                    
                                    @if( count($products) > 0)
                                    <nav class="toolbox toolbox-pagination">
                                        <p class="show-info">Showing <span>{{ (($products->currentPage() - 1) * $products->perPage() + 1) }} to {{ (($products->currentPage() - 1) * 4 + $products->count()) }} of {{ $products->total() }}</span> Products</p>
                                        <ul class="pagination">
                                            {{ $products->links() }}
                                        </ul>
                                    </nav>
                                    @else
                                        <h6>No products added as wishlist.</h6>
                                    @endif
                                </div>
                            </div>                                
                        </div>

                    </div>
                    <!-- my profile -->
                </div>
            </div>
        </div>
    </div>
</main>

@endsection