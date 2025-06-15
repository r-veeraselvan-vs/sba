@extends('layouts.app')
@section('content')
<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <div class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1 class="m-0 text-dark">Types List</h1>
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
                            <button type="button" class="btn btn-primary btn-sm" data-toggle="modal" data-target="#modal-lg">Add Type</button>
                        </div>
                        <br>
                        <table id="example1" class="table">
                            <thead>
                                <tr>
                                    <th>Sl No</th>
                                    <th>Category</th>
                                    <th>Subcategory</th>
                                    <th>Type</th>
                                    <th>Status</th>
                                    <th>Action</th>
                                </tr>
                            </thead>
                            <tbody>
                                @foreach ($types as $i => $type)
                                <tr>
                                    <td>{{ $i+1 }}</td>
                                    <td>{{ $type->subcategory->category->category }}</td>
                                    <td>{{ $type->subcategory->subcategory }}</td>
                                    <td>{{ $type->type }}</td>
                                    <td><span class="right badge @if($type->status == 'Active') badge-success @else badge-danger @endif">{{ $type->status }}</span></td>
                                    <td>
                                        <a href="{{ route('type.edit', ['id' => $type->id ]) }}"><span class="badge bg-danger"><i class="fas fa-edit"></i></span></a>
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


  <!-- Add sub category model -->
  <div class="modal fade" id="modal-lg">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h4 class="modal-title">Add Type</h4>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <form role="form" method="post" class="col-md-12" enctype="multipart/form-data" action="{{ route('type.save') }}">
                    @csrf

                    <div class="form-group">
                        <label for="exampleInputPassword1">Category</label>
                        <select class="form-control" name="category_id" onchange="loadSubcategory();" id="category_id" required>
                            <option></option>
                            @foreach($categories as $category)
                                <option value="{{$category->id}}">{{ $category->category }}</option>
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
                        <input type="text" required class="form-control" name="type" placeholder="Enter Type">
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
 
<script>
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
  

                    