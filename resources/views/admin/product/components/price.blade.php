<div class="tab-pane @if($tab == 'price') active @endif" id="price">
    <div class="add-button">
        <button type="button" onclick="add_price();" class="btn btn-primary btn-sm">Add Price</button>
    </div>
    <br>
    <div>
        <form action="{{ route('product.price.update') }}" method="post">
            @csrf
    @method('PUT')
            <input type="hidden" name="id" value="{{ $product->id }}">
            <input type="hidden" name="tab" value="price">
            <table id="price_table" class="table">
                <tr id="-1">
                </tr>
                @foreach($product->all_prices as $pkey => $price)
                    <tr id="{{$pkey}}">
                        <td>
                            <label>{{ $pkey+1 }}.</label>
                            <input type="hidden" name="data[{{$pkey}}][id]" value="{{ $price->id }}">
                            <input type="hidden" name="data[{{$pkey}}][product_id]" value="{{ $price->product_id }}">
                        </td>
                        @if($product->matrix1)
                        <td>                                                            
                            <label>Matrix 1 ({{ $product->matrix1 }})</label>
                            <input class="form-control" type="text" name="data[{{$pkey}}][matrix1]" value="{{ $price->matrix1 }}" required>
                        </td>
                        @endif
                        @if($product->matrix2)
                        <td>
                            <label>Matrix 2 ({{ $product->matrix2 }})</label>
                            <input class="form-control" type="text" name="data[{{$pkey}}][matrix2]" value="{{ $price->matrix2 }}" required>
                        </td>
                        @endif
                        <td>
                            <label>Price</label>
                            <input class="form-control" type="number" step="0.01" id="price_{{$pkey}}" onChange="enterOffer({{$pkey}})" name="data[{{$pkey}}][price]" value="{{ $price->price }}" required>
                            <label>Retail Price</label>
                            <input class="form-control" type="number" step="0.01" name="data[{{$pkey}}][retail_price]" value="{{ $price->retail_price }}">
                        </td>
                        <td>
                            <label>Offer Percentage</label>
                            <input class="form-control" type="number" id="offer_percentage_{{$pkey}}" onChange="enterOffer({{$pkey}})" name="data[{{$pkey}}][offer_percentage]" value="{{ $price->offer_percentage }}">
                            <label>Offer Price</label>
                            <input class="form-control" type="number" step="0.01" id="offer_price_{{$pkey}}" name="data[{{$pkey}}][offer_price]" value="{{ $price->offer_price }}">
                        </td>
                        <td>
                            <label>Start Date</label>
                            <input class="form-control" type="date" id="start_date_{{$pkey}}" name="data[{{$pkey}}][start_date]" value="{{ $price->start_date }}">
                            <label>End Date</label>
                            <input class="form-control" type="date" id="end_date_{{$pkey}}" name="data[{{$pkey}}][end_date]" value="{{ $price->end_date }}">
                        </td>
                        <td>
                            <label>Minimum Order</label>
                            <input class="form-control" type="number" name="data[{{$pkey}}][minimum_order]" value="{{ $price->minimum_order }}" min="1">
                            <label>Weight</label>
                            <input class="form-control" type="text" name="data[{{$pkey}}][weight]" value="{{ $price->weight }}">
                        </td>
                        <td>
                            <label>Inventory</label>
                            <input class="form-control" type="number" name="data[{{$pkey}}][inventory]" value="{{ $price->inventory }}" >
                            <label>Display Order</label>
                            <input class="form-control" type="number" name="data[{{$pkey}}][display_order]" value="{{ $price->display_order }}" required>
                        </td>
                        <td>
                            <label>Status</label>
                            <select class="form-control" name="data[{{$pkey}}][status]" required>
                                <option value="Active" @if($price->status == 'Active') selected @endif>Active</option>
                                <option value="Inactive" @if($price->status == 'Inactive') selected @endif>Inactive</option>
                            </select>
                            <label>Action</label>
                            <br> <a href="{{ route('product.price.delete', [ 'id' => $price->id, 'page' => $page ]) }}"><span class="badge bg-danger"><i class="fas fa-trash"></i></span></a>
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
    
</div>
<script>
    function add_price(){
        var pkey = parseInt($('#price_table tr:last-child').attr('id')) + 1;
        var display_order = pkey + 1;
        var matrix1 = "{{ $product->matrix1 }}";
        var matrix2 = "{{ $product->matrix2 }}";

        var mat1 = '';
        var mat2 = '';

        if(matrix1){
            mat1 = '<td>'+                                                           
                        '<label>Matrix 1 ('+matrix1+')</label>'+
                        '<input class="form-control" type="text" name="data['+pkey+'][matrix1]" value="" required>'+
                    '</td>';
        }
        if(matrix2){
            mat2 = '<td>'+                                                         
                        '<label>Matrix 2 ('+matrix2+')</label>'+
                        '<input class="form-control" type="text" name="data['+pkey+'][matrix2]" value="" required>'+
                    '</td>';
        }

        var add_price = '<tr id="'+pkey+'">'+
                        '<td>'+
                            '<label>'+(pkey+1)+'.</label>'+
                            '<input type="hidden" name="data['+pkey+'][id]" value="0">'+
                            '<input type="hidden" name="data['+pkey+'][product_id]" value="{{ $product->id }}">'+
                        '</td>'+
                        mat1 + 
                        mat2 +
                        '<td>'+                                                        
                            '<label>Price</label>'+
                            '<input class="form-control" type="number" step="0.01" id="price_'+pkey+'" onChange="enterOffer('+pkey+')" name="data['+pkey+'][price]" value="" required>'+                                                        
                            '<label>Retail Price</label>'+
                            '<input class="form-control" type="number" step="0.01" name="data['+pkey+'][retail_price]" value="0" required>'+
                        '</td>'+
                        '<td>'+                                                        
                            '<label>Offer Percentage</label>'+
                            '<input class="form-control" type="number" id="offer_percentage_'+pkey+'" onChange="enterOffer('+pkey+')" name="data['+pkey+'][offer_percentage]" value="0" required>'+                                                        
                            '<label>Offer Price</label>'+
                            '<input class="form-control" type="number" step="0.01" id="offer_price_'+pkey+'" name="data['+pkey+'][offer_price]" min="0">'+
                        '</td>'+
                        '<td>'+                                                        
                            '<label>Start Date</label>'+
                            '<input class="form-control" type="date" id="start_date_'+pkey+'" name="data['+pkey+'][start_date]">'+                                                        
                            '<label>End Date</label>'+
                            '<input class="form-control" type="date" id="end_date_'+pkey+'" name="data['+pkey+'][end_date]">'+
                        '</td>'+
                        '<td>'+                                                        
                            '<label>Minimum Order</label>'+
                            '<input class="form-control" type="number" name="data['+pkey+'][minimum_order]" value="1" min="1" required>'+                                                        
                            '<label>Weight</label>'+
                            '<input class="form-control" type="number" name="data['+pkey+'][weight]" required>'+
                        '</td>'+
                        '<td>'+                                                         
                            '<label>Inventory</label>'+                                                      
                            '<input class="form-control" type="number" name="data['+pkey+'][inventory]" value="" required>'+ 
                            '<label>Display Order</label>'+
                            '<input class="form-control" type="number" name="data['+pkey+'][display_order]" value="'+display_order+'" required>'+ 
                        '</td>'+
                        '<td>'+                                                        
                            '<label>Status</label>'+
                            '<select class="form-control" name="data['+pkey+'][status]" required>'+
                                '<option value="Active">Active</option>'+
                                '<option value="Inactive">Inactive</option>'+
                            '</select>'+                                                        
                            '<label>Action</label><br>'+
                            '<a onclick="remove_price('+pkey+');" id="delete_price_'+pkey+'"><span class="badge bg-danger"><i class="fas fa-trash"></i></span></a>'+
                        '</td>'+
                    '</tr>';
                    $('#price_table').append(add_price);
    }
    function remove_price(key){
        $('#delete_price_'+key).closest('tr').remove();
    }
</script>


<script>
    function enterOffer(pkey){
        var price = $('#price_'+pkey).val();
        var offer_percentage = $('#offer_percentage_'+pkey).val();
        var offer_price = parseInt(price) - (parseInt(price) * parseInt(offer_percentage) / 100);
        if(offer_percentage > 0){
        $('#offer_price_'+pkey).val(offer_price);
            document.getElementById("start_date_"+pkey).required = true;
            document.getElementById("end_date_"+pkey).required = true;
        }else{
            $('#offer_price_'+pkey).val('');
            document.getElementById("start_date_"+pkey).required = false;
            document.getElementById("end_date_"+pkey).required = false;
        }
    }
</script>