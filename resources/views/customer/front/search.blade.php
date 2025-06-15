@extends('layouts.app-front')
@section('content')


<main class="main">
    <div class="page-header" style="background-image: url(images/page-header.jpg)">
        <h1 class="page-title">Search</h1>
    </div>
    <div class="page-content mb-10">
        <div class="container">       
        <div class="container home-suc-msg">
                @if(Session::get('success')) <br> <div class="sxs">{{ Session::get('success') }}</div> @endif
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
            <br>
            <div class="row main-content-wrap gutter-lg">
                <div class="col-lg-12 main-content">

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