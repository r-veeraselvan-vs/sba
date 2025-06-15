@extends('layouts.app')

@section('content')
<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <div class="content-header">
        <div class="container-fluid">
            <!-- Filter form -->
            <form method="GET" action="{{ route('reports.index') }}">
                <div class="row">
                    <div class="col-md-5">
                        <div class="form-group">
                            <h4 class="m-0 text-dark text-bold mt-4">Customer Sales Analysis Report</h4>
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
                            <a href="{{ route('reports.index') }}" class="btn btn-secondary">Reset</a>
                        </div>
                    </div>
                    
                    <div class="col-md-1 mt-3">
                        <div class="btn-group mr-auto" role="group">
                            <div class="search_box d-flex">
                                <a href="{{ route('customer.download.pdf') }}" class="btn btn-success me-2">Download</a>
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
                        <a href="{{ route('customer.download.pdf') }}" class="btn btn-success me-2">Download</a>
                      </div>
                </div>

                <!-- Dropdown for selecting number of records per page -->
                <form id="rowForm" method="GET" action="{{ route('reports.index') }}">
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
                      @if(request()->get('month') == null)
                          <thead class="table-light">
                              <tr>
                                  <th rowspan="2" class="text-center align-middle">S.No</th>
                                  <th rowspan="2" class="text-center align-middle">Customer Name</th>
                                  <th colspan="4" class="text-center">Order Value</th>
                              </tr>
                              <tr>
                                  @for($i = 3; $i >= 0; $i--)
                                      <th class="text-center">{{ Carbon\Carbon::now()->subMonths($i)->format('M Y') }}</th>
                                  @endfor
                              </tr>
                          </thead>
                          <tbody>
                              @foreach($users as $i => $user)
                                  <tr>
                                      <td class="text-center">{{ $i + 1 }}</td>
                                      <td>{{ $user->name }}</td>
                                      @for($i = 3; $i >= 0; $i--)
                                          <td class="text-center">₹{{ \App\OrderDetail::where('user_id', $user->id)->whereMonth('created_at', Carbon\Carbon::now()->subMonths($i)->format('m'))->sum('amount') }}</td>
                                      @endfor
                                  </tr>
                              @endforeach
                              <tr class="table-secondary">
                                  <td colspan="2" class="text-center font-weight-bold">Total</td>
                                  @for($i = 3; $i >= 0; $i--)
                                      <td class="text-center font-weight-bold">₹{{ \App\OrderDetail::whereMonth('created_at', Carbon\Carbon::now()->subMonths($i)->format('m'))->sum('amount') }}</td>
                                  @endfor
                              </tr>
                          </tbody>
                      @else
                          <thead class="table-light">
                              <tr>
                                  <th class="text-center align-middle">S.No</th>
                                  <th class="text-center align-middle">Customer Name</th>
                                  <th class="text-center align-middle">Order Value</th>
                              </tr>
                          </thead>
                          <tbody>
                              @foreach($users as $i => $user)
                                  <tr>
                                      <td class="text-center">{{ $i + 1 }}</td>
                                      <td>{{ $user->name }}</td>
                                      <td class="text-center">₹{{ \App\OrderDetail::where('user_id', $user->id)->whereMonth('created_at', request()->get('month'))->sum('amount') }}</td>
                                  </tr>
                              @endforeach
                              <tr class="table-secondary">
                                  <td colspan="2" class="text-center font-weight-bold">Total</td>
                                  <td class="text-center font-weight-bold">₹{{ \App\OrderDetail::whereMonth('created_at', request()->get('month'))->sum('amount') }}</td>
                              </tr>
                          </tbody>
                      @endif
                  </table>
              </div>
              @if($users instanceof \Illuminate\Pagination\LengthAwarePaginator)
                  <div class="mt-3">
                      {{ $users->appends(request()->input())->links() }} <!-- This will render pagination links and keep the current filters in the query -->
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
