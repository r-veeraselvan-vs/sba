@extends('layouts.app')
@section('content')
<div class="content-wrapper" style="min-height: 193px;">
    <section class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1>Banners </h1>
          </div>
        </div>
      </div>
    </section>
    <section class="content">
      <div class="container-fluid">
        <div class="row">
          <div class="col-md-5">
            <div class="card card-primary">
              <div class="card-header">
                <h3 class="card-title">Edit </h3>
              </div>
              <form role="form" method="post" class="col-md-12" enctype="multipart/form-data" action="{{ route('banner.update') }}">
                @csrf
                <input type="hidden" name="id" value="{{ $banner->id }}">
                <input type="hidden" name="old_image" value="{{ $banner->image }}">
                    
                <div class="form-group">
                    <label for="exampleInputEmail1">Title</label>
                    <input type="text" class="form-control" name="title" value="{{ $banner->title }}" placeholder="Enter Title">
                </div>

                <div class="form-group">
                    <label for="exampleInputEmail1">Description</label>
                    <input type="text" class="form-control" name="description"  value="{{ $banner->description }}" placeholder="Enter Description">
                </div>

                <div class="form-group">
                    <label for="exampleInputPassword1">Image</label>
                    <div class="input-group">
                        <div class="custom-file">
                            <input type="file" onChange="displayImage(this)" name="image" class="custom-file-input" id="exampleInputPassword1">
                            <label class="custom-file-label" for="exampleInputFile">Choose Image</label>
                        </div>
                    </div>
                    <br>                        
                    <img class="pull-right" src="{{ $banner->ImageUrl }}" onClick="triggerClick()" id="profile_display" height="100px" width="300px">
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
                    <input type="text" class="form-control" name="url" value="{{ $banner->url }}" placeholder="Enter URL">
                </div>

                <div class="form-group">
                    <label for="exampleInputEmail1">Button Text</label>
                    <input type="text" class="form-control" name="button_text" value="{{ $banner->button_text }}" placeholder="Enter Button Text">
                </div>

                <div class="form-group">
                    <label for="exampleInputEmail1">Display Order</label>
                    <input type="number" required class="form-control" name="display_order" value="{{ $banner->display_order }}" min="1" placeholder="Enter Display Order">
                </div>

                <div class="form-group">
                    <label for="exampleInputPassword1">Status</label>
                    <select class="form-control" name="status" >
                        <option value="Active" @if('Active' == $banner->status) selected @endif>Active</option>
                        <option value="Inactive" @if('Inactive' == $banner->status) selected @endif>Inactive</option>
                    </select>
                </div>

                <div class="card-footer">
                    <button type="submit" class="btn btn-primary">Update</button>
                </div>
            </form>
		  </div>
		  			
		</div>
			<div class="col-md-7">
		  		
		  	</div>
              
          </div>
        </div>
      </div>
    </section>
  </div>
  @endsection
  

                    