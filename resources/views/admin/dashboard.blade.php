@extends('layouts.app')
@section('content')
<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <div class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h4 class="m-0 text-dark text-bold">Dashboard</h4>
          </div>
        </div>
      </div>
    </div>

    <!-- Main content -->
    <section class="content">
      <div class="container-fluid">
        <!-- Dashboard metrics -->
        <div class="row">
          <!-- Revenue Box -->
          <div class="col-lg-3 col-6">
            <div class="small-box bg-info">
              <div class="inner">
                <h3>{{ $order_value }}</h3>
                <p>Revenue</p>
              </div>
              <div class="icon">
                <i class="ion ion-bag"></i>
              </div>
              <span class="small-box-footer">{{ $revenue_change_percentage }}% than last week</span>
            </div>
          </div>

          <!-- Orders Box -->
          <div class="col-lg-3 col-6">
            <div class="small-box bg-success">
              <div class="inner">
                <h3>{{ $orders_completed_count }}</h3>
                <p>Orders</p>
              </div>
              <div class="icon">
                <i class="ion ion-stats-bars"></i>
              </div>
              <span class="small-box-footer">{{ $orders_change_percentage }}% than last month</span>
            </div>
          </div>

          <!-- Customers Box -->
          <div class="col-lg-3 col-6">
            <div class="small-box bg-warning">
              <div class="inner">
                <h3>{{ $customers_count }}</h3>
                <p>Customers</p>
              </div>
              <div class="icon">
                <i class="ion ion-person-add"></i>
              </div>
              <span class="small-box-footer">{{ $customers_change_percentage }}% than yesterday</span>
            </div>
          </div>

          <!-- Delivered Orders -->
          <div class="col-lg-3 col-6">
            <div class="small-box bg-danger">
              <div class="inner">
                <h3>{{ $delivered_count }}</h3>
                <p>Delivered</p>
              </div>
              <div class="icon">
                <i class="ion ion-pie-graph"></i>
              </div>
              <span class="small-box-footer">{{ $delivered_change_percentage }}% than yesterday</span>
            </div>
          </div>
        </div>

        <div class="card">
          <div class="card-header">
            <h3 class="card-title"><b>Chart Overview</b></h3>
            <div class="card-tools">
              <div class="btn-group">
                <button class="btn btn-primary" id="showWeek">Week</button>
                <button class="btn btn-secondary" id="showMonth">Month</button>
                <button class="btn btn-success" id="showYear">Year</button>
              </div>
            </div>
          </div>

          <!-- Charts Section -->
          <div class="row">
            <!-- Sales Overview Chart -->
            <div class="col-lg-6">
              <div class="card">
                <div class="card-body">
                  <canvas id="salesOverviewChart"></canvas>
                </div>
              </div>
            </div>

            <!-- Daily Customers Chart -->
            <div class="col-lg-6">
              <div class="card">
                <div class="card-body">
                  <canvas id="dailyCustomersChart"></canvas>
                </div>
              </div>
            </div>
          </div>
        </div>

        <!-- Orders Table -->
        <div class="row">
            <div class="col-lg-12">
                <div class="card">
                    <div class="card-header">
                        <h3 class="card-title"><b>Orders</b></h3>
                        <div class="card-tools">
                            <!-- Filter Buttons -->
                            <form method="GET" action="{{ route('dashboard') }}" class="form-inline">
                              <div class="btn-group">
                                  @foreach($statuses as $status)
                                      <button type="submit" name="status" value="{{ $status }}" class="btn {{ request('status') === $status ? 'btn-success' : 'btn-primary' }}">
                                          {{ $status }}
                                      </button>
                                  @endforeach
                              </div>
                            </form>
                        </div>
                    </div>
                    <!-- /.card-header -->
                    <div class="card-body">
                        <table class="table table-striped table-bordered">
                            <thead>
                                <tr>
                                    <th>Order No</th>
                                    <th>Customer</th>
                                    <th>Order Date</th>
                                    <th>Status</th>
                                    <th>Amount</th>
                                </tr>
                            </thead>
                            <tbody>
                                @foreach($orders as $order)
                                <tr>
                                    <td>{{ $order->id }}</td>
                                    <td>{{ $order->user->name }}</td>
                                    <td>{{ $order->created_at->format('d/m/Y') }}</td>
                                    <td>
                                        @if ($order->delivery_status == 'Delivered')
                                            <span class="badge badge-success">Delivered</span>
                                        @elseif ($order->delivery_status == 'Order Received')
                                            <span class="badge badge-info">Pending</span>
                                        @elseif ($order->delivery_status == 'Cancelled')
                                            <span class="badge badge-danger">Cancelled</span>
                                        @else
                                            <span class="badge badge-warning">{{ $order->delivery_status }}</span>
                                        @endif
                                    </td>
                                    <td>{{ $order->net_amount }}</td>
                                </tr>
                                @endforeach
                            </tbody>
                        </table>
                    </div>
                    <!-- /.card-body -->
                </div>
                <!-- /.card -->
            </div>
        </div>

        <!-- Locations Table -->
        <div class="row mt-4">
            <div class="col-lg-6">
                <div class="card">
                    <div class="card-header">
                        <h3 class="card-title"><b>Top 5 Customers by Location</b></h3>
                    </div>
                    <div class="card-body">
                        <table class="table table-striped table-bordered">
                            <thead>
                                <tr>
                                    <th>SL No</th>
                                    <th>User</th>
                                    <th>City</th>
                                    <th>Pin Code</th>
                                    <th>Purchased Count</th>
                                </tr>
                            </thead>
                            <tbody>
                                @foreach($locations as $key => $location)
                                <tr>
                                    <td>{{ $key + 1 }}</td>
                                    <td>{{ $location->user->name }}
                                    <td>{{ $location->city ?? 'N/A' }}</td>
                                    <td>{{ $location->postcode }}</td>
                                    <td>{{ $location->order_count ?? 0 }}</td>
                                </tr>
                                @endforeach
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>

            <!-- Trending Products Table -->
            <div class="col-lg-6">
                <div class="card">
                    <div class="card-header">
                        <h3 class="card-title"><b>Trending Products</b></h3>
                    </div>
                    <div class="card-body">
                        <table class="table table-striped table-bordered">
                            <thead>
                                <tr>
                                    <th>Product Name</th>
                                    <th>Price</th>
                                    <th>Purchased Count</th>
                                </tr>
                            </thead>
                            <tbody>
                                  @foreach($trendingProducts as $product)
                                  <tr>
                                      <td>{{ $product->name ?? 'N/A' }}</td>
                                      <td>{{ $product->one_price->price ?? 'N/A' }}</td>
                                      <td>{{ $product->purchase_count ?? 0 }}</td> <!-- Use purchase count from merged data -->
                                  </tr>
                                  @endforeach
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>

      </div>
    </section>
  </div>

  <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<script>
    document.addEventListener('DOMContentLoaded', function () {
        // Sales data arrays
        var weekSalesData = @json($weekly_sales_data_array); // Fetch weekly sales data
        var monthSalesData = @json($sales_data_array); // Monthly sales data (current year)
        var yearSalesData = @json($yearly_sales_data_array); // Fetch yearly sales data

        // Customers data arrays
        var weekCustomersData = @json($weekly_customers_data_array); // Fetch weekly customer data
        var monthCustomersData = @json($monthly_customers_data_array); // Monthly customer data
        var yearCustomersData = @json($yearly_customers_data_array); // Fetch yearly customer data

        // Sales Overview Chart
        var ctx = document.getElementById('salesOverviewChart').getContext('2d');
        var salesOverviewChart = new Chart(ctx, {
            type: 'line',
            data: {
                labels: ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'],
                datasets: [{
                    label: 'Sales',
                    data: monthSalesData, // Default to monthly sales data
                    borderColor: 'rgba(75, 192, 192, 1)',
                    fill: false,
                }]
            },
        });

        // Daily Customers Chart
        var ctx2 = document.getElementById('dailyCustomersChart').getContext('2d');
        var dailyCustomersChart = new Chart(ctx2, {
            type: 'bar',
            data: {
                labels: ['M', 'T', 'W', 'T', 'F', 'S', 'S'], // Default weekly labels
                datasets: [{
                    label: 'Customers',
                    data: weekCustomersData, // Default to weekly customer data
                    backgroundColor: 'rgba(255, 99, 132, 0.2)',
                    borderColor: 'rgba(255, 99, 132, 1)',
                    borderWidth: 1
                }]
            },
        });

        // Functions to update chart data
        function updateSalesChart(data, labels) {
            salesOverviewChart.data.labels = labels;
            salesOverviewChart.data.datasets[0].data = data;
            salesOverviewChart.update();
        }

        function updateCustomersChart(data, labels) {
            dailyCustomersChart.data.labels = labels;
            dailyCustomersChart.data.datasets[0].data = data;
            dailyCustomersChart.update();
        }

        // Event listeners for buttons
        document.getElementById('showWeek').addEventListener('click', function () {
            // Update charts with weekly data
            updateSalesChart(weekSalesData, ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun']);
            updateCustomersChart(weekCustomersData, ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun']);
        });

        document.getElementById('showMonth').addEventListener('click', function () {
            // Update Sales chart with monthly data
            updateSalesChart(monthSalesData, ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec']);
            
            // Update Customers chart with monthly data (Jan to Dec)
            updateCustomersChart(monthCustomersData, ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec']);
        });

        document.getElementById('showYear').addEventListener('click', function () {
            // Update charts with yearly data
            updateSalesChart(yearSalesData, ['2021', '2022', '2023', '2024']); // Example year labels
            updateCustomersChart(yearCustomersData, ['2021', '2022', '2023', '2024']); // Example year labels
        });
    });
</script>

@endsection
