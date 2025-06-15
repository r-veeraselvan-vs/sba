@extends('layouts.app')
@section('content')
<div class="content-wrapper" style="min-height: 193px;">
    <section class="content-header">
        <div class="container-fluid">
            <div class="row mb-2">
                <div class="col-sm-6">
                    <h1>Subcategory </h1>
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
                        <form role="form" method="post" class="col-md-12" enctype="multipart/form-data"
                            action="{{ route('subcategory.update') }}">
                            @csrf
                            <input type="hidden" name="id" value="{{ $subcategory->id }}">

							<div class="form-group">
								<label for="exampleInputPassword1">Category</label>
								<select class="form-control" name="category_id" >
									@foreach($categories as $category)
										<option value="{{$category->id}}" @if($category->id == $subcategory->category_id) selected @endif>{{ $category->category }}</option>
									@endforeach
								</select>
							</div>

                            <div class="form-group">
                                <label for="exampleInputEmail1">Subcategory</label>
                                <input type="text" required class="form-control" value="{{ $subcategory->subcategory }}"
                                    name="subcategory" placeholder="Enter Subcategory">
                            </div>

                            <div class="form-group">
                                <label for="exampleInputPassword1">Status</label>
                                <select class="form-control" name="status">
                                    <option value="Active" @if('Active'==$subcategory->status) selected @endif>Active</option>
                                    <option value="Inactive" @if('Inactive'==$subcategory->status) selected @endif>Inactive</option>
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