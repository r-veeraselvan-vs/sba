@extends('layouts.app')
@section('content')
<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <div class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1 class="m-0 text-dark">Delivery Slot List</h1>
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
                            <button type="button" class="btn btn-primary btn-sm" data-toggle="modal" data-target="#modal-lg">Add Delivery Slot</button>
                        </div>
                        <br>
                        <table id="example1" class="table">
                            <thead>
                                <tr>
                                    <th>Sl No</th>
                                    <th>Area</th>
                                    <th>Day</th>
                                    <th>Start</th>
                                    <th>End</th>
                                    <th>Deliveries</th>
                                    <th>Status</th>
                                    <th>Action</th>
                                </tr>
                            </thead>
                            <tbody>
                                @foreach($slots as $i => $slot)

                                @if($slot->default == 'No')
                                <?php 
                                    $area = \App\DeliveryArea::where('id',$slot->delivery_area_id)->first();
                                ?>
                                    <tr>
                                        <td>{{ $i+1 }}</td>
                                        <td>{{$area->pin_code}} - {{$area->area}}</td>
                                        <td>{{ $slot->day }}</td>
                                        <td>{{ $slot->start }}</td>
                                        <td>{{ $slot->end }}</td>
                                        <td>{{ $slot->deliveries }}</td>
                                        <td><span class="right badge @if($slot->status == 'Active') badge-success @else badge-danger @endif">{{ $slot->status }}</span></td>
                                        <td>
                                            @if($slot->default == 'No')
                                            <a href="{{ route('delivery.slot.edit', [ 'id' => $slot->id ]) }}"><span class="badge bg-danger"><i class="fas fa-edit"></i></span></a>
                                            @endif
                                        </td>
                                    </tr>
                                @else
                                    <tr class="default-tr">
                                        <td>{{ $i+1 }}</td>
                                        <td>All</td>
                                        <td>All Day - (Today)</td>
                                        <td>All</td>
                                        <td>All</td>
                                        <td>{{ $slot->deliveries }}</td>
                                        <td><span class="right badge @if($slot->status == 'Active') badge-success @else badge-danger @endif">{{ $slot->status }}</span></td>
                                        <td>...</td>
                                    </tr>
                                @endif
                                @endforeach
                            </tbody>
                        </table>
                    </div>
                <style>
                    tr.default-tr {
                        background: #3eff0069 !important;
                    }
                </style>
               
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
                    <h4 class="modal-title">Add Delivery slot</h4>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <form role="form" method="post" class="col-md-12" action="{{ route('delivery.slot.save') }}">
                    @csrf
                      <div class="form-group">
                        <label for="exampleInputPassword1">Delivery Area</label>
                        <select class="form-control" name="delivery_area_id" required> 
                        @foreach($areas as $area)
                            <option value="{{$area->id}}">{{$area->pin_code}}- {{$area->area}}</option>
                            @endforeach
                             
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="exampleInputPassword1">Day</label>
                        <select class="form-control" name="day" required> 
                            <option value="Monday">Monday</option>
                            <option value="Tuesday">Tuesday</option>
                            <option value="Wednesday">Wednesday</option>
                            <option value="Thursday">Thursday</option>
                            <option value="Friday">Friday</option>
                            <option value="Saturday">Saturday</option>
                            <option value="Sunday">Sunday</option>
                        </select>
                    </div>

                    <div class="form-group">
                        <label for="exampleInputEmail1">Start</label>
                        <input type="time" required class="form-control" name="start" placeholder="Enter Start">
                    </div>

                    <div class="form-group">
                        <label for="exampleInputEmail1">End</label>
                        <input type="time" required class="form-control" name="end" placeholder="Enter End">
                    </div>

                    <div class="form-group">
                        <label for="exampleInputEmail1">Deliveries</label>
                        <input type="number" required class="form-control" name="deliveries" placeholder="Enter Deliveries">
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
  