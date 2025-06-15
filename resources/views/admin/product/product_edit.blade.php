@extends('layouts.app')
@section('content')

<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <div class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1 class="m-0 text-dark">Update Details</h1>
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
								<li class="nav-item"><a class="nav-link @if($tab == 'edit') active @endif" href="#edit" data-toggle="tab">Edit Product</a></li>
								<li class="nav-item"><a class="nav-link @if($tab == 'price') active @endif" href="#price" data-toggle="tab">Price</a></li>
								<li class="nav-item"><a class="nav-link @if($tab == 'image') active @endif" href="#image" data-toggle="tab">Image</a></li>
								<li class="nav-item"><a class="nav-link @if($tab == 'specification') active @endif" href="#specification" data-toggle="tab">Specification</a></li>
								<li class="nav-item"><a class="nav-link @if($tab == 'feature') active @endif" href="#feature" data-toggle="tab">Feature</a></li>
							</ul>
						</div>
						<div class="card-body">
							<div class="tab-content">
								<!-- Edit Product -->
								@include('admin.product.components.edit')
								<!-- Price -->
								@include('admin.product.components.price')
								<!-- Image -->
								@include('admin.product.components.image')
								<!-- Specification -->
								@include('admin.product.components.specification')
								<!-- Feature -->
								@include('admin.product.components.feature')
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