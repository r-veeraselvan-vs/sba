@extends('layouts.app')
@section('content')
<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <div class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1 class="m-0 text-dark">Rider List</h1>
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
                    <div class="col-sm-12" style="text-align: right;">
                      <a href="{{ route('notification.group', [ 'type' => 'rider' ] ) }}" class="btn btn-primary" ><i class="fas fa-bell"></i> Group Notification</a>
                      <a href="{{ route('rider.create') }}" class="btn btn-primary" >Create Rider</a>
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
                        <th>Joined on</th>
                        <th>Action</th>
                      </tr>
                      </thead>
                      <tbody>
                    @foreach ($riders as $i => $rider)
                    <tr>
                        <td>{{ $i+1 }}</td>
                        <td>
                            <a>{{ $rider->name }}</a>
                        </td>
                        <td>{{ $rider->email }}</td>
                        <td>{{ $rider->mobile }}</td>
                        <td>{{ $rider->created_at->format('d-m-Y') }}</td>
                        <td>
                            <a href="{{ route('rider.view', [ 'rider_id' => $rider->id ] ) }}"><span class="badge bg-danger"><i class="fas fa-eye"></i></span></a>
                            <a href="{{ route('notification.rider', [ 'id' => $rider->id ] ) }}"><span class="badge bg-info"><i class="fas fa-bell"></i></span></a>
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
