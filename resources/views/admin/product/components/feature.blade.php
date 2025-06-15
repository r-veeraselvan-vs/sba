<div class="tab-pane @if($tab == 'feature') active @endif" id="feature">
    <div class="add-button">
        <button type="button" onclick="add_feature();" class="btn btn-primary btn-sm">Add Feature</button>
    </div>
    <br>
    <div>
        <form action="{{ route('product.feature.update') }}" method="post">
            @csrf
    @method('PUT')
            <input type="hidden" name="id" value="{{ $product->id }}">
            <input type="hidden" name="tab" value="feature">
            <table id="feature_table" class="table">
                <tr id="-1">
                    <th>Feature</th>
                    <th>Display Order</th>
                    <th>Status</th>
                    <th>Action</th>
                </tr>
                @foreach($product->features as $fkey => $feature)
                    <tr id="{{$fkey}}">
                        <td>                                                            
                            <input type="hidden" name="data[{{$fkey}}][id]" value="{{ $feature->id }}">
                            <input type="hidden" name="data[{{$fkey}}][product_id]" value="{{ $feature->product_id }}">
                            <input class="form-control" type="text" name="data[{{$fkey}}][feature]" value="{{ $feature->feature }}" required>
                        </td>
                        <td>
                            <input class="form-control" type="number" name="data[{{$fkey}}][display_order]" value="{{ $feature->display_order }}" required>
                        </td>
                        <td>
                            <select class="form-control" name="data[{{$fkey}}][status]" required>
                                <option value="Active" @if($feature->status == 'Active') selected @endif>Active</option>
                                <option value="Inactive" @if($feature->status == 'Inactive') selected @endif>Inactive</option>
                            </select>
                        </td>
                        <td>
                            &nbsp; <a href="{{ route('product.feature.delete', [ 'id' => $feature->id, 'page' => $page ]) }}"><span class="badge bg-danger"><i class="fas fa-trash"></i></span></a>
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
    function add_feature(){
        var fkey = parseInt($('#feature_table tr:last-child').attr('id')) + 1;
        var display_order = fkey + 1;
        var add_feature = '<tr id="'+fkey+'">'+
                        '<td>'+
                            '<input type="hidden" name="data['+fkey+'][id]" value="0">'+
                            '<input type="hidden" name="data['+fkey+'][product_id]" value="{{ $product->id }}">'+
                            '<input class="form-control" type="text" name="data['+fkey+'][feature]" value="" required>'+
                        '</td>'+
                        '<td>'+
                            '<input class="form-control" type="number" name="data['+fkey+'][display_order]" value="'+display_order+'" required>'+
                        '</td>'+
                        '<td>'+
                            '<select class="form-control" name="data['+fkey+'][status]" required>'+
                                '<option value="Active">Active</option>'+
                                '<option value="Inactive">Inactive</option>'+
                            '</select>'+
                        '</td>'+
                        '<td>'+
                            '&nbsp; <a onclick="remove_feature('+fkey+');" id="delete_feature_'+fkey+'"><span class="badge bg-danger"><i class="fas fa-trash"></i></span></a>'+
                        '</td>'+
                    '</tr>';
                    $('#feature_table').append(add_feature);
    }
    function remove_feature(key){
        $('#delete_feature_'+key).closest('tr').remove();
    }
</script>