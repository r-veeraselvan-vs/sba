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
                    <div class="tab-pane active" id="address">
                        <div class="row">                            
                                    
                            @if(Session::has('success'))
                                <div class="alert alert-success" role="alert">{{ Session::get('success') }}</div>  
                            @endif
                            @if(Session::has('error'))
                                <div class="alert alert-error" role="alert">{{ Session::get('error') }}</div>  
                            @endif
                            <h5>Add New Address</h5>
                            @include('customer.back.address.layouts.add-address')
                        </div>
                    </div>
                    <!-- Address -->
                </div>
            </div>
            
            <div class="row">
                @foreach($addresses as $address)
                    <div class="col-lg-4 mb-3">
                        <div class="card card-address">
                            <div class="card-body">
                                <h5 class="card-title">{{ $address->short_name ? $address->short_name : $address->city }}</h5>
                                <p>{{ $address->address }}, {{ $address->building_name }}, {{ $address->route }}, {{ $address->city }} - {{ $address->postcode }} </p>
                                
                                    @if(@$address->delivery_area->status == 'Inactive')
                                        <span style="color: blue; ">Delivery Unavailable</span>
                                    @elseif(@$address->delivery_area->days == [] || count(@$address->delivery_area->days) == 7)
                                        <span style="color: green; ">Delivery available on All days</span> <br>
                                    @else
                                        @php
                                            $string = '';
                                            foreach(@$address->delivery_area->days->pluck('day') as $i => $day){
                                                if($i != 0){
                                                    $string = $string.', ';
                                                }
                                                $string = $string.' '.ucfirst($day);
                                            }
                                            if($string == '') {
                                                $string = 'All days';
                                            }
                                        @endphp
                                        <span style="color: green; ">Delivery available on {{ $string }}</span> <br>
                                    @endif
                                    
                                <a href="{{ route('customer.address.edit', [ 'id' => $address->id, 'type' => request()->segment(2) ]) }}" class="btn btn-sm btn-secondary btn-underline"><i class="far fa-edit"></i> Edit</a>
                                <a href="{{ route('customer.address.remove', [ 'id' => $address->id ]) }}" class="btn btn-sm btn-warning btn-underline"><i class="fa fa-trash"></i> Remove</a>
                            </div>
                        </div>
                    </div>
                @endforeach
            </div>
        </div>
    </div>
</main>



<style>
    .alert{    
        position: relative;
        padding: .75rem 1.25rem;
        margin-bottom: 1rem;
        border: 1px solid transparent;
        border-radius: .25rem;
    }
    .alert-success{
        color: #155724;
        background-color: #d4edda;
        border-color: #c3e6cb;
    }
    .alert-error{
        color: #dc0a0a;
        background-color: #f7c6c6;
        border-color: #ff9a9a;
    }
</style>

@endsection