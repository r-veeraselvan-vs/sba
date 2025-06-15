<div class="tab-pane @if($tab == 'slot') active @endif" id="slot">
    <div class="add-button">
        <button type="button" onclick="add_slot();" class="btn btn-primary btn-sm">Add Delivery Slot</button>
    </div>
    <br>
    <div>
        <form action="{{ route('delivery.area.slot.update') }}" method="post">
            @csrf
            <input type="hidden" name="id" value="{{ $area->id }}">
            <input type="hidden" name="tab" value="slot">
            <table id="slot_table" class="table">
                <tr id="-1">
                    <th>Days</th>
                    <th>Start</th>
                    <th>End</th>
                    <th>Deliveries</th>
                    <th>Status</th>
                </tr>
                @foreach($slots as $fkey => $slot)
                    <tr id="{{$fkey}}">
                        <td>                                                            
                            <input type="hidden" name="data[{{$fkey}}][id]" value="{{ $slot->id }}">
                            <input type="hidden" name="data[{{$fkey}}][delivery_area_id]" value="{{ $area->id }}">
                            <select class="form-control" name="data[{{$fkey}}][day]" required> 
                                <option value="Monday" @if('Monday' == $slot->day) selected @endif>Monday</option>
                                <option value="Tuesday" @if('Tuesday' == $slot->day) selected @endif>Tuesday</option>
                                <option value="Wednesday" @if('Wednesday' == $slot->day) selected @endif>Wednesday</option>
                                <option value="Thursday" @if('Thursday' == $slot->day) selected @endif>Thursday</option>
                                <option value="Friday" @if('Friday' == $slot->day) selected @endif>Friday</option>
                                <option value="Saturday" @if('Saturday' == $slot->day) selected @endif>Saturday</option>
                                <option value="Sunday" @if('Sunday' == $slot->day) selected @endif>Sunday</option>
                            </select>
                        </td>
                        <td>    
                            <input type="time" required class="form-control" name="data[{{$fkey}}][start]" value="{{ $slot->start }}" placeholder="Enter Start">
                        </td>
                        <td>
                            <input type="time" required class="form-control" name="data[{{$fkey}}][end]" value="{{ $slot->end }}" placeholder="Enter End">
                        </td>
                        <td>
                            <input type="number" required class="form-control" name="data[{{$fkey}}][deliveries]" value="{{ $slot->deliveries }}" placeholder="Enter Deliveries">
                        </td>
                        <td>
                            <select class="form-control" name="data[{{$fkey}}][status]" required>
                                <option value="Active" @if($slot->status == 'Active') selected @endif>Active</option>
                                <option value="Inactive" @if($slot->status == 'Inactive') selected @endif>Inactive</option>
                            </select>
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
    function add_slot(){
        var fkey = parseInt($('#slot_table tr:last-child').attr('id')) + 1;
        var display_order = fkey + 1;
        var add_slot = '<tr id="'+fkey+'">'+
                        '<td>'+
                            '<input type="hidden" name="data['+fkey+'][id]" value="0">'+
                            '<input type="hidden" name="data['+fkey+'][delivery_area_id]" value="{{ $area->id }}">'+
                            '<select class="form-control" name="data['+fkey+'][day]" required>'+
                                '<option value=""></option>'+
                                '<option value="Monday">Monday</option>'+
                                '<option value="Tuesday">Tuesday</option>'+
                                '<option value="Wednesday">Wednesday</option>'+
                                '<option value="Thursday">Thursday</option>'+
                                '<option value="Friday">Friday</option>'+
                                '<option value="Saturday">Saturday</option>'+
                                '<option value="Sunday">Sunday</option>'+
                            '</select>'+
                        '</td>'+
                        '<td>'+
                            '<input class="form-control" type="time" name="data['+fkey+'][start]" value="" placeholder="Enter Start" required>'+
                        '</td>'+
                        '<td>'+
                            '<input class="form-control" type="time" name="data['+fkey+'][end]" value="" placeholder="Enter End" required>'+
                        '</td>'+
                        '<td>'+
                            '<input class="form-control" type="number" name="data['+fkey+'][deliveries]" value="" required>'+
                        '</td>'+
                        '<td>'+
                            '<div style="display: flex;">'+
                                '<select class="form-control" name="data['+fkey+'][status]" required>'+
                                    '<option value="Active">Active</option>'+
                                    '<option value="Inactive">Inactive</option>'+
                                '</select>'+
                                '&nbsp; <a onclick="remove_slot('+fkey+');" id="delete_slot_'+fkey+'"><span class="badge bg-danger"><i class="fas fa-trash"></i></span></a>'+
                            '</div>'+
                        '</td>'+
                    '</tr>';
                    $('#slot_table').append(add_slot);
    }
    function remove_slot(key){
        $('#delete_slot_'+key).closest('tr').remove();
    }
</script>