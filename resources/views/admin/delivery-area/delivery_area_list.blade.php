@extends('layouts.app')
@section('content')
<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <div class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1 class="m-0 text-dark">Delivery Area List</h1>
          </div>
        </div>
      </div>
    </div>
    <!-- /.content-header -->

    <div class="col-md-12">
            <div class="card">
              <div class="card-body">
                <div class="tab-content">

                    <!-- Taxes -->
                    <div class="tab-pane active">
                        <div class="add-button">
                            <button type="button" class="btn btn-primary btn-sm" data-toggle="modal" data-target="#modal-lg">Add Delivery Area</button>
                        </div>
                        <br>
                        <table id="example1" class="table">
                            <thead>
                                <tr>
                                    <th>Sl No</th>
                                    <th>Pin Code</th>
                                    <th>Area</th>
                                    <th>Delivery Charge</th>
                                    <th>Status</th>
                                    <th>Action</th>
                                </tr>
                            </thead>
                            <tbody>
                                @foreach($areas as $i => $area)
                                <tr>
                                    <td>{{ $i+1 }}</td>
                                    <td>{{ $area->pin_code }}</td>
                                    <td>{{ $area->area }}</td>
                                    <td>{{ $area->delivery_charge }}</td>
                                    <td><span class="right badge @if($area->status == 'Active') badge-success @else badge-danger @endif">{{ $area->status }}</span></td>
                                    <td>
                                        <a href="{{ route('delivery.area.edit', [ 'id' => $area->id, 'tab' => 'edit' ]) }}"><span class="badge bg-danger"><i class="fas fa-edit"></i></span></a>
                                    </td>
                                </tr>
                                @endforeach
                            </tbody>
                        </table>
                    </div>

               
                </div>
              </div>
            </div>
          </div>

  </div>


  <!-- main Service add model -->
  <div class="modal fade" id="modal-lg">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h4 class="modal-title">Add Delivery Area</h4>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <form role="form" method="post" class="col-md-12" action="{{ route('delivery.area.save') }}">
                    @csrf

                    <div class="form-group">
                        <label for="exampleInputEmail1">Pin Code</label>
                        <input type="text" required class="form-control" name="pin_code" placeholder="Enter Pin Code">
                    </div>

                    <div class="form-group">
                        <label for="exampleInputEmail1">Area</label>
                        <input type="text" required class="form-control" name="area" placeholder="Enter Area">
                    </div>

                    <div class="form-group">
                        <label for="exampleInputEmail1">Delivery Charge</label>
                        <input type="number" required class="form-control" name="delivery_charge" min="0" placeholder="Enter Delivery Charge">
                    </div>

                    <div class="form-group">
                        <label for="exampleInputEmail1">Days</label>
                        <table class="table">
                            <tr>
                                <th class="head-th">SUN</th>
                                <th class="head-th">MON</th>
                                <th class="head-th">TUE</th>
                                <th class="head-th">WED</th>
                                <th class="head-th">THU</th>
                                <th class="head-th">FRI</th>
                                <th class="head-th">SAT</th>
                            </tr>
                            <tr>
                                <td>
                                    <input type="checkbox" class="form-control" name="days[sunday]" >
                                </td>
                                <td>
                                    <input type="checkbox" class="form-control" name="days[monday]" >
                                </td>
                                <td>
                                    <input type="checkbox" class="form-control" name="days[tuesday]" >
                                </td>
                                <td>
                                    <input type="checkbox" class="form-control" name="days[wednwsday]" >
                                </td>
                                <td>
                                    <input type="checkbox" class="form-control" name="days[thursday]" >
                                </td>
                                <td>
                                    <input type="checkbox" class="form-control" name="days[friday]" >
                                </td>
                                <td>
                                    <input type="checkbox" class="form-control" name="days[saturday]" >
                                </td>
                            </tr>
                        </table>
                    </div>


                    <div class="form-group">
                        <label for="exampleInputPassword1">Status</label>
                        <select class="form-control" name="status" >
                            <option value="Active">Active</option>
                            <option value="Inactive">Inactive</option>
                        </select>
                    </div>

                    <div class="card-footer">
                        <button type="submit" class="btn btn-primary">Save</button>
                    </div>
                </form>
                </div>
            </div>
          <!-- /.modal-content -->
        </div>
        <!-- /.modal-dialog -->
    </div>
  <!-- main Service add model -->
 
  @endsection
  