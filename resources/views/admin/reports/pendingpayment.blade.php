@extends('layouts.app')

@section('content')
<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <div class="content-header">
        <div class="container-fluid">
            <!-- Filter form -->
            <form method="GET" action="{{ route('reports.pendingpayment') }}">
                <div class="row">
                    <div class="col-md-5">
                        <div class="form-group">
                            <h4 class="m-0 text-dark text-bold mt-4">Product Sales Analysis Report</h4>
                        </div>
                    </div>
                  <!-- Date Filters -->
                    <div class="col-md-3 mt-3">
                        <div class="form-group ">
                            <select name="month" class="form-control">
                                @foreach (range(1, 12) as $m)
                                    <option value="{{ date('m', mktime(0, 0, 0, $m, 1)) }}" {{ date('m', mktime(0, 0, 0, $m, 1)) == request()->get('month') ? 'selected' : '' }}>
                                        {{ date('F', mktime(0, 0, 0, $m, 1)) }}
                                    </option>
                                @endforeach
                            </select>
                        </div>
                    </div>

                    <!-- Filter button -->
                    <div class="col-md-3 mt-3">
                        <div class="form-group">
                            <button type="submit" class="btn btn-primary">Apply Filter</button>
                            <a href="{{ route('reports.pendingpayment') }}" class="btn btn-secondary">Reset</a>
                        </div>
                    </div>

                    <div class="col-md-1 mt-3">
                        <div class="btn-group mr-auto" role="group">
                            <div class="search_box d-flex">
                                <a href="{{ route('daily.download.pdf') }}" class="btn btn-success me-2">Download</a>
                            </div>
                        </div>
                    </div>
                </div>
            </form>
        </div>

        <!-- Status Counts -->
        <div class="container-fluid">
            <div class="status-counts mb-3 d-flex align-items-center">
                <div class="btn-group mr-auto" role="group" style="display:hide; opacity: 0;">
                    <div class="search_box d-flex">
                        <a href="{{ route('pendingPayment.download.pdf') }}" class="btn btn-success me-2">Download</a>
                      </div>
                </div>

                <!-- Dropdown for selecting number of records per page -->
                <form id="rowForm" method="GET" action="{{ route('reports.pendingpayment') }}">
                  <div class="form-group d-flex ml-auto">
                      <!-- Dropdown for selecting number of records per page -->
                      <div class="input-group mr-3">
                          <select name="rows" class="form-control" onchange="document.getElementById('rowForm').submit();" style="width: 80px;">
                              <option value="all" {{ request('rows') == 'all' ? 'selected' : '' }}>All</option>
                              <option value="25" {{ request('rows') == 25 ? 'selected' : '' }}>25</option>
                              <option value="50" {{ request('rows') == 50 ? 'selected' : '' }}>50</option>
                              <option value="75" {{ request('rows') == 75 ? 'selected' : '' }}>75</option>
                              <option value="100" {{ request('rows') == 100 ? 'selected' : '' }}>100</option>
                          </select>
                      </div>

                      <!-- Search Input -->
                      <div class="input-group">
                          <input type="text" id="searchField" name="search" class="form-control search" placeholder="Search" value="{{ request('search') }}">
                          <div class="input-group-append">
                              <span class="input-group-text"><i class="fas fa-search"></i></span>
                          </div>
                      </div>
                  </div>
              </form>
            </div>
        </div>

      <div class="row mt-4">
          <div class="col-md-12">
              <!-- Table -->
              <div class="table-responsive">
                  <table class="table table-bordered">
                  <thead>
                    <tr> 
                        <th class="text-center">S.No</th> 
                        <th class="text-center">Product Name</th>
                        <th class="text-center">Price</th>
                        <th class="text-center">Payment Mode</th>
                         <th class="text-center">Date</th>
                    </tr> 
                </thead>
                <tbody id="timesheet_dailyreport">
                    @if (count($orders) > 0)
                        @foreach($orders as $order)
                            <?php
                            $detail = \App\OrderDetail::where('order_id', $order->id)->first();
                            if ($detail != null) {
                                $product = \App\Product::where('id', $detail->product_id)->first();
                            } else {
                                $product = null;
                            }
                            ?>
                            @if (request('date'))
                                @if ($order->created_at->format('Y-m-d') == request('date') && $product != null)
                                    <tr>
                                        <td class="text-center">{{ $loop->iteration }}</td>
                                        <td>{{ $product->name }}</td>
                                        <td class="text-center"><span style="font-family: DejaVu Sans; sans-serif;">&#8377;</span>&nbsp;{{$order->net_amount }}</td>
                                        <td class="text-center">{{ optional($order)->payment_mode }}</td>
                                        <td class="text-center">{{ optional($order)->status }}</td>
                                        <td class="text-center">{{ optional($order)->created_at ? optional($order)->created_at->format('d-m-Y') : '' }}</td>
                                    </tr>
                                @endif
                            @else
                                @if ($product != null)
                                    <tr>
                                        <td class="text-center">{{ $loop->iteration }}</td>
                                        <td>{{ $product->name }}</td>
                                        <td class="text-center"><span style="font-family: DejaVu Sans; sans-serif;">&#8377;</span>&nbsp;{{$order->net_amount }}</td>
                                        <td class="text-center">{{ optional($order)->payment_mode }}</td>
                                        <td class="text-center">{{ optional($order)->created_at ? optional($order)->created_at->format('d-m-Y') : '' }}</td>
                                    </tr>
                                @endif
                            @endif
                        @endforeach
                    @endif
                    <tr>
                        <td colspan="2">Total</td>
                        <?php
                        if (request('date')) {
                            $orderAmount = \App\Order::whereDate('created_at', request('date'))->sum('net_amount');
                        } else {
                            $orderAmount = $orders->sum('net_amount');
                        }
                        ?>
                        <td class="text-center">₹{{$orderAmount}}</td>
                    </tr>
                </tbody>
                                
                  </table>
              </div>
              @if($orders instanceof \Illuminate\Pagination\LengthAwarePaginator)
                  <div class="mt-3">
                      {{ $orders->appends(request()->input())->links() }} <!-- This will render pagination links and keep the current filters in the query -->
                  </div>
              @endif
          </div>
      </div>
  </div>
</div>
<script>
  // Function to handle the number of records per page change
  function changeRecordsPerPage() {
        document.getElementById('filterForm').submit();  // Automatically submit the form
    }
document.addEventListener('DOMContentLoaded', function () {
    const tableRows = document.querySelectorAll('tbody tr');
    const searchField = document.getElementById('searchField');
    const filterStatus = document.getElementById('filterStatus');

    searchField.addEventListener('input', function () {
        const searchValue = searchField.value.toLowerCase();
        tableRows.forEach(row => {
            const nameCol = row.querySelectorAll('td')[1].innerText.toLowerCase();
            row.style.display = nameCol.includes(searchValue) ? 'table-row' : 'none';
        });
    });

    filterStatus.addEventListener('change', function () {
        searchField.value = '';
        tableRows.forEach(row => row.style.display = 'table-row');
    });
});
</script>
<style>
.status-counts .btn-group {
    margin-right: 10px; /* Add spacing between the buttons and the search */
}

.form-control.search {
    border-radius: 5px;
}

.input-group-text {
    background-color: #f8f9fa; /* Optional: match button color */
    border: none;
}

.form-group .input-group {
    width: auto;
}

.status-counts .btn-group {
    margin-right: 10px; /* Add spacing between the buttons and the search */
}

.table-responsive {
    max-height: 642px; /* Set the height you desire */
    overflow-y: auto; /* Enable vertical scrolling */
}

.table thead th {
    position: sticky;
    top: 0;
    background-color: white; /* Ensure header has a background color */
    z-index: 10; /* Keep the header above the scrolling tbody */
}
</style>

@endsection
