@extends('layouts.app')

@section('content')
<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <div class="content-header">
        <div class="container-fluid">
            <!-- Filter form -->
            <form method="GET" action="{{ route('analytics.index') }}">
                <div class="row">
                    <div class="col-md-4">
                        <div class="form-group ">
                            <h4 class="m-0 text-dark text-bold mt-4">Analytics</h4>
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
        <div class="container-fluid">
            <div class="text-left mb-4 d-flex justify-content-center" style="gap: 2px;">
                <button class="btn btn-primary" id="showOrders">Orders</button>
                <button class="btn btn-secondary" id="showCustomers">Customers</button>
                <button class="btn btn-success" id="showRevenue">Revenue</button>
            </div>

            <div class="row mb-5">
                <!-- Orders/Customers/Revenue Line Chart -->
                <div class="col-lg-6 mb-4" id="ordersChartContainer">
                    <h4 id="chartTitle">Orders Over Time</h4>
                    <div class="chart-container" style="position: relative; height: 400px;">
                        <canvas id="orderChart"></canvas>
                    </div>
                </div>

                <!-- Products Sold Bar Chart -->
                <div class="col-lg-6 mb-4" id="productsChartContainer">
                    <h4>Products Sold Over Time</h4>
                    <div class="chart-container" style="position: relative; height: 400px;">
                        <canvas id="productBarChart"></canvas>
                    </div>
                </div>

                <!-- Users by City Pie Chart -->
                <div class="col-lg-6 mb-4" id="usersChartContainer">
                    <h4>Users by City</h4>
                    <div class="chart-container" style="position: relative; height: 400px;">
                        <canvas id="userPieChart"></canvas>
                    </div>
                </div>
            </div>
        </div>
    </div>

</div>

<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<script>
    // Orders Line Chart
    const orderCtx = document.getElementById('orderChart').getContext('2d');
    const gradient = orderCtx.createLinearGradient(0, 0, 0, 400);
    gradient.addColorStop(0, 'rgba(75, 192, 192, 0.6)');
    gradient.addColorStop(1, 'rgba(75, 192, 192, 0.1)');

    // Default dataset (Orders)
    let currentDataset = 'orders';

    const orderChart = new Chart(orderCtx, {
        type: 'line',
        data: {
            labels: @json($dates), // Dynamic dates
            datasets: [{
                label: 'Orders',
                data: @json($orderCounts), // Default to order counts
                borderColor: 'rgba(75, 192, 192, 1)',
                backgroundColor: gradient,
                fill: true,
                tension: 0.4,
                pointBorderColor: '#fff',
                pointBackgroundColor: 'rgba(75, 192, 192, 1)',
                pointRadius: 5,
                pointHoverRadius: 7
            }]
        },
        options: {
            responsive: true,
            plugins: {
                legend: {
                    display: true,
                    labels: {
                        color: '#333',
                        font: {
                            size: 14,
                            family: 'Arial',
                        }
                    }
                },
                tooltip: {
                    backgroundColor: 'rgba(0,0,0,0.7)',
                    titleFont: {
                        size: 14,
                    },
                    bodyFont: {
                        size: 12,
                    }
                }
            },
            scales: {
                x: {
                    ticks: {
                        color: '#555',
                        font: {
                            family: 'Arial',
                            size: 12
                        }
                    }
                },
                y: {
                    beginAtZero: true,
                    ticks: {
                        color: '#555',
                        font: {
                            family: 'Arial',
                            size: 12
                        }
                    }
                }
            }
        }
    });

    // Button event listeners
    document.getElementById('showOrders').addEventListener('click', function () {
        updateChart('orders', 'Orders Over Time', @json($orderCounts));
    });

    document.getElementById('showCustomers').addEventListener('click', function () {
        updateChart('customers', 'New Customers Over Time', @json($newCustomerCounts));
    });

    document.getElementById('showRevenue').addEventListener('click', function () {
        updateChart('revenue', 'Revenue Over Time', @json($revenueCounts));
    });

    // Update chart with the new dataset
    function updateChart(dataset, title, data) {
        orderChart.data.datasets[0].data = data;
        orderChart.data.datasets[0].label = dataset === 'orders' ? 'Orders' : dataset === 'customers' ? 'Customers' : 'Revenue';
        document.getElementById('chartTitle').innerText = title;
        orderChart.update();
    }

    // Products Sold Bar Chart
    const productCtx = document.getElementById('productBarChart').getContext('2d');
    const productBarChart = new Chart(productCtx, {
        type: 'bar',
        data: {
            labels: @json($dates), // Use the dates variable passed from the controller
            datasets: [{
                label: 'Products Sold',
                data: @json(array_values($productCounts)), // Correctly retrieve the product counts
                backgroundColor: 'rgba(255, 159, 64, 0.6)',
                borderColor: 'rgba(255, 159, 64, 1)',
                borderWidth: 2,
                borderRadius: 5,
                barPercentage: 0.8
            }]
        },
        options: {
            responsive: true,
            plugins: {
                legend: {
                    display: true,
                    labels: {
                        color: '#333',
                        font: {
                            size: 14,
                            family: 'Arial',
                        }
                    }
                },
                tooltip: {
                    backgroundColor: 'rgba(0,0,0,0.7)',
                    titleFont: {
                        size: 14,
                    },
                    bodyFont: {
                        size: 12,
                    }
                }
            },
            scales: {
                x: {
                    ticks: {
                        color: '#555',
                        font: {
                            family: 'Arial',
                            size: 12
                        }
                    }
                },
                y: {
                    beginAtZero: true,
                    ticks: {
                        color: '#555',
                        font: {
                            family: 'Arial',
                            size: 12
                        }
                    }
                }
            }
        }
    });

    const userCtx = document.getElementById('userPieChart').getContext('2d');
    const userPieChart = new Chart(userCtx, {
        type: 'pie',
        data: {
            labels: @json($cities), // Use the cities variable passed from the controller
            datasets: [{
                data: @json($cityCounts), // Use the city counts variable
                backgroundColor: [
                    'rgba(75, 192, 192, 0.6)', 
                    'rgba(255, 99, 132, 0.6)', 
                    'rgba(255, 206, 86, 0.6)',
                    'rgba(54, 162, 235, 0.6)',
                    'rgba(153, 102, 255, 0.6)',
                    'rgba(255, 159, 64, 0.6)',
                ],
                hoverBackgroundColor: [
                    'rgba(75, 192, 192, 1)', 
                    'rgba(255, 99, 132, 1)', 
                    'rgba(255, 206, 86, 1)',
                    'rgba(54, 162, 235, 1)',
                    'rgba(153, 102, 255, 1)',
                    'rgba(255, 159, 64, 1)',
                ],
                borderColor: '#fff',
                hoverOffset: 10
            }]
        },
        options: {
            responsive: true,
            plugins: {
                legend: {
                    display: true,
                    position: 'bottom',
                    labels: {
                        color: '#333',
                        font: {
                            size: 14,
                            family: 'Arial',
                        }
                    }
                },
                tooltip: {
                    backgroundColor: 'rgba(0,0,0,0.7)',
                    titleFont: {
                        size: 14,
                    },
                    bodyFont: {
                        size: 12,
                    }
                }
            }
        }
    });
</script>
<script>
    // Get buttons
    const showOrdersBtn = document.getElementById('showOrders');
    const showCustomersBtn = document.getElementById('showCustomers');
    const showRevenueBtn = document.getElementById('showRevenue');

    // Get chart containers
    const ordersChartContainer = document.getElementById('ordersChartContainer');
    const productsChartContainer = document.getElementById('productsChartContainer');
    const usersChartContainer = document.getElementById('usersChartContainer');

    // Function to hide all charts
    function hideAllCharts() {
        ordersChartContainer.style.display = 'none';
        productsChartContainer.style.display = 'none';
        usersChartContainer.style.display = 'none';
    }

    // Show only the Orders chart
    showOrdersBtn.addEventListener('click', function() {
        hideAllCharts();
        ordersChartContainer.style.display = 'block';  // Show only Orders chart
    });

    // Show Orders and Users chart (for Customers button)
    showCustomersBtn.addEventListener('click', function() {
        hideAllCharts();
        ordersChartContainer.style.display = 'block';  // Show Orders chart
        usersChartContainer.style.display = 'block';   // Show Users chart
    });

    // Show Orders and Products chart (for Revenue button)
    showRevenueBtn.addEventListener('click', function() {
        hideAllCharts();
        ordersChartContainer.style.display = 'block';   // Show Orders chart
        productsChartContainer.style.display = 'block'; // Show Products chart
    });

    // Initially show all charts
    ordersChartContainer.style.display = 'block';
    productsChartContainer.style.display = 'block';
    usersChartContainer.style.display = 'block';
</script>
<style>
    h2 {
        font-family: 'Arial', sans-serif;
        font-weight: bold;
        color: #333;
    }

    canvas {
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        border-radius: 10px;
        background-color: #fff;
    }

    .text-center {
        text-align: center;
    }

    .container-fluid {
        background-color: #f4f6f9;
        padding: 10px;
    }

    .row {
        margin-top: 10px;
    }

</style>

@endsection
