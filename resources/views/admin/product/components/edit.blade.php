<div class="tab-pane @if($tab == 'edit') active @endif" id="edit">    
    <div>
        <form role="form" method="POST" class="col-md-12" enctype="multipart/form-data" action="{{ route('product.update', ['id' => $product->id]) }}">
            @csrf
    @method('PUT')

            <div class="row">
                <div class="col-md-6">
                    <input type="hidden" name="id" value="{{ $product->id }}">
                    <input type="hidden" name="old_thumbnail" value="{{ $product->thumbnail }}">
                    <input type="hidden" name="tab" value="{{ $tab }}">

                    <div class="form-group">
                        <label for="exampleInputPassword1">Category</label>
                        <select class="form-control" name="category_id" onchange="loadSubcategory();" id="category_id" required>
                            @foreach($categories as $category)
                            <option value="{{ $category->id }}" @if($category->id == $product->category_id) selected @endif>{{ $category->category }}</option>
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
                                        <option value="{{ $vendor->id }}" @if($vendor->id == $product->vendor_id) selected @endif>{{ $vendor->name }}</option>
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
                                        <option value="{{ $vendorProduct->id }}"  @if($vendorProduct->id == $product->lot_number) selected @endif>{{ $vendorProduct->lot_no}}</option>
                                        @endforeach
                                    </select>
                                </div>
                                <?php 
                                            $vendorProduct = \App\VendorsProduct::where('id',$product->lot_number)->first();
                                        ?>
                                        @if($vendorProduct!=null)
                     <div class="form-group">
                        <label for="exampleInputEmail1">Remaining Quantity :</label>
                        
                        <input type="text"  class="form-control"   value="{{ $vendorProduct->quantity }}" required readonly>
                    </div>
                    @endif

                    <div class="form-group">
                        <label for="exampleInputEmail1">Name</label>
                        <input type="text" required class="form-control" name="name" value="{{ $product->name }}" placeholder="Enter Name">
                    </div>

                    <div class="form-group" style="display:none;">
                        <label for="exampleInputPassword1">Matrix 1 (Optional)</label>
                        <input type="text" class="form-control" name="matrix1" value="{{ $product->matrix1 }}" placeholder="Enter Matrix 1">
                    </div>

                    <div class="form-group" style="display:none;">
                        <label for="exampleInputPassword1">Matrix 2 (Optional)</label>
                        <input type="text" class="form-control" name="matrix2" value="{{ $product->matrix2 }}" placeholder="Enter Matrix 2">
                    </div>

                    <div class="form-group">
                        <label for="exampleInputPassword1">GST</label>
                        <input type="number" class="form-control" name="gst" value="{{ $product->gst }}" placeholder="Enter GST">
                    </div>
                     <div class="form-group">
                                    <label for="exampleInputEmail1">MRP</label>
                                    <input type="number" class="form-control" name="mrp"  value="{{ $product->mrp }}"  placeholder="Enter MRP" required>
                                </div> 
                    <div class="row">
                        <div class="col-md-6">
                            <div class="form-group" style="display:none;">
                                <label for="exampleInputEmail1">Non Returnable</label>
                                <div class="row">
                                    <div class="form-check">
                                        <input class="form-check-input" type="radio" @if($product->nonreturnable == 'Yes') checked @endif value="Yes" name="nonreturnable">
                                        <label class="form-check-label">Yes</label>
                                    </div>
                                    <div class="form-check">
                                        <input class="form-check-input" type="radio" @if($product->nonreturnable == 'No') checked @endif value="No" name="nonreturnable">
                                        <label class="form-check-label">No</label>
                                    </div>
                                </div>
                            </div>  
                            <div class="form-group" style="display:none;">
                                <label for="exampleInputEmail1">Offer</label>
                                <div class="row">
                                    <div class="form-check">
                                        <input class="form-check-input" type="radio" @if($product->is_offer == 'Yes') checked @endif value="Yes" name="is_offer">
                                        <label class="form-check-label">Yes</label>
                                    </div>
                                    <div class="form-check">
                                        <input class="form-check-input" type="radio" @if($product->is_offer == 'No') checked @endif value="No" name="is_offer">
                                        <label class="form-check-label">No</label>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-12">
                            <div class="form-group">
                                <label for="exampleInputEmail1">Top Selling</label>
                                <div class="row">
                                    <div class="form-check">
                                        <input class="form-check-input" type="radio" @if($product->is_top_selling == 'Yes') checked @endif value="Yes" name="is_top_selling">
                                        <label class="form-check-label">Yes</label>
                                    </div>
                                    <div class="form-check">
                                        <input class="form-check-input" type="radio" @if($product->is_top_selling == 'No') checked @endif value="No" name="is_top_selling">
                                        <label class="form-check-label">No</label>
                                    </div>
                                </div>
                            </div>
                                
                            <div class="form-group" style="display:none;">
                                <label for="exampleInputEmail1">Show In Home Page</label>
                                <div class="row">
                                    <div class="form-check">
                                        <input class="form-check-input" type="radio" @if($product->show_in_home == 'Yes') checked @endif value="Yes" name="show_in_home">
                                        <label class="form-check-label">Yes</label>
                                    </div>
                                    <div class="form-check">
                                        <input class="form-check-input" type="radio" @if($product->show_in_home == 'No') checked @endif value="No" name="show_in_home">
                                        <label class="form-check-label">No</label>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                        
                      
                        
                     <input type="hidden" name="page" value="{{ $page }}">
                    
                    <div class="card-footer">
                        <button type="submit" class="btn btn-primary">Update</button>
                    </div>
                                             
                </div>           
                <div class="col-md-6">
                   
                    <div class="form-group">
                        <label for="exampleInputEmail1">Description</label>
                        <div class="form-group">
                            <textarea class="ckeditor form-control" name="description">{!! $product->description !!}</textarea>
                        </div>
                    </div>     

                    <div class="form-group">
                        <label for="exampleInputPassword1">Thumbnail Image</label>
                        <div class="input-group">
                            <div class="custom-file">
                                <input type="file" onChange="displayImage(this)" name="thumbnail" class="custom-file-input" id="exampleInputPassword1">
                                <label class="custom-file-label" for="exampleInputFile">Choose Image</label>
                            </div>
                        </div>
                        <br>                        
                        <img class="pull-right" src="{{ $product->ThumbnailUrl }}" onClick="triggerClick()" id="profile_display" height="100px" width="100px">
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
                        <label for="exampleInputPassword1">Status</label>
                        <select class="form-control" name="status" >
                            <option value="Active" @if('Active' == $product->status) selected @endif>Active</option>
                            <option value="Inactive" @if('Inactive' == $product->status) selected @endif>Inactive</option>
                        </select>
                    </div>
                </div>
            </div> 
            
        </form>
    </div>
</div>

<script src="//cdn.ckeditor.com/4.14.1/standard/ckeditor.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            $('.ckeditor').ckeditor();
        });

     onLoadSubcategory();

    function onLoadSubcategory(){
        $('#subcategory_id').empty();
        var category_id = "{{$product->category_id}}";
        var subCatArr = @json($subcategories);
        var filteredArray = subCatArr.filter(x => x.category_id == category_id);
        console.log('subcategory', filteredArray);
        $('#subcategory_id').append('<option value="">Select</option>');
        var options = filteredArray.forEach( function(item, index){
            var sel = '';
            if("{{$product->subcategory_id}}" == item.id){
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