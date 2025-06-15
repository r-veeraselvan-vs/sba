@extends('layouts.app')
@section('content')
<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <div class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1 class="m-0 text-dark">Vendor List</h1>
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
                  <!-- /.card-header -->
                  <div class="card-body">
                       <div class="add-button">
                             <button type="button" class="btn btn-success btn-sm" onclick="exportTableToExcel('vendor_download','vendors')"> Download as Excel</button>
                         </div>
                    <table id="example1" class="table">
                      <thead>
                      <tr>
                        <th>Sl No</th>
                        <th>Vendor Id</th>
                        <th>Name</th>
                        <th>Address</th>
                        <th>Mobile</th>
                        <th>GST</th>
                        <th colspan="2">Action</th>
                      </tr>
                      </thead>
                      <tbody>
                    @foreach ($users as $i => $user)
                    <tr>
                    <td>{{ $i+1 }}</td>
                    <td>{{ $user->id }}</td>
                    <td>{{ $user->name }}</td>
                    <td>{{ $user->address }}</td>
                    <td>{{ $user->mobile }}</td>
                    <td>{{ $user->gst }}</td>
                    <td><span class="right badge @if($user->status == 'Active') badge-success @else badge-danger @endif">{{ $user->status }}</span></td>
                    <td>
                        <a href="{{ route('vendor.edit', ['vendor_id' => $user->id]) }}"><span class="badge bg-danger"><i class="fas fa-edit"></i></span></a>
                    </td>
                    </tr>
                    @endforeach

                      </tbody>
                    </table>
                    
                     <table id="vendor_download" class="table" style="display:none">
                      <thead>
                      <tr>
                        <th>Id</th>
                        <th>Name</th>
                        <th>Address</th>
                        <th>Mobile</th>
                        <th>GST</th>
                        <th>Status</th>
                       </tr>
                      </thead>
                      <tbody>
                    @foreach ($users as $i => $user)
                    <tr>
                    <td>{{ $user->id }}</td>
                    <td>{{ $user->name }}</td>
                    <td>{{ $user->address }}</td>
                    <td>{{ $user->mobile }}</td>
                    <td>{{ $user->gst }}</td>
                    <td><span class="right badge @if($user->status == 'Active') badge-success @else badge-danger @endif">{{ $user->status }}</span></td>
                     
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
      <div class="modal fade" id="modal-lg">
        <div class="modal-dialog modal-lg">
          <div class="modal-content">
            <div class="modal-header">
              <h4 class="modal-title">city View</h4>
              <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                <span aria-hidden="true">&times;</span>
              </button>
            </div>
            <div class="modal-body">

            </div>
            <div class="modal-footer justify-content-between">
              <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
            </div>
          </div>
          <!-- /.modal-content -->
        </div>
        <!-- /.modal-dialog -->
      </div>
    <!-- /.content -->
  </div>
  
  @endsection
