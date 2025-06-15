@extends('layouts.app')
@section('content')

  <div class="content-wrapper">
    <section class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1>Delivery Slot Edit</h1>
          </div>
        </div>
      </div>
    </section>
    <section class="content">
      <div class="container-fluid">
        <div class="row">
          <div class="col-md-12">
            <div class="card card-primary">
              <div class="card-header">
                <h3 class="card-title">Deliver Slot</h3>
              </div>
              <form role="form" method="post" class="col-md-6" action="{{ route('delivery.slot.update') }}">
                  @csrf
                  <input type="hidden" name="id" value="{{ $slot->id }}">
                <div class="card-body">
                   <div class="form-group">
                        <label for="exampleInputPassword1">Delivery Area</label>
                        <select class="form-control" name="delivery_area_id" required> 
                        @foreach($areas as $area)
                            <option value="{{$area->id}}"  @if($area->id == $slot->delivery_area_id) selected @endif>{{$area->pin_code}}- {{$area->area}}</option>
                            @endforeach
                             
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="exampleInputPassword1">Day</label>
                        <select class="form-control" name="day" required> 
                            <option value="Monday" @if('Monday' == $slot->day) selected @endif>Monday</option>
                            <option value="Tuesday" @if('Tuesday' == $slot->day) selected @endif>Tuesday</option>
                            <option value="Wednesday" @if('Wednesday' == $slot->day) selected @endif>Wednesday</option>
                            <option value="Thursday" @if('Thursday' == $slot->day) selected @endif>Thursday</option>
                            <option value="Friday" @if('Friday' == $slot->day) selected @endif>Friday</option>
                            <option value="Saturday" @if('Saturday' == $slot->day) selected @endif>Saturday</option>
                            <option value="Sunday" @if('Sunday' == $slot->day) selected @endif>Sunday</option>
                        </select>
                    </div>

                    <div class="form-group">
                        <label for="exampleInputEmail1">Start</label>
                        <input type="time" required class="form-control" name="start" value="{{ $slot->start }}" placeholder="Enter Start">
                    </div>

                    <div class="form-group">
                        <label for="exampleInputEmail1">End</label>
                        <input type="time" required class="form-control" name="end" value="{{ $slot->end }}" placeholder="Enter End">
                    </div>

                    <div class="form-group">
                        <label for="exampleInputEmail1">Deliveries</label>
                        <input type="number" required class="form-control" name="deliveries" value="{{ $slot->deliveries }}" placeholder="Enter Deliveries">
                    </div>

                  <div class="form-group">
                      <label for="exampleInputPassword1">Status</label>
                      <select class="form-control" name="status" >
                          <option value="Active" @if('Active' == $slot->status) selected @endif>Active</option>
                          <option value="Inactive" @if('Inactive' == $slot->status) selected @endif>Inactive</option>
                      </select>
                  </div>
                </div>

                <div class="card-footer">
                  <button type="submit" class="btn btn-primary">Update</button>
                </div>
              </form>
            </div>
          </div>
        </div>
      </div>
    </section>
  </div>
@endsection