<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Product;
use App\Order;
use App\User;
use App\Address;
use Illuminate\Support\Facades\DB;

class DashboardController extends Controller
{
    public function dashboard(Request $request)
    {
        $products_count = Product::count();
        $orders_completed_count = Order::where('created_at', '>=', now()->subMonth())->count();
        $to_be_shipped_count = Order::where('delivery_status', 'Order Received')
                                 ->orWhere('delivery_status', 'Packed')
                                 ->count();
        $order_value = Order::sum('net_amount');
        $delivered_count = Order::where('delivery_status', 'Delivered')
                            ->whereDate('created_at', '=', now()->subDay()->toDateString())
                            ->count();
        $customers_count = user::whereDate('created_at', '=', now()->subDay()->toDateString())
                            ->distinct('id')
                            ->count('id');

        // Sales Data for the current year (up to this month)
        $sales_data = Order::selectRaw("MONTH(created_at) as month, COUNT(*) as sales_count")
        ->whereYear('created_at', now()->year) // Filter for the current year
        ->groupBy('month')
        ->pluck('sales_count', 'month');

        // Daily Customer Data for the current week (up to today)
        $daily_customers = Order::selectRaw('DAY(created_at) as day, COUNT(DISTINCT user_id) as customer_count')
            ->whereMonth('created_at', now()->month) // Get records from the current month
            ->groupBy('day')
            ->pluck('customer_count', 'day');

        // Initialize array for 31 days, fill with daily customer data
        $daily_customers_array = array_fill(1, 31, 0); // Fill with zeros for days of the month
        foreach ($daily_customers as $day => $customer_count) {
            $daily_customers_array[$day] = $customer_count; // Populate with daily customer data
        }
        $daily_customers_array = array_values($daily_customers_array);

        // Calculate weekly sales data
        $weekly_sales_data = Order::selectRaw('DAY(created_at) as day, SUM(net_amount) as sales_count')
        ->where('created_at', '>=', now()->startOfWeek()) // Get records from the start of the week
        ->groupBy('day')
        ->pluck('sales_count', 'day');

        // Initialize array for 7 days, fill with sales data
        $weekly_sales_data_array = array_fill(1, 7, 0); // Fill with zeros for days of the week
        foreach ($weekly_sales_data as $day => $sales_count) {
        $weekly_sales_data_array[$day] = $sales_count; // Populate with sales data
        }
        $weekly_sales_data_array = array_values($weekly_sales_data_array); 

        // Monthly sales data
        $sales_data = Order::selectRaw("MONTH(created_at) as month, COUNT(*) as sales_count")
        ->whereYear('created_at', now()->year) // Filter for the current year
        ->groupBy('month')
        ->pluck('sales_count', 'month');

        // Initialize array for 12 months
        $sales_data_array = array_fill(1, 12, 0); // 12 months array
        foreach ($sales_data as $month => $sales_count) {
        $sales_data_array[$month] = $sales_count; // Populate with sales data
        }
        $sales_data_array = array_values($sales_data_array); 

        // Calculate monthly customer data
        $monthly_customers_data = Order::selectRaw('MONTH(created_at) as month, COUNT(DISTINCT user_id) as customer_count')
            ->whereYear('created_at', now()->year) // Filter for the current year
            ->groupBy('month') // Group by month
            ->pluck('customer_count', 'month'); // Pluck the results

        // Initialize array for 31 days
        $monthly_customers_data_array = array_fill(1, 31, 0); // Fill with zeros for days of the month
        foreach ($monthly_customers_data as $day => $customer_count) {
        $monthly_customers_data_array[$day] = $customer_count; // Populate with customer data
        }
        $monthly_customers_data_array = array_values($monthly_customers_data_array); 

        // Calculate yearly sales data
        $yearly_sales_data = Order::selectRaw('YEAR(created_at) as year, SUM(net_amount) as sales_count')
        ->whereYear('created_at', now()->year) // Filter for the current year
        ->groupBy('year')
        ->pluck('sales_count', 'year');

        // Initialize array for years (assuming the last 4 years)
        $yearly_sales_data_array = array_fill(1, 4, 0); // Example for the last 4 years
        foreach ($yearly_sales_data as $year => $sales_count) {
        $yearly_sales_data_array[$year - now()->year + 3] = $sales_count; // Adjust index as needed
        }
        $yearly_sales_data_array = array_values($yearly_sales_data_array); 

        // Calculate weekly customer data
        $weekly_customers = Order::selectRaw('DAY(created_at) as day, COUNT(DISTINCT user_id) as customer_count')
        ->where('created_at', '>=', now()->startOfWeek()) // Get records from the start of the week
        ->groupBy('day')
        ->pluck('customer_count', 'day');

        // Initialize array for 7 days
        $weekly_customers_data_array = array_fill(1, 7, 0); // Fill with zeros for days of the week
        foreach ($weekly_customers as $day => $customer_count) {
        $weekly_customers_data_array[$day] = $customer_count; // Populate with customer data
        }
        $weekly_customers_data_array = array_values($weekly_customers_data_array); 

        // Calculate yearly customer data
        $yearly_customers_data = Order::selectRaw('YEAR(created_at) as year, COUNT(DISTINCT user_id) as customer_count')
        ->whereYear('created_at', now()->year)
        ->groupBy('year')
        ->pluck('customer_count', 'year');

        // Initialize array for years
        $yearly_customers_data_array = array_fill(1, 4, 0); // Example for the last 4 years
        foreach ($yearly_customers_data as $year => $customer_count) {
        $yearly_customers_data_array[$year - now()->year + 3] = $customer_count; // Adjust index as needed
        }
        $yearly_customers_data_array = array_values($yearly_customers_data_array); 
        
        // Default status is "Order Received"
        $defaultStatus = 'Order Received';
        $status = $request->input('status', $defaultStatus); // Get the status from the request or default to "Order Received"

        // Build the query
        $query = Order::with('user'); // Load associated user and products

        // Apply the status filter
        $query->where('delivery_status', $status);

        // Fetch the orders based on the query
        $orders = $query->latest('id')->take(10)->get();

        $topUsers = Order::select('user_id')
        ->selectRaw('COUNT(*) as order_count')
        ->groupBy('user_id')
        ->orderBy('order_count', 'desc')
        ->limit(5)
        ->get();

        // Get user details and their corresponding addresses
        $locations = Address::whereIn('user_id', $topUsers->pluck('user_id'))
            ->with('user') // Load the related User model
            ->get();

        // Attach purchase count to each location
        foreach ($locations as $location) {
            // Find the order count for the user in topUsers
            $userData = $topUsers->firstWhere('user_id', $location->user_id);
            $location->order_count = $userData ? $userData->order_count : 0; // default to 0 if not found
        }

        // Sort locations by purchase count in descending order
        $locations = $locations->sortByDesc('order_count');

        $trendingProducts = DB::table('order_details')
        ->select('product_id', DB::raw('COUNT(*) as purchase_count'))
        ->groupBy('product_id')
        ->orderBy('purchase_count', 'desc') // Ensure it's ordered by purchased count
        ->limit(5)
        ->get();

    // Retrieve product details for trending products
    $productIds = $trendingProducts->pluck('product_id'); // Get product IDs
    $trendingProductDetails = Product::whereIn('id', $productIds)->get()->keyBy('id');

    // Merge purchase count into product details for sorting
    foreach ($trendingProducts as $trendingProduct) {
        if (isset($trendingProductDetails[$trendingProduct->product_id])) {
            $trendingProductDetails[$trendingProduct->product_id]->purchase_count = $trendingProduct->purchase_count; // Add purchase count
        }
    }

    // Convert to array and sort by purchase count in descending order
    $trendingProductDetails = $trendingProductDetails->sortByDesc('purchase_count')->values();

        // Calculate percentage change for revenue compared to last week
        $current_week_revenue = Order::whereBetween('created_at', [now()->startOfWeek(), now()->endOfWeek()])
            ->sum('net_amount');
        $last_week_revenue = Order::whereBetween('created_at', [now()->subWeek()->startOfWeek(), now()->subWeek()->endOfWeek()])
            ->sum('net_amount');

        $revenue_change_percentage = $last_week_revenue > 0
            ? round((($current_week_revenue - $last_week_revenue) / $last_week_revenue) * 100, 2)
            : 0;

        // Calculate percentage change for orders compared to yesterday
        $orders_today = Order::whereDate('created_at', now())->count();
        $orders_yesterday = Order::whereDate('created_at', now()->subDay())->count();

        $orders_change_percentage = $orders_yesterday > 0
            ? round((($orders_today - $orders_yesterday) / $orders_yesterday) * 100, 2)
            : 0;

        // Calculate percentage change for customers compared to yesterday
        $customers_today = Order::whereDate('created_at', now())->distinct('user_id')->count();
        $customers_yesterday = Order::whereDate('created_at', now()->subDay())->distinct('user_id')->count();

        $customers_change_percentage = $customers_yesterday > 0
            ? round((($customers_today - $customers_yesterday) / $customers_yesterday) * 100, 2)
            : 0;

        // Calculate percentage change for delivered orders compared to yesterday
        $delivered_today = Order::whereDate('created_at', now())->where('delivery_status', 'Delivered')->count();
        $delivered_yesterday = Order::whereDate('created_at', now()->subDay())->where('delivery_status', 'Delivered')->count();

        $delivered_change_percentage = $delivered_yesterday > 0
            ? round((($delivered_today - $delivered_yesterday) / $delivered_yesterday) * 100, 2)
            : 0;

        return view('admin.dashboard')->with([
            'products_count' => $products_count,
            'orders_completed_count' => $orders_completed_count,
            'to_be_shipped_count' => $to_be_shipped_count,
            'order_value' => $order_value,
            'delivered_count' => $delivered_count,
            'customers_count' => $customers_count,
            'daily_customers_array' => $daily_customers_array,
            'weekly_sales_data_array' => $weekly_sales_data_array,
            'sales_data_array' => $sales_data_array,
            'monthly_customers_data_array' => $monthly_customers_data_array,
            'yearly_sales_data_array' => $yearly_sales_data_array,
            'weekly_customers_data_array' => $weekly_customers_data_array,
            'yearly_customers_data_array' => $yearly_customers_data_array,
            'revenue_change_percentage' => $revenue_change_percentage,
            'orders_change_percentage' => $orders_change_percentage,
            'customers_change_percentage' => $customers_change_percentage,
            'delivered_change_percentage' => $delivered_change_percentage,
            'locations' => $locations,
            'trendingProducts' => $trendingProductDetails,
            'orders' => $orders,
            'statuses' => ['Order Received', 'Delivered', 'Not Applicable']
        ]);
    }
}
