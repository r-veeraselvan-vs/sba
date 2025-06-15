@extends('layouts.app')
@section('content')
<div class="content-wrapper" style="min-height: 193px;">
    <section class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1>News </h1>
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
              <form role="form" method="post" class="col-md-12" enctype="multipart/form-data" action="{{ route('news.update') }}">
                @csrf
                <input type="hidden" name="id" value="{{ $news->id }}">
                    
                <div class="form-group">
                    <label for="exampleInputEmail1">News</label>
                    <input type="text" class="form-control" required name="news" value="{{ $news->news }}" placeholder="Enter News">
                </div>

                <div class="form-group">
                    <label for="exampleInputEmail1">URL</label>
                    <input type="text" class="form-control" name="url" value="{{ $news->url }}" placeholder="Enter URL">
                </div>

                <div class="form-group">
                    <label for="exampleInputEmail1">Display Order</label>
                    <input type="number" required class="form-control" name="display_order" value="{{ $news->display_order }}" min="1" placeholder="Enter Display Order">
                </div>

                <div class="form-group">
                    <label for="exampleInputPassword1">Status</label>
                    <select class="form-control" name="status" >
                        <option value="Active" @if('Active' == $news->status) selected @endif>Active</option>
                        <option value="Inactive" @if('Inactive' == $news->status) selected @endif>Inactive</option>
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
  

                    