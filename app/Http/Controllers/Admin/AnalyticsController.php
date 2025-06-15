<?php
namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Order;
use App\User;
use App\Address;
use Carbon\Carbon;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class AnalyticsController extends Controller
{
    public function index(Request $request)
    {
        // Set default date range to the current month
        $startDate = $request->get('start_date', Carbon::now()->startOfMonth()->toDateString());
        $endDate = $request->get('end_date', Carbon::now()->endOfMonth()->toDateString());
    
        // Fetch orders within the date range
        $orders = Order::with(['user', 'order_details.product'])
            ->whereBetween('created_at', [$startDate, $endDate])
            ->get();
    
        // Fetch new customers (created within the date range)
        $newCustomers = User::whereBetween('created_at', [$startDate, $endDate])->count();
    
        // Fetch total revenue (net_amount from orders within the date range)
        $totalRevenue = $orders->sum('net_amount');
    
        // Group orders by date and calculate total products sold per date
        $orderCounts = [];
        $productCounts = [];
        $revenueCounts = [];  // For storing revenue per day
        $newCustomerCounts = [];  // For storing new customers per day
    
        for ($date = Carbon::parse($startDate); $date->lte(Carbon::parse($endDate)); $date->addDay()) {
            $dateStr = $date->toDateString();
    
            // Orders per day
            $dailyOrders = $orders->where('created_at', '>=', $date->startOfDay())
                                  ->where('created_at', '<=', $date->endOfDay());
    
            $orderCounts[$dateStr] = $dailyOrders->count();
    
            // Products sold per day
            $productsSoldOnDate = $dailyOrders->flatMap(function ($order) {
                return $order->order_details;
            })->count();
    
            $productCounts[$dateStr] = $productsSoldOnDate;
    
            // Revenue per day
            $revenueCounts[$dateStr] = $dailyOrders->sum('net_amount');
    
            // New Customers per day
            $newCustomerCounts[$dateStr] = User::where('created_at', '>=', $date->startOfDay())
                                               ->where('created_at', '<=', $date->endOfDay())
                                               ->count();
        }
    
        $dates = array_keys($orderCounts);  // Extract date labels for the chart
    
        // Process data for city-wise users from the Address model
        $cityUserCounts = Address::select('city', DB::raw('count(*) as total'))
            ->whereHas('user') // Ensure that there are users associated with the addresses
            ->groupBy('city')
            ->get()
            ->pluck('total', 'city')
            ->toArray();
    
        // Prepare data for the pie chart
        $cities = array_keys($cityUserCounts);
        $cityCounts = array_values($cityUserCounts);
    
        return view('admin.analytics.index', compact('dates', 'orderCounts', 'productCounts', 'newCustomerCounts', 'revenueCounts', 'startDate', 'endDate', 'cities', 'cityCounts'));
    }    
}


