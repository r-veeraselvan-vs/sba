@extends('layouts.app')
@section('content')
<div class="content-wrapper" style="min-height: 193px;">
    <section class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1>Category </h1>
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
              <form role="form" method="post" class="col-md-12" enctype="multipart/form-data" action="{{ route('category.update') }}">
                @csrf
                <input type="hidden" name="id" value="{{ $category->id }}">
                <input type="hidden" name="old_image" value="{{ $category->image }}">
                <input type="hidden" name="old_home_image" value="{{ $category->home_image }}">
                                        
                    <div class="form-group">
                        <label for="exampleInputEmail1">Category</label>
                        <input type="text" required class="form-control" value="{{ $category->category }}" name="category" placeholder="Enter Category">
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
                      <img class="pull-right" src="{{ $category->ImageUrl }}" onClick="triggerClick()" id="profile_display" height="100px" width="100px">
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
                              <input type="file" onChange="displayHomeImage(this)" name="home_image" class="custom-file-input" id="exampleInputPassword1">
                              <label class="custom-file-label" for="exampleInputFile">Choose Home Image</label>
                          </div>
                      </div>
                      <br>                        
                      <img class="pull-right" src="{{ $category->HomeImageUrl }}" onClick="triggerClick()" id="profile_display1" height="100px" width="100px">
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
                        <option value="Active" @if('Active' == $category->status) selected @endif>Active</option>
                        <option value="Inactive" @if('Inactive' == $category->status) selected @endif>Inactive</option>
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
  

                    