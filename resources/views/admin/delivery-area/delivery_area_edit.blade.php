@extends('layouts.app')
@section('content')

<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <div class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1 class="m-0 text-dark">Update Delivery Area</h1>
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
								<li class="nav-item"><a class="nav-link @if($tab == 'edit') active @endif" href="#edit" data-toggle="tab">Edit</a></li>
								<li class="nav-item"><a class="nav-link @if($tab == 'slot') active @endif" href="#slot" data-toggle="tab">Delivery Slots</a></li>
							</ul>
						</div>
						<div class="card-body">
							<div class="tab-content">
								<!-- Edit Delivery Area -->
								@include('admin.delivery-area.components.edit')
								<!-- Slot Delivery Area -->
								@include('admin.delivery-area.components.slot')
                
							</div>
						</div>
					</div>
				</div>

          </div>
        </div>
      </section>
  </div>
  
  @endsection