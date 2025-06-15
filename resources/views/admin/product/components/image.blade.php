<div class="tab-pane @if($tab == 'image') active @endif" id="image">
    <div class="add-button">
        <button type="button" onclick="add_image();" class="btn btn-primary btn-sm">Add Image</button>
    </div>
    <br>
    <div>
        <form action="{{ route('product.image.update') }}" enctype="multipart/form-data" method="post">
            @csrf
    @method('PUT')
            <input type="hidden" name="id" value="{{ $product->id }}">
            <input type="hidden" name="tab" value="image">
            <table id="image_table" class="table">
                <tr id="-1">
                    <th>Image</th>
                    <th>Preview</th>
                    <!-- <th>Matrix 1</th> -->
                    <th>Display Order</th>
                    <th>Status</th>
                    <th>Action</th>
                </tr>
                @foreach($product->images as $ikey => $image)
                    <tr id="{{$ikey}}">
                        <td>                                                            
                            <input type="hidden" name="data[{{$ikey}}][id]" value="{{ $image->id }}">
                            <input type="hidden" name="data[{{$ikey}}][product_id]" value="{{ $image->product_id }}">
                            <div class="input-group">
                                <div class="custom-file">
                                    <input type="file" onChange="display_image_image(this, {{$ikey}})" name="data[{{$ikey}}][image]" class="custom-file-input" >
                                    <label class="custom-file-label" for="exampleInputFile">Change Image</label>
                                </div>
                            </div>
                            <input type="hidden" name="data[{{$ikey}}][old_image]" value="{{ $image->image }}">
                        </td>
                        <td>
                            <a href="{{ $image->ImageUrl }}" target="_blank" rel="noopener noreferrer">
                                <img src="{{ $image->ImageUrl }}" alt="" width="40px" height="40px" id="preview_image_image{{$ikey}}">
                            </a>
                        </td>
                        <!-- <td style="display:none;">
                            <select class="form-control" name="data[{{$ikey}}][matrix1]">
                                <option value=""></option>
                                @foreach($matrix_ones as $matrix_one)
                                <option value="{{$matrix_one}}" @if($image->matrix1 == $matrix_one) selected @endif>{{$matrix_one}}</option>
                                @endforeach
                            </select>
                        </td> -->
                        <td>
                            <input class="form-control" type="number" name="data[{{$ikey}}][display_order]" value="{{ $image->display_order }}" required>
                        </td>
                        <td>
                            <select class="form-control" name="data[{{$ikey}}][status]" required>
                                <option value="Active" @if($image->status == 'Active') selected @endif>Active</option>
                                <option value="Inactive" @if($image->status == 'Inactive') selected @endif>Inactive</option>
                            </select>
                        </td>
                        <td>
                            &nbsp; <a href="{{ route('product.image.delete', [ 'id' => $image->id, 'page' => $page ]) }}"><span class="badge bg-danger"><i class="fas fa-trash"></i></span></a>
                        </td>
                    </tr>
                    
                @endforeach
            </table>
                     <input type="hidden" name="page" value="{{ $page }}">
            <div class="card-footer" style="text-align: right;">
                <button type="submit" class="btn btn-primary btn-sm">Update</button>
            </div>
        </form>
    </div>
    <!-- history -->
    <!-- history -->
</div>
<script>
    function add_image(){
        var ikey = parseInt($('#image_table tr:last-child').attr('id')) + 1;
        var display_order = ikey + 1;
        var add_image = '<tr id="'+ikey+'">'+
                        '<td>'+
                            '<input type="hidden" name="data['+ikey+'][id]" value="0">'+
                            '<input type="hidden" name="data['+ikey+'][product_id]" value="{{ $product->id }}">'+
                            '<div class="input-group">'+
                                '<div class="custom-file">'+
                                    '<input type="file" onChange="display_image_image(this, '+ikey+')" name="data['+ikey+'][image]" class="custom-file-input" required >'+
                                    '<label class="custom-file-label" for="exampleInputFile">Choose Image</label>'+
                                '</div>'+
                            '</div>'+
                        '</td>'+
                        '<td>'+
                            '<img src="/images/no_image.png" alt="" width="40px" height="40px" id="preview_image_image'+ikey+'">'+
                        '</td>'+
                        // '<td>'+
                        //     '<select class="form-control" name="data['+ikey+'][matrix1]">'+
                        //         '<option value=""></option>'+
                        //         '@foreach($matrix_ones as $matrix_one)'+
                        //         '<option value="{{$matrix_one}}">{{$matrix_one}}</option>'+
                        //         '@endforeach'+
                        //     '</select>'+
                        // '</td>'+
                        '<td>'+
                            '<input class="form-control" type="number" name="data['+ikey+'][display_order]" value="'+display_order+'" required>'+
                        '</td>'+
                        '<td>'+
                            '<select class="form-control" name="data['+ikey+'][status]" required>'+
                                '<option value="Active">Active</option>'+
                                '<option value="Inactive">Inactive</option>'+
                            '</select>'+
                        '</td>'+
                        '<td>'+
                            '&nbsp; <a onclick="remove_image('+ikey+');" id="delete_image_'+ikey+'"><span class="badge bg-danger"><i class="fas fa-trash"></i></span></a>'+
                        '</td>'+
                    '</tr>';
                    $('#image_table').append(add_image);
    }
    function remove_image(key){
        $('#delete_image_'+key).closest('tr').remove();
    }
</script>

<script>
    function triggerClickPromoImage(e) {
        document.querySelector('#image').click();
    }
    function display_image_image(e, id) {
        if (e.files[0]) {
            var reader = new FileReader();
            reader.onload = function(e){
            document.querySelector('#preview_image_image'+id).setAttribute('src', e.target.result);
            }
            reader.readAsDataURL(e.files[0]);
        }
    }
</script>