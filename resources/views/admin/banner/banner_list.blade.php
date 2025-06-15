@extends('layouts.app')
@section('content')
<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <div class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1 class="m-0 text-dark">Banners</h1>
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
                            <button type="button" class="btn btn-primary btn-sm" data-toggle="modal" data-target="#modal-lg">Add Banner</button>
                        </div>
                        <br>
                        <table id="example1" class="table">
                            <thead>
                                <tr>
                                    <th>Sl No</th>
                                    <th>Title</th>
                                    <th>Description</th>
                                    <th>Image</th>
                                    <th>Url</th>
                                    <th>Button Text</th>
                                    <th>Display Order</th>
                                    <th>Status</th>
                                    <th>Action</th>
                                </tr>
                            </thead>
                            <tbody>
                                @foreach ($banners as $i => $banner)
                                <tr>
                                    <td>{{ $i+1 }}</td>
                                    <td>{{ ucfirst($banner->title) }}</td>
                                    <td>{{ $banner->description }}</td>
                                    <td>
                                        <a href="{{ $banner->ImageUrl }}" target="_blank" rel="noopener noreferrer">
                                            <img src="{{ $banner->ImageUrl }}" height="30px" width="90px">
                                        </a>
                                    </td>
                                    <td><a href="{{ $banner->url }}" target="_blank">{{ $banner->url }}</a></td>
                                    <td>{{ ucfirst($banner->button_text) }}</td>
                                    <td>{{ $banner->display_order }}</td>
                                    <td><span class="right badge @if($banner->status == 'Active') badge-success @else badge-danger @endif">{{ $banner->status }}</span></td>
                                    <td>
                                        <a href="{{ route('banner.edit', ['id' => $banner->id ]) }}"><span class="badge bg-danger"><i class="fas fa-edit"></i></span></a>
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


  <!-- banner add model -->
  <div class="modal fade" id="modal-lg">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h4 class="modal-title">Add Banner</h4>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <form role="form" method="post" class="col-md-12" enctype="multipart/form-data" action="{{ route('banner.save') }}">
                    @csrf

                    <div class="form-group">
                        <label for="exampleInputEmail1">Title</label>
                        <input type="text" class="form-control" name="title" placeholder="Enter Title">
                    </div>

                    <div class="form-group">
                        <label for="exampleInputEmail1">Description</label>
                        <input type="text" class="form-control" name="description" placeholder="Enter Description">
                    </div>

                    <div class="form-group">
                        <label for="exampleInputPassword1">Image</label>
                        <div class="input-group">
                            <div class="custom-file">
                                <input type="file" required onChange="displayImage(this)" name="image" class="custom-file-input" id="exampleInputPassword1">
                                <label class="custom-file-label" for="exampleInputFile">Choose Image</label>
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
                        <label for="exampleInputEmail1">URL</label>
                        <input type="text" class="form-control" name="url" placeholder="Enter URL">
                    </div>

                    <div class="form-group">
                        <label for="exampleInputEmail1">Button Text</label>
                        <input type="text" class="form-control" name="button_text" placeholder="Enter Button Text">
                    </div>

                    <div class="form-group">
                        <label for="exampleInputEmail1">Display Order</label>
                        <input type="number" required class="form-control" name="display_order" min="1" placeholder="Enter Display Order">
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
  <!-- banner add model -->
 
  @endsection
  

                    