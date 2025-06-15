<div class="tab-pane" id="address">
    <div>
        <table class="table table_data">
            <thead>
                <tr>
                    <th>Sl.No</th>
                    <th>Short Name</th>
                    <th>Address</th>
                    <th>Building</th>
                    <th>Latitude</th>
                    <th>Longitude</th>
                </tr>
            </thead>
            <tbody>
                @foreach($customer->addresses as $i => $address)
                    <tr>
                        <td>{{ $i+1 }}</td>
                        <td>{{ $address->short_name }}</td>
                        <td>{{ $address->address }}</td>
                        <td>{{ $address->building_name }}</td>
                        <td>{{ $address->latitude }}</td>
                        <td>{{ $address->longitude }}</td>
                    </tr>
                @endforeach   
            </tbody>             
        </table>
    </div>
</div>