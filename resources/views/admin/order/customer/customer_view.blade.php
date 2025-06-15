@extends('layouts.app')
@section('content')

<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <div class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1 class="m-0 text-dark">Customer Order Details</h1>
          </div>
        </div><!-- /.row -->
      </div><!-- /.container-fluid -->
    </div>
    <!-- /.content-header -->

    <!-- Main content -->
    <section class="content">
        <div class="container-fluid">
          <div class="row">
            
              	<div class="col-md-12">
					<div class="card">
						<div class="card-header p-2">
							<ul class="nav nav-pills">
								<li class="nav-item"><a class="nav-link active" href="#basic_info" data-toggle="tab">Basic Info</a></li>
								<li class="nav-item"><a class="nav-link" href="#order_list" data-toggle="tab">Order List</a></li>
							</ul>
						</div>
						<div class="card-body">
							<div class="tab-content">
								<!-- basic_info -->
								@include('admin.order.customer.components.basic_info')
								<!-- order_list -->
								@include('admin.order.customer.components.order_list')
							</div>
						</div>
					</div>
					<!-- revision history -->
					
					<!-- revision history -->
				</div>

          </div>
          <!-- /.row -->
        </div>
        <!-- /.container-fluid -->
      </section>
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->
  
  @endsection