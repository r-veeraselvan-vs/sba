@extends('layouts.app')

@section('content')
<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <div class="content-header">
        <div class="container-fluid">
            <!-- Filter form -->
            <form method="GET" action="{{ route('order.customers') }}">
                <div class="row" style="display: flex;">
                    <!-- Product Dropdown -->
                    <div class="col-md-4">
                        <div class="form-group ">
                            <h4 class="m-0 text-dark text-bold mt-4">Customer</h4>
                        </div>
                    </div>
                    <!-- Date Filters -->
                    <div class="col-md-3">
                        <div class="form-group">
                            <label for="start_date">Start Date</label>
                            <input type="date" class="form-control" name="start_date" id="start_date" value="{{ request('start_date') }}">
                        </div>
                    </div>
                    <div class="col-md-3">
                        <div class="form-group">
                            <label for="end_date">End Date</label>
                            <input type="date" class="form-control" name="end_date" id="end_date" value="{{ request('end_date') }}">
                        </div>
                    </div>

                    <!-- Filter button -->
                    <div class="col-md-2 mt-4">
                        <div class="form-group text-center">
                            <button type="submit" class="btn btn-primary">Apply Filter</button>
                        </div>
                    </div>
                </div>
            </form>
        </div>
    </div>

    <!-- Status Counts -->
    <div class="container-fluid">
        <div class="status-counts mb-3 d-flex align-items-center">
            <div class="btn-group mr-auto" role="group">
                <a href="{{ route('order.customers') }}" class="btn btn-outline-secondary {{ request('status') == null ? 'active' : '' }}">
                    All ({{ $totalCount }})
                </a>
                <a href="{{ route('order.customers', ['status' => 'Active']) }}" class="btn btn-outline-success {{ request('status') == 'Active' ? 'active' : '' }}">
                    Active ({{ $activeCount }})
                </a>
                <a href="{{ route('order.customers', ['status' => 'Inactive']) }}" class="btn btn-outline-danger {{ request('status') == 'Inactive' ? 'active' : '' }}">
                    Inactive ({{ $inactiveCount }})
                </a>
            </div>

            <!-- Dropdown for selecting number of records per page -->
            <form method="GET" action="{{ route('order.customers') }}" id="filterForm">
                <div class="form-group d-flex ml-auto">
                    <!-- Dropdown for selecting number of records per page -->
                    <div class="input-group mr-3">
                        <select id="recordsPerPage" name="records_per_page" class="form-control" onchange="changeRecordsPerPage()" style="width: 80px; padding-right: 10px;">
                            <option value="25" {{ request('records_per_page') == 25 ? 'selected' : '' }}>25</option>
                            <option value="50" {{ request('records_per_page') == 50 ? 'selected' : '' }}>50</option>
                            <option value="75" {{ request('records_per_page') == 75 ? 'selected' : '' }}>75</option>
                            <option value="100" {{ request('records_per_page') == 100 ? 'selected' : '' }}>100</option>
                        </select>
                    </div>

                    <!-- Search Input -->
                    <div class="input-group">
                        <input type="text" id="searchInput" name="search" class="form-control search" placeholder="Search" value="{{ request('search') }}" oninput="filterTable()">
                        <div class="input-group-append">
                            <span class="input-group-text"><i class="fas fa-search"></i></span>
                        </div>
                    </div>
                </div>
            </form>
        </div>
    </div>

    <!-- Customers Table -->
    <div class="col-md-12">
        <div class="card">
            <div class="card-body">
                <div class="table-responsive">
                    <table id="customerTable" class="table table-bordered">
                        <thead>
                            <tr>
                                <th>Sl No</th>
                                <th>Name</th>
                                <th>Email</th>
                                <th>Mobile</th>
                                <th>Status</th>
                                <th>Action</th>
                            </tr>
                        </thead>
                        <tbody>
                            @foreach ($customers as $c => $customer)
                                <tr>
                                    <td>{{ $c + 1 }}</td>
                                    <td>{{ $customer->name }}</td>
                                    <td>{{ $customer->email }}</td>
                                    <td>{{ $customer->mobile }}</td>
                                    <td>
                                        <span class="right badge @if($customer->status == 'Active') badge-success @else badge-danger @endif">
                                            {{ $customer->status }}
                                        </span>
                                    </td>
                                    <td>
                                        <a href="{{ route('order.customer.view', ['id' => $customer->id]) }}">
                                            <span class="badge bg-info"><i class="fas fa-eye"></i></span>
                                        </a>
                                    </td>
                                </tr>
                            @endforeach
                        </tbody>
                    </table>
                </div>
                <div class="mt-3">
                    {{ $customers->links() }} <!-- This will render pagination links -->
                </div>
            </div>
        </div>
    </div>
</div>

<script>
    // Function to handle the number of records per page change
    function changeRecordsPerPage() {
        document.getElementById('filterForm').submit();  // Automatically submit the form
    }
    // Function to filter the table based on search input
    function filterTable() {
        var input, filter, table, tr, td, i, txtValue;
        input = document.getElementById('searchInput');
        filter = input.value.toLowerCase();
        table = document.getElementById('customerTable'); // Adjust to your table ID
        tr = table.getElementsByTagName('tr');

        for (i = 0; i < tr.length; i++) {
            td = tr[i].getElementsByTagName('td');
            if (td) {
                let match = false;
                for (let j = 0; j < td.length; j++) {
                    if (td[j]) {
                        txtValue = td[j].textContent || td[j].innerText;
                        if (txtValue.toLowerCase().indexOf(filter) > -1) {
                            match = true;
                            break;
                        }
                    }
                }
                tr[i].style.display = match ? "" : "none";
            }
        }
    }
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
