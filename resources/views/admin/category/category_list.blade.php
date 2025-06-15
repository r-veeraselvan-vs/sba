@extends('layouts.app')
@section('content')
<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <div class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1 class="m-0 text-dark">Category List</h1>
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
                            <button type="button" class="btn btn-success btn-sm" onclick="exportTableToExcel('category_download','categories')"> Download as Excel</button>
                            <button type="button" class="btn btn-primary btn-sm" data-toggle="modal" data-target="#modal-lg">Add Category</button>
                        </div>
                        <br>
                        <table id="example1" class="table">
                            <thead>
                                <tr>
                                    <th>Sl No</th>
                                    <th>Id No</th>
                                    <th>Image</th>
                                    <th>Home Image</th>
                                    <th>Category</th>
                                    <th>Status</th>
                                    <th>Action</th>
                                </tr>
                            </thead>
                            <tbody>
                                @foreach ($categories as $i => $category)
                                <tr>
                                    <td>{{ $i+1 }}</td>
                                    <td>{{ $category->id }}</td>
                                    <td>
                                        <a href="{{ $category->ImageUrl }}" target="_blank" rel="noopener noreferrer">
                                            <img src="{{ $category->ImageUrl }}" height="30px" width="100px">
                                        </a>
                                    </td>
                                    <td>
                                        <a href="{{ $category->HomeImageUrl }}" target="_blank" rel="noopener noreferrer">
                                            <img src="{{ $category->HomeImageUrl }}" height="30px" width="30px">
                                        </a>
                                    </td>
                                    <td>{{ $category->category }}</td>
                                    <td><span class="right badge @if($category->status == 'Active') badge-success @else badge-danger @endif">{{ $category->status }}</span></td>
                                    <td>
                                        <a href="{{ route('category.edit', ['id' => $category->id ]) }}"><span class="badge bg-danger"><i class="fas fa-edit"></i></span></a>
                                    </td>
                                </tr>
                                @endforeach
                            </tbody>
                        </table>
                          <table id="category_download" class="table" style="display:none">
                            <thead>
                                <tr>
                                    <th>Id</th>
                                     <th>Category</th>
                                    <th>Status</th>
                                 </tr>
                            </thead>
                            <tbody>
                                @foreach ($categories as $i => $category)
                                <tr>
                                    <td>{{ $category->id }}</td>
                                    
                                    <td>{{ $category->category }}</td>
                                    <td><span class="right badge @if($category->status == 'Active') badge-success @else badge-danger @endif">{{ $category->status }}</span></td>
                                   
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


  <!-- magazine add model -->
  <div class="modal fade" id="modal-lg">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h4 class="modal-title">Add Category</h4>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <form role="form" method="post" class="col-md-12" enctype="multipart/form-data" action="{{ route('category.save') }}">
                    @csrf

                    <div class="form-group">
                        <label for="exampleInputEmail1">Category</label>
                        <input type="text" required class="form-control" name="category" placeholder="Enter Category">
                    </div>

                    <div class="form-group">
                        <label for="exampleInputPassword1">Image</label>
                        <div class="input-group">
                            <div class="custom-file">
                                <input type="file" required onChange="displayImage(this)" name="image" class="custom-file-input" id="exampleInputPassword1">
                                <label class="custom-file-label" for="exampleInputFile">Image</label>
                            </div>
                        </div>
                        <br>                        
                        <img class="pull-right" src="/images/no_image.png" onClick="triggerClick()" id="profile_display" height="100px" width="100px">
                    </div>

                    <script>
                    function triggerClick(e) {
                        document.querySelector('#image').click();
                    }
                    function displayImage(e) {
                        if (e.files[0]) {
                            var reader = new FileReader();
                            reader.onload = function(e){
                            document.querySelector('#profile_display').setAttribute('src', e.target.result);
                            }
                            reader.readAsDataURL(e.files[0]);
                        }
                    }
                    </script>

                    <div class="form-group">
                        <label for="exampleInputPassword1">Home Image</label>
                        <div class="input-group">
                            <div class="custom-file">
                                <input type="file" required onChange="displayHomeImage(this)" name="home_image" class="custom-file-input" id="exampleInputPassword1">
                                <label class="custom-file-label" for="exampleInputFile">Home Image</label>
                            </div>
                        </div>
                        <br>                        
                        <img class="pull-right" src="/images/no_image.png" onClick="triggerClick()" id="profile_display1" height="100px" width="100px">
                    </div>

                    <script>
                    function triggerClick(e) {
                        document.querySelector('#image').click();
                    }
                    function displayHomeImage(e) {
                        if (e.files[0]) {
                            var reader = new FileReader();
                            reader.onload = function(e){
                            document.querySelector('#profile_display1').setAttribute('src', e.target.result);
                            }
                            reader.readAsDataURL(e.files[0]);
                        }
                    }
                    </script>

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
  <!-- magazine add model -->
 
  @endsection
  

                    