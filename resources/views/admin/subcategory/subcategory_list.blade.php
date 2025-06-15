@extends('layouts.app')
@section('content')
<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <div class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1 class="m-0 text-dark">SubCategory List</h1>
          </div>
        </div>
      </div>
    </div>
    <!-- /.content-header -->

    <div class="col-md-12">
            <div class="card">
              <div class="card-body">
                <div class="tab-content">

                    <!-- main Service -->
                    <div class="tab-pane active">
                        <div class="add-button">
                             <button type="button" class="btn btn-success btn-sm" onclick="exportTableToExcel('subcategory_download','subcategories')"> Download as Excel</button>
                            <button type="button" class="btn btn-primary btn-sm" data-toggle="modal" data-target="#modal-lg">Add Subcategory</button>
                        </div>
                        <br>
                        <table id="example1" class="table">
                            <thead>
                                <tr>
                                    <th>Sl No</th>
                                    <th>Category Id</th>
                                    <th>Subcategory Id</th>
                                    <th>Category</th>
                                    <th>Subcategory</th>
                                    <th>Status</th>
                                    <th>Action</th>
                                </tr>
                            </thead>
                            <tbody>
                                @foreach ($subcategories as $i => $subcategory)
                                <tr>
                                    <td>{{ $i+1 }}</td>
                                    <td>{{ $subcategory->category->id }}</td>
                                    <td>{{ $subcategory->id }}</td>
                                    
                                    <td>{{ $subcategory->category->category }}</td>
                                    <td>{{ $subcategory->subcategory }}</td>
                                    <td><span class="right badge @if($subcategory->status == 'Active') badge-success @else badge-danger @endif">{{ $subcategory->status }}</span></td>
                                    <td>
                                        <a href="{{ route('subcategory.edit', ['id' => $subcategory->id ]) }}"><span class="badge bg-danger"><i class="fas fa-edit"></i></span></a>
                                    </td>
                                </tr>
                                @endforeach
                            </tbody>
                        </table>
                        <table id="subcategory_download" class="table" style="display:none">
                            <thead>
                                <tr>
                                    <th>Id</th>
                                    <th>Category</th>
                                    <th>Subcategory</th>
                                    <th>Status</th>
                                 </tr>
                            </thead>
                            <tbody>
                                @foreach ($subcategories as $i => $subcategory)
                                <tr>
                                    <td>{{ $subcategory->id }}</td>
                                    <td>{{ $subcategory->category->category }}</td>
                                    <td>{{ $subcategory->subcategory }}</td>
                                    <td><span class="right badge @if($subcategory->status == 'Active') badge-success @else badge-danger @endif">{{ $subcategory->status }}</span></td>
                                     
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


  <!-- Add sub category model -->
  <div class="modal fade" id="modal-lg">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h4 class="modal-title">Add Subcategory</h4>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <form role="form" method="post" class="col-md-12" enctype="multipart/form-data" action="{{ route('subcategory.save') }}">
                    @csrf

                    <div class="form-group">
                        <label for="exampleInputPassword1">Category</label>
                        <select class="form-control" name="category_id" >
                            @foreach($categories as $category)
                                <option value="{{$category->id}}">{{ $category->category }}</option>
                            @endforeach
                        </select>
                    </div>

                    <div class="form-group">
                        <label for="exampleInputEmail1">Subcategory</label>
                        <input type="text" required class="form-control" name="subcategory" placeholder="Enter Category">
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
  <!-- Add sub category model -->
 
  @endsection
  

                    