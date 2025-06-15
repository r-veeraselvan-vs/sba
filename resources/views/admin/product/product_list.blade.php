@extends('layouts.app')
@section('content')
<div class="content-wrapper">
    <!-- /.content-header -->
    <div class="col-md-12">
            <div class="card">
              <div class="card-body">
                <div class="tab-content">
                    <!-- main Service -->
                <div class="tab-pane active">
                    <div class="row mb-3">
                    <!-- Product Dropdown -->
                        <div class="col-md-2">
                            <div class="form-group ">
                                <h4 class="m-0 text-dark text-bold mt-4">Products</h4>
                            </div>
                        </div>
                        <div class="col-6 d-flex justify-content-between align-items-center">
                            <!-- Category Filter Form -->
                            <form method="GET" action="{{ route('product.list') }}" class="d-flex align-items-center">
                                <label for="category-filter" class="mr-2">Choose Category:</label>
                                <select class="form-control" name="category_id" id="category-filter" onchange="this.form.submit()">
                                    <option value="">All</option>
                                    @foreach($categories as $category)
                                        <option value="{{ $category->id }}" @if(request()->category_id == $category->id) selected @endif>{{ $category->category }}</option>
                                    @endforeach
                                </select>
                            </form>
                            
                            <!-- Export Form -->
                            <form action="{{ route('product.export') }}" method="post" class="d-flex align-items-center">
                                @csrf
                                <input type="hidden" name="category_id" value="{{ request()->category_id }}">
                                <button type="submit" id="export-btn" class="btn btn-success btn-sm ml-2 mt-2">
                                    <i class="fa fa-download"></i> Export Products
                                </button>
                            </form>
                        </div>
                        <div class="row mt-4">
                            <div class="col-md-12 add-button">
                                <a type="button" href="{{ route('product.import') }}" class="btn btn-info btn-sm">
                                    <i class="fa fa-upload"></i> Update Price
                                </a>
                                <a type="button" href="{{ route('product.ViewBulkUpdate') }}" class="btn btn-success btn-sm">
                                    <i class="fa fa-upload"></i> Product Upload
                                </a>
                                <button type="button" class="btn btn-primary btn-sm" data-toggle="modal" data-target="#modal-lg">Add Product</button>
                            </div>
                        </div>
                    </div>


                    <style>
                        button#export-btn {
                            margin-top: 0; /* Remove the margin top */
                        }
                    </style>

                        <table id="example1" class="table">
                            <thead>
                                <tr>
                                    <th>S.No</th>
                                    <th>Category</th>
                                    <th>Subcategory</th>
                                    <th>Image</th>
                                    <th>Name</th>
                                    <!-- <th>Matrix 1</th>
                                    <th>GST</th>
                                    <th>MRP</th> -->
                                    <th>Selling Price</th>
                                    <th>Status</th>
                                    <th>Action</th>
                                </tr>
                            </thead>
                            <tbody>
                            </tbody>
                        </table>
                    </div>

                </div>
              </div>
            </div>
          </div>

  </div>

  <!-- product add model -->
  <div class="modal fade" id="modal-lg">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="modal-header">
                    <h4 class="modal-title">Add Products</h4>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <form role="form" method="post" class="col-md-12" enctype="multipart/form-data" action="{{ route('product.save') }}">
                        @csrf
                        <!--@method('PUT')-->

                        <div class="row">
                            <div class="col-md-6">

                                <div class="form-group">
                                    <label for="exampleInputPassword1">Category</label>
                                    <select class="form-control" name="category_id" onchange="loadSubcategory();" id="category_id" required>
                                        <option></option>
                                        @foreach($categories as $category)
                                            <option value="{{ $category->id }}">{{ $category->category }}</option>
                                        @endforeach
                                    </select>
                                </div>

                                <div class="form-group">
                                    <label for="exampleInputPassword1">Subcategory</label>
                                    <select class="form-control" name="subcategory_id" id="subcategory_id" required>
                                    </select>
                                </div>
                                 <div class="form-group" style="display:none;">
                                    <label for="exampleInputPassword1">Vendors</label>
                                    <select class="form-control" name="vendor_id"   id="vendor_id">
                                        <option></option>
                                        @foreach($vendors as $vendor)
                                        <option value="{{ $vendor->id }}">{{ $vendor->name }}</option>
                                        @endforeach
                                    </select>
                                </div>
                                
                                 <div class="form-group" style="display:none;">
                                    <label for="exampleInputPassword1">Lot Number</label>
                                    <select class="form-control" name="lot_number"   id="lot_number">
                                        <option></option>
                                        <?php 
                                            $vendorProducts = \App\VendorsProduct::where('expiry_date','>',date('Y-m-d'))->get();
                                        ?>
                                        @foreach($vendorProducts as $vendorProduct)
                                        <option value="{{ $vendorProduct->id }}">{{ $vendorProduct->lot_no}}</option>
                                        @endforeach
                                    </select>
                                </div>

                                <div class="form-group">
                                    <label for="exampleInputEmail1">Name</label>
                                    <input type="text" required class="form-control" name="name" placeholder="Enter Name">
                                </div>

                                <div class="form-group" style="display:none;">
                                    <label for="exampleInputEmail1">Matrix 1 (Optional)</label>
                                    <input type="text" class="form-control" name="matrix1" placeholder="Enter Matrix 1">
                                </div>

                                <div class="form-group" style="display:none;">
                                    <label for="exampleInputEmail1">Matrix 2 (Optional)</label>
                                    <input type="text" class="form-control" name="matrix2" placeholder="Enter Matrix 2">
                                </div> 

                                <div class="form-group">
                                    <label for="exampleInputEmail1">GST</label>
                                    <input type="number" class="form-control" name="gst" placeholder="Enter GST">
                                </div> 
                                 <div class="form-group">
                                    <label for="exampleInputEmail1">MRP</label>
                                    <input type="number" class="form-control" name="mrp" placeholder="Enter MRP" required>
                                </div> 
                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="form-group" style="display:none;">
                                            <label for="exampleInputEmail1">Non Returnable</label>
                                            <div class="row">
                                                <div class="form-check">
                                                    <input class="form-check-input" type="radio" value="Yes" name="nonreturnable">
                                                    <label class="form-check-label">Yes</label>
                                                </div>
                                                <div class="form-check">
                                                    <input class="form-check-input" checked type="radio" value="No" name="nonreturnable">
                                                    <label class="form-check-label">No</label>
                                                </div>
                                            </div>
                                        </div>  

                                        <div class="form-group">
                                            <label for="exampleInputEmail1">Top Selling</label>
                                            <div class="row">
                                                <div class="form-check">
                                                    <input class="form-check-input" type="radio" value="Yes" name="is_top_selling">
                                                    <label class="form-check-label">Yes</label>
                                                </div>
                                                <div class="form-check">
                                                    <input class="form-check-input" checked type="radio" value="No" name="is_top_selling">
                                                    <label class="form-check-label">No</label>
                                                </div>
                                            </div>
                                        </div>  
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group" style="display:none;">
                                            <label for="exampleInputEmail1">Offer</label>
                                            <div class="row">
                                                <div class="form-check">
                                                    <input class="form-check-input" type="radio" value="Yes" name="is_offer">
                                                    <label class="form-check-label">Yes</label>
                                                </div>
                                                <div class="form-check">
                                                    <input class="form-check-input" type="radio" checked value="No" name="is_offer">
                                                    <label class="form-check-label">No</label>
                                                </div>
                                            </div>
                                        </div> 

                                        <div class="form-group" style="display:none;">
                                            <label for="exampleInputEmail1">Show In Home Page</label>
                                            <div class="row">
                                                <div class="form-check">
                                                    <input class="form-check-input" type="radio" value="Yes" name="show_in_home">
                                                    <label class="form-check-label">Yes</label>
                                                </div>
                                                <div class="form-check">
                                                    <input class="form-check-input" type="radio" checked value="No" name="show_in_home">
                                                    <label class="form-check-label">No</label>
                                                </div>
                                            </div>
                                        </div> 
                                    </div>
                                </div>  

                                <input type="hidden" name="status" value="Inactive">
                            </div>

                            <div class="col-md-6">
                                <div class="form-group">
                                    <label for="exampleInputEmail1">Description</label>
                                    <div class="form-group">
                                        <textarea class="ckeditor form-control" name="description"></textarea>
                                    </div>
                                </div> 
                                
                                <div class="form-group">
                                    <label for="exampleInputPassword1">Thumbnail Image</label>
                                    <div class="input-group">
                                        <div class="custom-file">
                                            <input type="file" required onChange="displayImage(this)" name="thumbnail" class="custom-file-input" id="exampleInputPassword1">
                                            <label class="custom-file-label" for="exampleInputFile">Thumbnail Image</label>
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
                                                               
                            </div>
                        </div>
                        <input type="hidden" name="page" value="{{ $products->currentPage() }}">
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
  <!-- product add model -->
  <script>
$(document).ready(function() {
    // Destroy existing DataTable instance if it exists
    if ($.fn.DataTable.isDataTable("#example1")) {
        $('#example1').DataTable().destroy();
    }

    // Initialize DataTable
    $("#example1").DataTable({
        "processing": true,
        "serverSide": true,
        "responsive": true,
        "autoWidth": false,
        "ajax": {
            "url": "{{ route('product.list') }}",
            "type": "GET",
            "data": function (d) {
                d.category_id = '{{ $selectedCategory }}';
            }
        },
        "columns": [
            { "data": 0, "width": "6%"},
            { "data": 1, "width": "14%"},
            { "data": 2, "width": "15%"},
            { "data": 3, "orderable": false, "searchable": false, "width": "10%" },
            { "data": 4, "width": "25%"},
            { "data": 5, "width": "15%"},
            { "data": 6, "orderable": false, "searchable": false, "width": "8%" },
            { "data": 7, "orderable": false, "searchable": false, "width": "7%" }
        ],
        "pageLength": 100,
        "lengthMenu": [ [50, 75, 100], [50, 75, 100] ]
    });
});
</script>
<script src="//cdn.ckeditor.com/4.14.1/standard/ckeditor.js"></script>
<script type="text/javascript">
    $(document).ready(function () {
        $('.ckeditor').ckeditor();
    });

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
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>


  @endsection
  


                    