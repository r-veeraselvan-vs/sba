<div class="tab-pane" id="reports">
    <div>
        <table id="example41" class="table">
            <thead>
                <tr> 
                    <th>Sl No</th>
                    <th>Rider Name</th>
                    <th>Vehicle Type</th>
                    <th>Delivery Location</th>
                    <th>Delivery Fare</th>
                    <th>Request Time</th>
                    <th>Status</th>
                    <th>Cancelled By</th>
                    <th>Action</th>
                </tr>
            </thead>
            <tbody>
                @foreach ($reports as $i => $report)
                    @if(@$report->booking)
                        <tr>
                            <td>{{ $i+1 }}</td>
                            <td>{{ ucfirst(@$report->booking->rider->user->name) }}</td>
                            <td>{{ $report->vehicle->name }}</td>
                            <td>{{ @$report->delivery_location->address }}</td>
                            <td>{{ number_format($report->delivery_fare, 2) }}</td>
                            <td>{{ $report->request_time }}</td>
                            <td>{{ @$report->booking->status }}</td>
                            <td>{{ @$report->booking->cancelled_by }}</td>
                            <td>
                                <a href="{{ route('report.view', ['id'=> $report->booking->id ]) }}"><span class="badge bg-info"><i class="fas fa-eye"></i></span></a>
                            </td>
                        </tr>
                    @endif    
                @endforeach
            </tbody>
        </table>
    </div>
</div>