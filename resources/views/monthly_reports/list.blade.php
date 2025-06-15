@extends('layouts.app')

@section('content')

<div style="margin-top:3rem">
    <div class="row justify-content-center">
        <div class="col-12">
            <div class="panel panel-default">
                <div class="panel-header">
                    <div class="row" style="margin-top: -1rem !important;">
                        <div class="col-md-4">
                            <h4 class="page-header" style="margin-left: 10px; border-bottom: none">
                                <b>List of Payroll Generation</b>
                            </h4>
                        </div>
                        <div class="col-md-2 text-end" style="margin: 35px 0 20px;    border-bottom: none; margin-top: 3rem !important;">
                        <a onclick="exportTableToExcelList('payslipreport','report')" style="float:right;cursor: pointer;margin-right:10px" class="btn btn-primary"><i class="fa fa-download" aria-hidden="true" ></i> Download as Excel</a>   
                        </div>
                        <div class="col-md-6" style="margin: 35px 0 20px; border-bottom: none; margin-top: 3rem !important">
                                <div class="row">    
                                    <div class="col-md-4 form-group">
                                        <label for="name">Filter by name:</label>
                                        <input type="text" class="form-control" id="name" name="name" value="{{ request('name') }}">
                                    </div>
                                    <div class="col-md-4 form-group">
                                        <label for="month">Filter by month:</label>
                                        <select class="form-control" id="month" name="month">
                                            <option value="">All</option>
                                            @php
                                                $currentMonth = date('n');
                                                $currentYear = date('Y');
                                            @endphp

                                            {{-- Last 11 months --}}
                                            @for ($i = 11; $i >= 0; $i--)
                                                @php
                                                    $date = date('F Y', mktime(0, 0, 0, $currentMonth - $i, 1, $currentYear));
                                                @endphp
                                                <option value="{{ $date }}" {{ (request('month') == $date) ? 'selected' : '' }}>
                                                    {{ $date }}
                                                </option>
                                            @endfor
                                        </select>
                                    </div>
                                    <div class="col-md-2 form-group" style="margin-top: 25px;">
                                        <button  class="btn btn-secondary" onClick="search()">Filter</button>
                                    </div>
                                    <div class="col-md-2 form-group" style="margin-top: 25px;">
                                        <a href="{{ route('monthly_reports.list') }}" class="btn btn-secondary">Reset</a>
                                        
                                    </div>
                                </div>
                        </div>
                    </div>
                </div>
                <div class="panel-body" style="margin-top: -15px !important">
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
                                <table class="table table-striped table-hover table-bordered" id="payslipreport">
                                <thead>
                                    <tr>
                                        <th>Name</th>
                                        <th>PF of ESI</th>
                                        <th>Month</th>
                                        <th>No. of days Leave Taken (in days)</th>
                                        <th>Total OT (in hours) during Weekdays</th>
                                        <th>Holiday Work days</th>
                                        <th>Advance Received</th>
                                        <th colspan="3">Action</th>
                                    </tr>
                                </thead>
                                <tbody id="filter">
                                    @include('monthly_reports.filter')


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

<script type="text/javascript">
    function exportTableToExcelList(tableID, filename = '') {
    var downloadLink;
    var dataType = 'application/vnd.ms-excel';
    var tableSelect = document.getElementById(tableID);
    var tableHTML = '<table><thead><tr>';

    // Check if the tableSelect element exists
    if (tableSelect) {
        // Iterate through each column in the table and append the header to the tableHTML string
        for (var i = 0; i < tableSelect.rows[0].cells.length; i++) {
            if (tableSelect.rows[0].cells[i] && tableSelect.rows[0].cells[i].innerText !== 'Action') {
                tableHTML += '<th>' + tableSelect.rows[0].cells[i].innerHTML + '</th>';
            }
        }

        // Close the thead and open tbody
        tableHTML += '</tr></thead><tbody>';

        // Iterate through each row in the table and append the cells to the tableHTML string
        for (var i = 1; i < tableSelect.rows.length; i++) {
            tableHTML += '<tr>';
            for (var j = 0; j < tableSelect.rows[i].cells.length; j++) {
                if (tableSelect.rows[0].cells[j] && tableSelect.rows[0].cells[j].innerText !== 'Action') {
                    tableHTML += '<td>' + tableSelect.rows[i].cells[j].innerHTML + '</td>';
                }
            }
            tableHTML += '</tr>';
        }

        // Close the tbody and table tags
        tableHTML += '</tbody></table>';

        // Specify file name
        filename = filename ? filename + '.xls' : 'excel_data.xls';

        // Create download link element
        downloadLink = document.createElement("a");

        document.body.appendChild(downloadLink);

        if (navigator.msSaveOrOpenBlob) {
            var blob = new Blob(['\ufeff', tableHTML], {
                type: dataType
            });
            navigator.msSaveOrOpenBlob(blob, filename);
        } else {
            // Create a link to the file
            downloadLink.href = 'data:' + dataType + ', ' + tableHTML;

            // Setting the file name
            downloadLink.download = filename;

            // Triggering the function
            downloadLink.click();
        }
    } else {
        console.log("Table not found");
    }
}

</script>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">

    function search()
    {
        
        var month = document.getElementById('month');
        var name = document.getElementById('name');
        

        if(month != null) {   
                month = month.value;   
        } 
        if(name != null) {   
                name = name.value;   
        } 
       
       
        var url = '{{ route("monthly_reports.list") }}';

        $.ajax({
          type : 'get',
          url : url,
          data : {'month':month,'name':name},
          success:function(data){
            console.log(data);
           $('#filter').empty();
           $('#filter').html(data['records']);
           $('#hide').hide();
         } 
       });
    }
    </script>
@endsection