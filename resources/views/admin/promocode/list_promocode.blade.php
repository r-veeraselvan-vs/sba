@extends('layouts.app')
@section('content')
<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <div class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1 class="m-0 text-dark">Promo Code List</h1>
          </div>
        </div>
      </div>
    </div>
    <section class="content">
        <div class="container-fluid">
          <div class="row">
             <div class="col-12">
                <div class="card">
                  <div class="card-body">
                    <div class="add-button">
                        <button type="button" class="btn btn-primary btn-sm" data-toggle="modal" data-target="#modal-lg">Add PromoCode</button>
                      </div>
                    <br>
                    <table id="example41" class="table">
                      <thead>
                      <tr>
                                    <th>Sl No</th>
                                    <th>Name</th>
                                    <th>Code</th>
                                    <th>Discount Percent</th>
                                    <th>Minimum Order</th>
                                    <th>Maximum Discount</th>
                                    <th>Budget</th>
                                    <th>Spent</th>
                                    
                                    <th>Status</th>
                                    <th>Action</th>
                                </tr>
                      </thead>
                      <tbody>
                      @foreach ($promocode_list as $i => $promocode)
                                <tr>
                                    <td>{{ $i+1 }}</td>
                                    <td>{{ $promocode->name }}</td>
                                    <td>{{ $promocode->code}}</td>
                                    <td>{{ $promocode->discount_percent }}</td>
                                    <td>{{ $promocode->minimum_order }}</td>
                                    <td>{{ $promocode->maximum_discount }}</td>
                                    <td>{{ $promocode->budget }}</td>
                                    <td>{{ $promocode->spent }}</td>
                                    
                                    <td><span class="right badge @if($promocode->status == 'Active') badge-success @else badge-danger @endif">{{ $promocode->status }}</span></td>
                                    <td>
                                    <a href="{{ route('promocode.edit', ['id' => $promocode->id ]) }}"><span class="badge bg-danger"><i class="fas fa-edit"></i></span></a>
                                    </td>
                                </tr>
        
          <!-- /.modal-content -->
        </div>
        </div>
      
    
                    @endforeach

                      </tbody>
                    </table>
                  </div>
                </div>
              </div>
          </div>
        </div>
      </section>
</div>

<div class="modal fade" id="modal-lg">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h4 class="modal-title">Add PromoCode Text</h4>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <form role="form" method="post" class="col-md-12" enctype="multipart/form-data" action="{{ route('promocode.store') }}">
                    @csrf


                    <div class="form-group">
                        <label for="exampleInputEmail1">Name</label>
                        <input type="text" required class="form-control" name="name" placeholder="Enter Name">
                    </div>

                    <div class="form-group">
                        <label for="exampleInputEmail1">Code</label>
                        <input type="text" required class="form-control" name="code" placeholder="Enter Code">
                    </div>
                    <div class="form-group">
                        <label for="exampleInputEmail1">Discount Percent</label>
                        <input type="text" required class="form-control" name="discount_percent" placeholder="Enter Discount Percent">
                    </div>
                    <div class="form-group">
                        <label for="exampleInputEmail1">Minimum Order</label>
                        <input type="text" required class="form-control" name="minimum_order" placeholder="Enter Minimum Order">
                    </div>
                    <div class="form-group">
                        <label for="exampleInputEmail1">Maximum Discount</label>
                        <input type="text" required class="form-control" name="maximum_discount" placeholder="Enter Maximum Discount">
                    </div>
                    <div class="form-group">
                        <label for="exampleInputEmail1">Budget</label>
                        <input type="text" required class="form-control" name="budget" placeholder="Enter Budget">
                    </div>
                    <div class="form-group">
                        <label for="exampleInputEmail1">Start Date</label>
                        <input type="date" required class="form-control" name="start_date" placeholder="Enter Start Date">
                    </div>
                    <div class="form-group">
                        <label for="exampleInputEmail1">End Date</label>
                        <input type="date" required class="form-control" name="end_date" placeholder="Enter End Date">
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
