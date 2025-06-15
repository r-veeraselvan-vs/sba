@extends('layouts.app')
@section('content')
<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <div class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1 class="m-0 text-dark">Customer List</h1>
          </div>
        </div>
      </div>
    </div>
    <!-- /.content-header -->

    <!-- Main content -->
    <section class="content">
        <div class="container-fluid">
          <div class="row">
             <div class="col-12">
                <div class="card">
                  <div class="card-header">
                    <div class="col-sm-12">
                      <a href="{{ route('notification.group', [ 'type' => 'customer' ] ) }}" class="btn btn-primary" style="float: right;"><i class="fas fa-bell"></i> Group Notification</a>
                    </div>
                  </div>
                  <div class="card-body">
                    <table id="example1" class="table">
                      <thead>
                      <tr>
                        <th>Sl No</th>
                        <th>Name</th>
                        <th>Email</th>
                        <th>Mobile</th>
                        <th>Shipping Excluded</th>
                        <th>Joined on</th>
                        <th>Action</th>
                      </tr>
                      </thead>
                      <tbody>
                    @foreach ($customers as $i => $customer)
                    <tr>
                        <td>{{ $i+1 }}</td>
                        <td>
                            <a>{{ $customer->name }}</a>
                        </td>
                        <td>{{ $customer->email }}</td>
                        <td>{{ $customer->mobile }}</td>
                        <td>{{ @$customer->customer->shipping_excluded ? @$customer->customer->shipping_excluded : 'No' }}</td>
                        <td>{{ $customer->created_at->format('d-m-Y') }}</td>
                        <td>
                            <a href="{{ route('customer.view', [ 'customer_id' => $customer->id ] ) }}"><span class="badge bg-success"><i class="fas fa-eye"></i></span></a>
                            <a href="{{ route('customer.edit', [ 'user_id' => $customer->id ] ) }}"><span class="badge bg-danger"><i class="fas fa-edit"></i></span></a>
                            <a href="{{ route('notification.customer', [ 'id' => $customer->id ] ) }}"><span class="badge bg-info"><i class="fas fa-bell"></i></span></a>
                        </td>
                    </tr>
                    @endforeach

                      </tbody>
                    </table>
                  </div>
                  <!-- /.card-body -->
                </div>
                <!-- /.card -->
              </div>
              <!-- /.col -->
          </div>
          <!-- /.row -->
        </div>
        <!-- /.container-fluid -->
      </section>
    <!-- /.content -->
  </div>

  
  @endsection
