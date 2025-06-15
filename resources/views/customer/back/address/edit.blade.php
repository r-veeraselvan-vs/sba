@extends('layouts.app-front')
@section('content')
<main class="main account">
    <div class="page-header" style="background-image: url('/images/page-header.jpg'); background-color: #3C63A4;">
        <h1 class="page-title">My Addresses</h1>
    </div>
    <!-- End PageHeader -->
    <div class="page-content mt-10 mb-10">
        <div class="container pt-1">
            <div class="tab tab-vertical">
                <!-- Side Menu -->
                @include('customer.back.common.sidebar')
                <!-- Side Menu -->

                <div class="tab-content">
                    <!-- Address -->
                    <div class="tab-pane active" id="address">
                        @include('customer.back.address.layouts.edit-address')
                    </div>
                </div>
            </div>
        </div>
    </div>
</main>

@endsection