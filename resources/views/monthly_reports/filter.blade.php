@if(count($monthlyReports) > 0)
    @foreach($monthlyReports as $monthlyReport)
                  <tr>
                    <?php 
                        $staff =  \App\Models\Staff::where('id', $monthlyReport->staff_id)->first();
                        $pay =  \App\Models\PaySlip::where('staff_id', $monthlyReport->staff_id)->where('month', $monthlyReport->month)->first();    
                        $paywithPF =  \App\Models\Payslipwithpf::where('staff_id', $monthlyReport->staff_id)->where('month', $monthlyReport->month)->first();    
                    ?>
                    @if($staff != null)
                        <td>{{ $staff->name }}</td>
                    @else
                        <td>-</td>
                    @endif
                    @if($staff != null)
                        <td>{{ $staff->pf_or_esi }}</td>
                    @else
                        <td>-</td>
                    @endif
                    <td>{{ $monthlyReport->month }}</td>
                    <td>{{ $monthlyReport->leave_days }}</td>
                    <td>{{ $monthlyReport->ot_hours }}</td>
                    <td>{{ $monthlyReport->holiday_work_days }}</td>
                    <td>{{ $monthlyReport->advance_received }}</td>
                    <td>
                        <a href="{{ route('monthly_reports.edit', ['id' => $monthlyReport->id ]) }}"><i class="fa fa-edit" style="font-size:20px;color:blue"></i></a>&nbsp;       
                        <a onclick="DeleteMonthlyReports('{{$monthlyReport->id}}', '{{$monthlyReport->month}}')">
                            <i class="fa fa-trash" style="font-size:20px;color:red"></i>
                        </a>
                    </td>
                    <td>
                        @if($staff->pf_or_esi == 'Yes' && $paywithPF != null)
                            <a href="{{ route('download.payslipwithpf', ['staff_id' => $staff->id ,'id' => $monthlyReport->id, 'month' => $monthlyReport->month ]) }}" type="button" class="btn btn-primary">Download</a>
                        @elseif($staff->pf_or_esi == 'No' && $pay != null)                                 
                            <a href="{{ route('download.payslip', ['staff_id' => $staff->id ,'id' => $monthlyReport->id, 'month' => $monthlyReport->month ]) }}" type="button" class="btn btn-primary">Download</a>
                        @else
                            -
                        @endif
                    </td>
                </tr>
         
    @endforeach
@endif

@if(count($salaryCalculations) > 0)
    @foreach($salaryCalculations as $salaryCalculation)
        <tr id="hide">
            <?php 
                $staff =  \App\Models\Staff::where('id', $salaryCalculation->staff_id)->first();
            ?>
            @if($staff != null)
                <td>{{ $staff->name }}</td>
            @else
                <td>-</td>
            @endif
            @if($staff != null)
                <td>{{ $staff->pf_or_esi }}</td>
            @else
                <td>-</td>
            @endif
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td>
                <a href="{{ route('monthly_reports.create', ['id' => $staff->id]) }}">
                    <button class="btn btn-primary">Add Data</button>
                </a>
            </td>
        </tr>
    @endforeach
@endif