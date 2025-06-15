<div class="tab-pane @if($tab == 'edit') active @endif" id="edit">
    <div>
        <form role="form" method="post" action="{{ route('delivery.area.update') }}">
            <div class="row">
                @csrf
                <div class="col-md-6">
                    <input type="hidden" name="id" value="{{ $area->id }}">
                    <input type="hidden" name="tab" value="{{ $tab }}">
                    <div class="card-body">

                        <div class="form-group">
                            <label for="exampleInputEmail1">Pin Code</label>
                            <input type="text" required class="form-control" name="pin_code"
                                value="{{ $area->pin_code }}" placeholder="Enter Pin Code">
                        </div>

                        <div class="form-group">
                            <label for="exampleInputEmail1">Area</label>
                            <input type="text" required class="form-control" name="area" value="{{ $area->area }}"
                                placeholder="Enter Area">
                        </div>

                        <div class="form-group">
                            <label for="exampleInputEmail1">Delivery Charge</label>
                            <input type="number" required class="form-control" name="delivery_charge" min="0"
                                value="{{ $area->delivery_charge }}" placeholder="Enter Delivery Charge">
                        </div>

                    </div>
                    <div class="card-footer">
                        <button type="submit" class="btn btn-primary">Update</button>
                    </div>
            </div>
                <div class="col-md-6">
                    <div class="card-body">

                        <div class="form-group">
                            <label for="exampleInputEmail1">Days</label>
                            <table class="table">
                                <tr>
                                    <th class="head-th">SUN</th>
                                    <th class="head-th">MON</th>
                                    <th class="head-th">TUE</th>
                                    <th class="head-th">WED</th>
                                    <th class="head-th">THU</th>
                                    <th class="head-th">FRI</th>
                                    <th class="head-th">SAT</th>
                                </tr>
                                <tr>
                                    <td>
                                        <input type="checkbox" class="form-control" name="days[sunday]"
                                            @if(in_array('sunday', $area->days->pluck('day')->toArray())) checked
                                        @endif>
                                    </td>
                                    <td>
                                        <input type="checkbox" class="form-control" name="days[monday]"
                                            @if(in_array('monday', $area->days->pluck('day')->toArray())) checked
                                        @endif>
                                    </td>
                                    <td>
                                        <input type="checkbox" class="form-control" name="days[tuesday]"
                                            @if(in_array('tuesday', $area->days->pluck('day')->toArray())) checked
                                        @endif>
                                    </td>
                                    <td>
                                        <input type="checkbox" class="form-control" name="days[wednesday]"
                                            @if(in_array('wednesday', $area->days->pluck('day')->toArray())) checked
                                        @endif>
                                    </td>
                                    <td>
                                        <input type="checkbox" class="form-control" name="days[thursday]"
                                            @if(in_array('thursday', $area->days->pluck('day')->toArray())) checked
                                        @endif>
                                    </td>
                                    <td>
                                        <input type="checkbox" class="form-control" name="days[friday]"
                                            @if(in_array('friday', $area->days->pluck('day')->toArray())) checked
                                        @endif>
                                    </td>
                                    <td>
                                        <input type="checkbox" class="form-control" name="days[saturday]"
                                            @if(in_array('saturday', $area->days->pluck('day')->toArray())) checked
                                        @endif>
                                    </td>
                                </tr>
                            </table>
                        </div>

                        <div class="form-group">
                            <label for="exampleInputPassword1">Status</label>
                            <select class="form-control" name="status">
                                <option value="Active" @if('Active'==$area->status) selected @endif>Active</option>
                                <option value="Inactive" @if('Inactive'==$area->status) selected @endif>Inactive
                                </option>
                            </select>
                        </div>
                    </div>
                </div>
            </div>
        </form>
    </div>
</div>
