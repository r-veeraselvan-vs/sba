<div class="tab-pane @if($tab == 'author') active @endif" id="author">
    <div class="add-button">
        <button type="button" onclick="add_author();" class="btn btn-primary btn-sm">Add Author</button>
    </div>
    <br>
    <div>
        <form action="{{ route('product.author.update', [ 'nature' => $nature ]) }}" method="post">
            @csrf
            <input type="hidden" name="id" value="{{ $product->id }}">
            <input type="hidden" name="tab" value="author">
            <table id="author_table" class="table">
                <tr id="-1">
                    <th>Author</th>
                    <th>Display Order</th>
                    <th>Status</th>
                    <th>Action</th>
                </tr>
                @foreach($product->authors as $akey => $author)
                    <tr id="{{$akey}}">
                        <td>                                                            
                            <input type="hidden" name="data[{{$akey}}][id]" value="{{ $author->id }}">
                            <input type="hidden" name="data[{{$akey}}][product_id]" value="{{ $author->product_id }}">
                            <select class="form-control" name="data[{{$akey}}][author_id]" required>
                                <option></option>
                                @foreach($authors as $a)
                                <option value="{{  $a->id }}" @if($author->author_id == $a->id) selected @endif>{{ $a->name }}</option>
                                @endforeach
                            </select>
                        </td>
                        <td>
                            <input class="form-control" type="number" name="data[{{$akey}}][display_order]" value="{{ $author->display_order }}" required>
                        </td>
                        <td>
                            <select class="form-control" name="data[{{$akey}}][status]" required>
                                <option value="Active" @if($author->status == 'Active') selected @endif>Active</option>
                                <option value="Inactive" @if($author->status == 'Inactive') selected @endif>Inactive</option>
                            </select>
                        </td>
                        <td>
                            &nbsp; <a href="{{ route('product.author.delete', [ 'nature' => $nature, 'id' => $author->id ]) }}"><span class="badge bg-danger"><i class="fas fa-trash"></i></span></a>
                        </td>
                    </tr>
                @endforeach
            </table>
            <div class="card-footer" style="text-align: right;">
                <button type="submit" class="btn btn-primary btn-sm">Update</button>
            </div>
        </form>
    </div>
    <!-- history -->
    
    <!-- history -->
</div>
<script>
    function add_author(){
        var akey = parseInt($('#author_table tr:last-child').attr('id')) + 1;
        var display_order = akey + 1;
        var add_author = '<tr id="'+akey+'">'+
                        '<td>'+
                            '<input type="hidden" name="data['+akey+'][id]" value="0">'+
                            '<input type="hidden" name="data['+akey+'][product_id]" value="{{ $product->id }}">'+
                            '<select class="form-control" name="data['+akey+'][author_id]" required>'+
                                '<option></option>'+
                                '@foreach($authors as $a)'+
                                    '<option value="{{ $a->id }}">{{ $a->name }}</option>'+
                                '@endforeach'+
                            '</select>'+
                        '</td>'+
                        '<td>'+
                            '<input class="form-control" type="number" name="data['+akey+'][display_order]" value="'+display_order+'" required>'+
                        '</td>'+
                        '<td>'+
                            '<select class="form-control" name="data['+akey+'][status]" required>'+
                                '<option value="Active">Active</option>'+
                                '<option value="Inactive">Inactive</option>'+
                            '</select>'+
                        '</td>'+
                        '<td>'+
                            '&nbsp; <a onclick="remove_author('+akey+');" id="delete_author_'+akey+'"><span class="badge bg-danger"><i class="fas fa-trash"></i></span></a>'+
                        '</td>'+
                    '</tr>';
                    $('#author_table').append(add_author);
    }
    function remove_author(key){
        $('#delete_author_'+key).closest('tr').remove();
    }
</script>