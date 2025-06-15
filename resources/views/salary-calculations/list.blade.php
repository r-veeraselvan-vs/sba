@extends('layouts.app')

@section('content')

<div style="margin-top:3rem">
    <div class="row justify-content-center">
        <div class="col-12">
            <div class="panel panel-default">
                <div class="panel-header">
                    <div class="row" style="margin-top: -1rem !important;">
                        <div class="col-md-4">
                            <h4 class="page-header" style="margin-left: 10px; border-bottom: none"><b>List of Staff Salary Data</b></h4>
                        </div>
                        <div class="col-md-6 text-end" style="margin-top: 3rem !important;">
                            <div class="row">
                                <div class="col-md-8">
                                    <input type="text" id="search-input" class="form-control" placeholder="Search by name or bank" value="{{ old('search') }}">
                                </div>
                               <!-- <div class="col-md-4" style="margin-left: -1px;">
                                    <button type="button" id="search-button" class="btn btn-primary"></button>
                                </div>-->
                            </div>
                        </div>
                        <div class="col-md-2 text-end" style="margin: 35px 0 20px;    border-bottom: none; margin-top: 3rem !important;"></div>
                    </div>
                </div>

                <div class="panel-body" style="margin-top: -15px !important;">
                     @if( Session::has( 'success' ))
          <div class="alert alert-success alert-dismissible" role="alert">
  <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
  {{ Session::get('success') }}
</div>
        @endif
                  
                    <div class="container-xl">
                        <div class="table-responsive">
                            <div class="table-wrapper">
                                <div class="table-title"></div>
                                <table class="table table-striped table-hover table-bordered">
        <thead>
            <tr>
                <th>Name</th>
                <th>Gross Salary</th>
                <th>Basic</th>
                <th>DA</th>
                <th>Other Allowances</th>
                <th>HRA</th>
                <th>UAN No.</th>
                <th>Bank</th>
                <th>Account No.</th>
                <th>IFSC Code</th>
                <th>Action</th>
            </tr>
        </thead>
        <tbody>
            @foreach($salaryCalculations as $salaryCalculation)
                <tr>
                    <?php 
                        $staff =  \App\Models\Staff::where('id',$salaryCalculation->staff_id)->first();
                    ?>
                    @if($staff!=null)
                        <td>{{ $staff->name }}</td>
                    @else
                        <td>-</td>
                    @endif
                    <td>{{ ($salaryCalculation != null) ? $salaryCalculation->gross_salary : '-' }}</td>
                    <td>{{ ($salaryCalculation->basic != null) ? $salaryCalculation->basic : '-'  }}</td>
                    <td>{{ ($salaryCalculation->da != null) ? $salaryCalculation->da : '-'  }}</td>
                    <td>{{ ($salaryCalculation->other_allowances != null) ? $salaryCalculation->other_allowances : '-'  }}</td>
                    <td>{{ ($salaryCalculation->hra != null) ? $salaryCalculation->hra : '-'  }}</td>
                    <td>{{ ($salaryCalculation->pan_no != null) ? $salaryCalculation->pan_no : '-'  }}</td>
                    <td>{{ ($salaryCalculation != null) ? $salaryCalculation->bank : '-'  }}</td>
                    <td>{{ ($salaryCalculation != null) ? $salaryCalculation->account_no : '-'  }}</td>
                    <td>{{ ($salaryCalculation != null) ? $salaryCalculation->ifsc_code : '-'  }}</td>
                    <td>
                        <a href="{{ route('salary-calculations.edit', ['id' => $salaryCalculation->id ]) }}" ><i class="fa fa-edit" style="font-size:20px;color:blue"></i></a>&nbsp       
                        <a onclick="DeleteSalaryCalculation('{{$salaryCalculation->id}}')"><i class="fa fa-trash" style="font-size:20px;color:red"></i></a>
                    </td>
                </tr>
            @endforeach
        </tbody>
                                </table>
                            </div>
                        </div>
                    </div>                
                </div>
            </div>
        </div>
    </div>
</div>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
    $(document).ready(function() {
        $('#search-button').click(function() {
            search();
        });

        $('#search-input').on('input', function() {
            search();
        });

        function search() {
            var searchQuery = $('#search-input').val().trim().toLowerCase();
            $('tbody tr').each(function() {
                var name = $(this).find('td:first-child').text().toLowerCase();
                var bank = $(this).find('td:nth-child(8)').text().toLowerCase();
                if (name.includes(searchQuery) || bank.includes(searchQuery) ) {
                    $(this).show();
                } else {
                    $(this).hide();
                }
            });
        }
    });
</script>

@endsection