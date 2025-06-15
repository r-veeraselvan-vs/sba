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
                            action="{{ route('type.update') }}">
                            @csrf
                            <input type="hidden" name="id" value="{{ $type->id }}">

							<div class="form-group">
								<label for="exampleInputPassword1">Category</label>
								<select class="form-control" name="category_id" onchange="loadSubcategory();" id="category_id">
                                    <option value=""></option>
									@foreach($categories as $category)
										<option value="{{$category->id}}" @if($category->id == $type->subcategory->category_id) selected @endif>{{ $category->category }}</option>
									@endforeach
								</select>
							</div>

                            <div class="form-group">
                                <label for="exampleInputEmail1">Subcategory</label>
                                <select class="form-control" name="subcategory_id" id="subcategory_id" required>
                                </select>
                            </div>

                            <div class="form-group">
                                <label for="exampleInputEmail1">Type</label>
                                <input type="text" class="form-control" value="{{ $type->type }}" name="type" placeholder="Enter Type" required>
                            </div>

                            <div class="form-group">
                                <label for="exampleInputPassword1">Status</label>
                                <select class="form-control" name="status">
                                    <option value="Active" @if('Active' == $type->status) selected @endif>Active</option>
                                    <option value="Inactive" @if('Inactive' == $type->status) selected @endif>Inactive</option>
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

<script>
    onLoadSubcategory();

    function onLoadSubcategory(){
        $('#subcategory_id').empty();
        var category_id = "{{$type->subcategory->category_id}}";
        var subCatArr = @json($subcategories);
        var filteredArray = subCatArr.filter(x => x.category_id == category_id);
        console.log('subcategory', filteredArray);
        $('#subcategory_id').append('<option value="">Select</option>');
        var options = filteredArray.forEach( function(item, index){
            var sel = '';
            if("{{$type->subcategory_id}}" == item.id){
                var sel = 'selected';
            }
            $('#subcategory_id').append('<option value="'+item.id+'"'+sel+'>'+item.subcategory+'</option>');
        });
    }

    function loadSubcategory(){
        $('#subcategory_id').empty();
        var category_id = $('#category_id').val();
        var subCatArr = @json($subcategories);
        var filteredArray = subCatArr.filter(x => x.category_id == category_id);
        console.log('subcategory', filteredArray);
        $('#subcategory_id').append('<option value="">Select</option>');
        var options = filteredArray.forEach( function(item, index){
            $('#subcategory_id').append('<option value="'+item.id+'">'+item.subcategory+'</option>');
        });
    }
</script>

@endsection