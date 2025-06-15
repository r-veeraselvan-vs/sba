@extends('layouts.app')

@section('content')

<div style="margin-top:1rem">
<div class="row justify-content-center">
    @if (session('success'))
    <div class="alert alert-success alert-dismissible show" role="alert">
        <strong>{{ session('success') }}</strong>
        <button type="button" class="close" data-dismiss="alert" aria-label="Close">
            <span aria-hidden="true">&times;</span>
        </button>
    </div>
    @endif
</div>
</div>

<div style="margin-top:1rem">
    <div class="row justify-content-center">
        <div class="col-12">
            <div class="panel panel-default">
                <div class="panel-header">
                    <div class="row" style="margin-top: 2rem !important;" id="heading">
                        <div class="col-md-3 text-center"><b>List of Showroom Day Book</b></div>
                        <div class="col-md-3 text-center">

<form method="GET" action="{{ route('daybook.list') }}" id="daybook-form">
    @csrf
    <div class="row input-group">
        <div class="col-md-6">
            <label for="start-date">Start Date:</label>
            <input id="start-date" type="date" class="form-control" name="start_date" value="{{request()->get('start_date')}}">
        </div>
        <div class="col-md-6">
            <label for="end-date">End Date:</label>
            <input id="end-date" type="date" class="form-control" name="end_date" value="{{request()->get('end_date')}}">
        </div>
    </div>
</form>

                        </div>
                        <div class="col-md-6 row text-center">
                          <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModal">Denominations</button>
                          <a onclick="exportTableToExcel('myTable','report')" class="btn btn-primary"><i class="fa fa-download" aria-hidden="true" ></i> Download as Excel</a>
                          <button type="button" class="btn btn-primary" onclick="customPrint()">Print</button>
                          <a href="{{route('daybook.create', ['date' => request()->get('start_date') ])}}"><button class="btn btn-primary">Add Entry</button></a> 
                        </div>
                    </div>  
                   
                </div>
<!-- Modal -->
<div id="myModal" class="modal fade" role="dialog">
  <div class="modal-dialog">

    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4 class="modal-title"> </h4>
      </div>
      <div class="modal-body">
          <?php 
            $daybook1 = \App\Models\DayBook::whereBetween('date',[request()->get('start_date'),request()->get('end_date')])->pluck('id');
            $denominations = \App\Models\Denomination::WhereIn('front_office_daybook_id',$daybook1);
            $denomination_1 = $denominations->sum('denomination_1');
            $denomination_2 = $denominations->sum('denomination_2');
            $denomination_5 = $denominations->sum('denomination_5');
            $denomination_10 = $denominations->sum('denomination_10');
            $denomination_20 = $denominations->sum('denomination_20');
            $denomination_50 = $denominations->sum('denomination_50');
            $denomination_100 = $denominations->sum('denomination_100');
            $denomination_200 = $denominations->sum('denomination_200');
            $denomination_500 = $denominations->sum('denomination_500');
            $denomination_2000 = $denominations->sum('denomination_2000');
          ?>
          <!-- Denomination form will be displayed here -->
           <div class="row">
                        <div class="col-md-6">
                            <div class="form-group">
                            <label for="denomination-1">Available Denomination</label>
                           </div>
                        </div>
                         <div class="col-md-6">
                            <label for="denomination-1">Available Count</label>
                         </div>
                    </div>
                    @if($denomination_500!=0)
                      <div class="row">
                        <div class="col-md-6">
                            <div class="form-group">
                             <input type="number" class="form-control denominationsAmount" id="amount-500"  min="0" name="amount[5]" value="500" readonly>
                          </div>
                        </div>
                         <div class="col-md-6">
                         <input type="number" class="form-control denominations" id="denomination-500"  min="0" name="denomination_500"  readonly value="{{ $denomination_500}}">
                        </div>
                    </div>
                    @endif
                    @if($denomination_200!=0)
                    
                      <div class="row">
                        <div class="col-md-6">
                            <div class="form-group">
                             <input type="number" class="form-control denominationsAmount" id="amount-200" min="0" name="amount[4]" value="200" readonly>
                          </div>
                        </div>
                         <div class="col-md-6">
                         <input type="number" class="form-control denominations" id="denomination-200" min="0"  name="denomination_200"  readonly value="{{ $denomination_200}}">
                        </div>
                    </div>
                    @endif
                    @if($denomination_100!=0)
                      <div class="row">
                        <div class="col-md-6">
                            <div class="form-group">
                             <input type="number" class="form-control denominationsAmount" id="amount-100" min="0" name="amount[3]" value="100" readonly>
                          </div>
                        </div>
                         <div class="col-md-6">
                         <input type="number" class="form-control denominations" id="denomination-100" min="0"  name="denomination_100"  readonly value="{{ $denomination_100}}">
                        </div>
                    </div>
                     @endif
                      @if($denomination_50!=0)
                       <div class="row">
                        <div class="col-md-6">
                            <div class="form-group">
                             <input type="number" class="form-control denominationsAmount" id="amount-50" min="0" name="amount[2]" value="50" readonly>
                          </div>
                        </div>
                         <div class="col-md-6">
                         <input type="number" class="form-control denominations" id="denomination-50" min="0" name="denomination_50"  readonly value="{{ $denomination_50}}">
                        </div>
                    </div>
                     @endif
                    @if($denomination_20!=0)
                     <div class="row">
                        <div class="col-md-6">
                            <div class="form-group">
                             <input type="number" class="form-control denominationsAmount" id="amount-20" name="amount[1]" value="20" readonly>
                          </div>
                        </div>
                         <div class="col-md-6">
                         <input type="number" class="form-control denominations" id="denomination-20" min="0" name="denomination_20" readonly value="{{$denomination_20}}">
                        </div>
                    </div>
                    @endif
                    @if($denomination_10!=0)
                      <div class="row">
                        <div class="col-md-6">
                            <div class="form-group">
                             <input type="number" class="form-control denominationsAmount" id="amount-10" name="amount[0]" value="10" readonly>
                          </div>
                        </div>
                         <div class="col-md-6">
                         <input type="number" class="form-control denominations" id="denomination-10" min="0" name="denomination_10" value="{{ $denomination_10}}"  readonly >
                        </div>
                    </div>
                     @endif
                    @if($denomination_5!=0)
                     <div class="row">
                        <div class="col-md-6">
                            <div class="form-group">
                             <input type="number" class="form-control denominationsAmount" id="amount-5" name="amount[9]" value="5" readonly>
                          </div>
                        </div>
                         <div class="col-md-6">
                         <input type="number" class="form-control denominations" id="denomination-5" min="0" name="denomination_5" value="{{ $denomination_5}}"  readonly >
                        </div>
                    </div>
                     @endif
                    @if($denomination_2!=0)
                      <div class="row">
                        <div class="col-md-6">
                            <div class="form-group">
                             <input type="number" class="form-control denominationsAmount" id="amount-2" name="amount[8]" value="2" readonly>
                          </div>
                        </div>
                         <div class="col-md-6">
                         <input type="number" class="form-control denominations" id="denomination-2" min="0" name="denomination_2" value="{{ $denomination_2 }}"  readonly >
                        </div>
                    </div>
                     @endif
                    @if($denomination_1!=0)
                    <div class="row">
                        <div class="col-md-6">
                            <div class="form-group">
                             <input type="number" class="form-control denominationsAmount" id="amount-1" name="amount[7]" value="1" readonly>
                          </div>
                        </div>
                         <div class="col-md-6">
                         <input type="number" class="form-control denominations" id="denomination-1" min="0" name="denomination_1" value="{{$denomination_1}}"  readonly >
                        </div>
                    </div>
                     @endif
                   
                   
                  
                     
                    
                  
                  
                  
                     
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
      </div>
    </div>

  </div>
</div>
                <div class="panel-body">
                     <div style="display:none" id="heading_logo">
                      <img src="https://youthechef.com/logo/DFLogo1.webp" width="100px">
                         <div id="heading_text"><b  style="text-align:center;margin-top:1rem">List of Showroom Day Book</b></div>
                        </div>
                    <div class="container-xl">
                        <div class="table-responsive">
                            <div class="table-wrapper">
                                <div class="table-title"></div>
<table id="myTable" class="table table-striped table-hover table-bordered">
    <thead>
        <tr>
            <th>S.NO</th>
            <th>Date</th>
            <th>Heading</th>
            <th>Subheading</th>
            <th>Description 1</th>
            <th>Description 2</th>
            <th>Debit</th>
            <th>Credit</th>
            <th>Total</th> <!-- New column -->
            <th>Action</th>
        </tr>
    </thead>
    <tbody>
        <!-- Table rows -->
        @php
            $i=1;
            $totalCredit = 0;
            $totalDebit = 0;
            $totalAmount = 0;
            $total = 0;
        @endphp
        @if (count($daybook) > 0)
            @foreach ($daybook as $entry)
                @php
                    $entryDate = \Carbon\Carbon::parse($entry->date);
                    $startDate = \Carbon\Carbon::parse(request()->get('start_date', $entry->date));
                    $endDate = \Carbon\Carbon::parse(request()->get('end_date', $entry->date));
                @endphp
                     <tr>
                        <td>{{ $i }}</td> 
                        <td>{{ $entry->date }}</td>
                        <?php
                            $headings = \App\Models\heading::where('id',$entry->heading_id)->first();
                        ?>
                        @if($headings!=null)
                            <td>{{ $headings->name }}</td>
                        @else
                            <td>-</td>
                        @endif
                        <?php 
                            $subheadings = \App\Models\subheading::where('id',$entry->subheading_id)->first();
                        ?>
                        @if($subheadings!=null)
                            <td>{{ $subheadings->name }}</td>
                        @else
                            <td>-</td>
                        @endif
                        <td>{{ $entry->description_1 }}</td>
                        <td>{{ $entry->description_2 }}</td>
                        @if($entry->type=="D")
                            <td>{{ $entry->amount }}</td>
                        @else
                            <td>-</td>
                        @endif
                        @if($entry->type=="C")
                            <td>{{ $entry->amount }}</td>
                        @else
                            <td>-</td>
                        @endif
                        <td>
                            <?php
                                if ($entry->type == "C") {
                                    $totalAmount += $entry->amount;
                                    $total += $entry->amount;
                                } elseif ($entry->type == "D") {
                                    $totalAmount -= $entry->amount;
                                    $total -= $entry->amount;
                                }
                            if ($totalAmount > 0){
                                echo $totalAmount;
                            } else {
                                echo -($totalAmount);
                            }

                            ?>
                        </td>
                        <td>
                            <a href="{{ route('daybook.edit', ['id' => $entry->id ]) }}" ><i class="fa fa-edit" style="font-size:20px;color:blue"></i></a>&nbsp
                            <a onclick="deleteDaybook('{{$entry->id}}')"><i class="fa fa-trash" style="font-size:20px;color:red"></i></a>
                        </td>
                    </tr>
                    @php
                        $i++;
                        if($entry->type=="D"){
                            $totalDebit += $entry->amount;
                        } else {
                            $totalCredit += $entry->amount;
                        }
                    @endphp
             @endforeach
        @endif
        <!-- Bottom total row -->
        <tr>
            <td colspan="6" style="text-align: right;"><strong>Total:</strong></td>
            <td>{{ $totalDebit }}</td>
            <td>{{ $totalCredit }}</td>
            <td>
                <?php

                    if ($totalAmount > 0){
                        echo $totalAmount;
                    } else {
                        echo -($totalAmount);
                    }
                    $total = $totalCredit - $totalDebit;
                
session(['total' => $total]);
                ?>
            </td> 
            <td></td>
        </tr>
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

<script>
function customPrint() {
    var logoSrc = "https://youthechef.com/logo/DFLogo1.webp";
    document.getElementById("heading_logo").style.display = 'flex';
     document.getElementById("heading_logo").style.flexDirection = "row"; 
         document.getElementById("heading_text").style.marginLeft = "200px"; 
          document.getElementById("heading_text").style.marginTop = "50px"; 
          document.getElementById("heading_logo").style.marginTop = "-20px"; 
           document.getElementById("heading_logo").style.marginBottom = "20px"; 
      window.print();
       document.getElementById("heading_logo").style.display = 'none';

}
</script>


<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<script>
$(document).ready(function() {
    var startDate = document.getElementById('start-date').value;
    var endDate = document.getElementById('end-date').value;
 
});

document.getElementById('start-date').addEventListener('change', function() {
    document.getElementById('daybook-form').submit();
});

document.getElementById('end-date').addEventListener('change', function() {
    document.getElementById('daybook-form').submit();
});
</script>
 <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx" crossorigin="anonymous"></script>

<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/xlsx/0.17.0/xlsx.full.min.js"></script>

<script type="text/javascript">
    function exportTableToExcel(tableID, filename = '') {
        var tableSelect = document.getElementById(tableID);
        var ws = XLSX.utils.table_to_sheet(tableSelect);
        var wb = XLSX.utils.book_new();
        XLSX.utils.book_append_sheet(wb, ws, 'Sheet1');

        // Calculate column widths based on content size
        var range = XLSX.utils.decode_range(ws['!ref']);
        var colWidths = [];
        for (var C = range.s.c; C <= range.e.c; ++C) {
            var maxCellLength = 0;
            for (var R = range.s.r; R <= range.e.r; ++R) {
                var cell = ws[XLSX.utils.encode_cell({ r: R, c: C })];
                if (cell && cell.v) {
                    var cellText = XLSX.utils.format_cell(cell);
                    maxCellLength = Math.max(maxCellLength, cellText.length);
                }
            }
            colWidths[C] = maxCellLength;
        }

        // Set column widths
        ws['!cols'] = colWidths.map(function (w) { return { width: w + 2 }; });

        // Specify file name
        filename = filename ? filename + '.xlsx' : 'excel_data.xlsx';

        // Save the file
        XLSX.writeFile(wb, filename);
    }
</script>


<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/xlsx/0.17.0/xlsx.full.min.js"></script>

@endsection