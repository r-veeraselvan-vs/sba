@extends('layouts.app')
@section('content')
<div class="content-wrapper">
    <div class="content-header">
        <div class="container-fluid">
            <!-- Filter form -->
            <form method="GET" action="{{ route('order.list') }}">
                <div class="row" style="display: flex;">
                    <!-- Product Dropdown -->
                    <div class="col-md-3">
                        <div class="form-group ">
                            <h4 class="m-0 text-dark text-bold mt-4">Orders</h4>
                        </div>
                    </div>
                    <div class="col-md-3">
                        <div class="form-group" style="float:right;">
                            <label for="product_id">Select Product</label>
                            <select name="product_id" id="product_id" class="form-control select2">
                                <option value="">All Products</option>
                                @foreach($products as $product)
                                    <option value="{{ $product->id }}" {{ old('product_id', request('product_id')) == $product->id ? 'selected' : '' }}>
                                        {{ $product->name }}
                                    </option>
                                @endforeach
                            </select>
                        </div>
                    </div>
                    <!-- Date filters -->
                    <div class="col-md-2">
                        <div class="form-group">
                            <label for="start_date">Start Date</label>
                            <input type="date" class="form-control" name="start_date" id="start_date" value="{{ old('start_date', request('start_date')) }}">
                        </div>
                    </div>
                    <div class="col-md-2">
                        <div class="form-group">
                            <label for="end_date">End Date</label>
                            <input type="date" class="form-control" name="end_date" id="end_date" value="{{ old('end_date', request('end_date')) }}">
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
        <div class="status-counts mb-3 d-flex align-items-center ">
            <div class="btn-group mr-auto" role="group">
                <a href="{{ route('order.list') }}" 
                class="btn btn-outline-secondary {{ request('status') == null ? 'active' : '' }}">
                    All ({{ $totalCount }})
                </a>
                <a href="{{ route('order.list', ['status' => 'Order Received']) }}" 
                class="btn btn-outline-warning {{ request('status') == 'Order Received' ? 'active' : '' }}">
                    Pending payment ({{ $pendingPaymentCount }})
                </a>
                <a href="{{ route('order.list', ['status' => 'Delivered']) }}" 
                class="btn btn-outline-success {{ request('status') == 'Delivered' ? 'active' : '' }}">
                    Paid ({{ $paidCount }})
                </a>
                <a href="{{ route('order.list', ['status' => 'Not Applicable']) }}" 
                class="btn btn-outline-danger {{ request('status') == 'Not Applicable' ? 'active' : '' }}">
                    Abandoned ({{ $failedCount }})
                </a>
            </div>

            <form method="GET" action="{{ route('order.list') }}" id="filterForm">
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

    <!-- Orders Table -->
    <div class="col-md-12">
        <div class="card">
            <div class="card-body">
                <div class="table-responsive">
                    <table id="searchTable" class="table table-bordered">
                        <thead>
                            <tr>
                                <th>Sl No</th>
                                <th>Order No</th>
                                <th>Date</th>
                                <th>Customer Details</th>
                                <th>Items</th>
                                <th>Price</th>
                                <th>Payment Mode</th>
                                <th>Change</th>
                                <th>Status</th>
                                <th>Delivery Status</th>
                                <th>Action</th>
                            </tr>
                        </thead>
                        <tbody>
                            @foreach ($orders as $i => $order)
                            <tr>
                                <td>{{ $i+1 }}</td>
                                <td>{{ $order->id }}</td>
                                <td>
                                    @if($order->order_time)
                                        {{ \Carbon\Carbon::parse($order->order_time)->format('d/m/Y') }}
                                    @else
                                        {{ $order->created_at ? $order->created_at->format('d/m/Y') : '' }}
                                    @endif
                                </td>
                                <td>
                                    <p><i class="fa fa-user"></i>&nbsp; {{ ucfirst($order->user->name ?? 'N/A') }}</p>
                                    <p><i class="fa fa-phone"></i>&nbsp; {{ $order->user->mobile ?? 'N/A' }}</p>
                                </td>
                                <td>{{ $order->items }}</td>
                                <td>{{ $order->net_amount }}</td>
                                <td>{{ $order->payment_mode }}</td>
                                <td>{{ $order->change_required ?? 'No' }}</td>
                                <td>{{ $order->status }}</td>
                                <td>{{ $order->delivery_status }}</td>
                                <td>
                                    <a href="{{ route('order.detail', ['id' => $order->id, 'type' => 'view']) }}" class="badge bg-info">
                                        <i class="fas fa-eye"></i>
                                    </a>
                                    <a href="{{ route('order.detail', ['id' => $order->id, 'type' => 'edit']) }}" class="badge bg-danger">
                                        <i class="fas fa-edit"></i>
                                    </a>
                                </td>
                            </tr>
                            @endforeach
                        </tbody>
                    </table>
                </div>
                <div class="mt-3">
                    {{ $orders->links() }} <!-- This will render pagination links -->
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
        table = document.getElementById('searchTable'); // Adjust to your table ID
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

/* Add this CSS to your stylesheet */
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
