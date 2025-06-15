<div class="tab-pane @if($tab == 'specification') active @endif" id="specification">
    <div class="add-button">
        <button type="button" onclick="add_specification();" class="btn btn-primary btn-sm">Add Specification</button>
    </div>
    <br>
    <div>
        <form action="{{ route('product.specification.update') }}" method="post">
            @csrf
    @method('PUT')
            <input type="hidden" name="id" value="{{ $product->id }}">
            <input type="hidden" name="tab" value="specification">
            <table id="specification_table" class="table">
                <tr id="-1">
                    <th>Name</th>
                    <th>Details</th>
                    <th>Display Order</th>
                    <th>Status</th>
                    <th>Action</th>
                </tr>
                @foreach($product->specifications as $skey => $specification)
                    <tr id="{{$skey}}">
                        <td>                                                            
                            <input type="hidden" name="data[{{$skey}}][id]" value="{{ $specification->id }}">
                            <input type="hidden" name="data[{{$skey}}][product_id]" value="{{ $specification->product_id }}">
                            <input class="form-control" type="text" name="data[{{$skey}}][name]" value="{{ $specification->name }}" required>
                        </td>
                        <td>
                            
                        <input class="form-control" type="text" name="data[{{$skey}}][details]" value="{{ $specification->details }}" required>
                        </td>
                        <td>
                            <input class="form-control" type="number" name="data[{{$skey}}][display_order]" value="{{ $specification->display_order }}" required>
                        </td>
                        <td>
                            <select class="form-control" name="data[{{$skey}}][status]" required>
                                <option value="Active" @if($specification->status == 'Active') selected @endif>Active</option>
                                <option value="Inactive" @if($specification->status == 'Inactive') selected @endif>Inactive</option>
                            </select>
                        </td>
                        <td>
    <a href="{{ route('product.specification.delete', ['id' => $specification->id, 'page' => $page]) }}">
        <span class="badge bg-danger"><i class="fas fa-trash"></i></span>
    </a>
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
    function add_specification(){
        var skey = parseInt($('#specification_table tr:last-child').attr('id')) + 1;
        var display_order = skey + 1;
        var add_specification = '<tr id="'+skey+'">'+
                        '<td>'+
                            '<input type="hidden" name="data['+skey+'][id]" value="0">'+
                            '<input type="hidden" name="data['+skey+'][product_id]" value="{{ $product->id }}">'+
                            '<input class="form-control" type="text" name="data['+skey+'][name]" value="" required>'+
                        '</td>'+
                        '<td>'+
                            '<input class="form-control" type="text" name="data['+skey+'][details]" value="" required>'+
                        '</td>'+
                        '<td>'+
                            '<input class="form-control" type="number" name="data['+skey+'][display_order]" value="'+display_order+'" required>'+
                        '</td>'+
                        '<td>'+
                            '<select class="form-control" name="data['+skey+'][status]" required>'+
                                '<option value="Active">Active</option>'+
                                '<option value="Inactive">Inactive</option>'+
                            '</select>'+
                        '</td>'+
                        '<td>'+
                            '&nbsp; <a onclick="remove_specification('+skey+');" id="delete_specification_'+skey+'"><span class="badge bg-danger"><i class="fas fa-trash"></i></span></a>'+
                        '</td>'+
                    '</tr>';
                    $('#specification_table').append(add_specification);
    }
    function remove_specification(key){
        $('#delete_specification_'+key).closest('tr').remove();
    }
</script>