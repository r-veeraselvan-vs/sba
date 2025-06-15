@extends('layouts.app')
@section('content')
<div class="content-wrapper" style="min-height: 193px;">
    <section class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1>Customer Details</h1>
          </div>
        </div>
      </div>
    </section>
    <section class="content">
        <div class="container-fluid">
                <div class="col-md-12">
                    <div class="card">
                        <div class="card-header p-2">
                            <ul class="nav nav-pills">
                                <li class="nav-item"><a class="nav-link active" href="#basic_info" data-toggle="tab">Basic Info</a></li>
                                <li class="nav-item"><a class="nav-link" href="#address" data-toggle="tab">Addresses</a></li>
                                <!-- <li class="nav-item"><a class="nav-link" href="#reports" data-toggle="tab">Reports</a></li> -->
                            </ul>
                        </div>
                        <div class="card-body">
                            <div class="tab-content">                                
                                <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
                                <!-- basic_info -->
                                @include('admin.customer.components.basic_info')
                                <!-- basic_info -->
                                @include('admin.customer.components.address')
                            </div>
                        </div>
                    </div>  
                </div>
            </div>
        </div>
    </section>
  </div>

  @endsection
  

                    