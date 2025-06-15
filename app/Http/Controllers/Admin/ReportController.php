<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Order;
use App\OrderDetail;
use App\User;
use App\CustRequiredProduct;
use App\Product;
use DB;
use Illuminate\Support\Facades\Mail;
use View;
use Response;
use PDF;
use Carbon\Carbon;


class ReportController extends Controller
{
    public function index(Request $request) {
            
        $customersQuery = User::whereNotIn('role', ['Super Admin', 'Admin']);
    
        $rows = $request->input('rows', 'all');
    
        if ($rows === 'all') {
            $customers = $customersQuery->get();
        } else {
            $customers = $customersQuery->paginate((int) $rows);
        }
    
        return view('admin.reports.customer', [
            'users' => $customers,
            'rows' => $rows
        ]);
    }

    public function monthlyAnalysis()
    {
        $orders = Order::whereBetween('order_time', [Carbon::now()->subMonth(4), Carbon::now()] )->get();
        return view('admin.reports.monthly',[
                'orders' => $orders
        ]);
    }

    public function dailyAnalysis(Request $request)
    {
        // Fetch the number of records to show per page
        $rows = $request->input('rows', 10); // Default to 10 if not set
        $orders = Order::whereBetween('order_time', [Carbon::now()->subDays(7), Carbon::now()])
                        ->paginate($rows); // Use $rows for pagination
    
        return view('admin.reports.daily', compact('orders'));
    }
    
    public function pendingPayment()
    {
        $orders = Order::where('status','!=','paid')->get();
        return view('admin.reports.pendingpayment',compact('orders'));
    }

    public function downloadPdf()
    {
        $users = User::whereNotIn('role',['Super Admin','Admin'])->get();

        // Ensure the view is properly loaded and passed with data
        $pdf = PDF::loadView('admin.reports.customerDownload', compact('users'))
                ->setOptions([
                    'defaultFont' => 'sans-serif',
                    'isHtml5ParserEnabled' => true,  // Enable HTML5 parsing
                    'isRemoteEnabled' => true        // Enable external resources like images
                ])
                ->setPaper('a4', 'portrait'); // Optional: Set paper size and orientation

        // Download the generated PDF
        return $pdf->download('Customer_Report.pdf');
    }

    public function downloadmonthlyAnalysis()
    {
            $users = User::whereNotIn('role',['Super Admin','Admin'])->get();

            $pdf = PDF::loadView('admin.reports.monthlyDownload', compact('users'))
            ->setOptions([
                'defaultFont' => 'sans-serif',
                'isHtml5ParserEnabled' => true,  // Enable HTML5 parsing
                'isRemoteEnabled' => true        // Enable external resources like images
            ])
            ->setPaper('a4', 'portrait');

        return $pdf->download('monthly_Report.pdf');
    }

    public function downloaddailyAnalysis()
    {
            $users = User::whereNotIn('role',['Super Admin','Admin'])->get();

            $pdf = PDF::loadView('admin.reports.dailyDownload', compact('users'))
            ->setOptions([
                'defaultFont' => 'sans-serif',
                'isHtml5ParserEnabled' => true,  // Enable HTML5 parsing
                'isRemoteEnabled' => true        // Enable external resources like images
            ])
            ->setPaper('a4', 'portrait');

        return $pdf->download('daily_Report.pdf');
    }

    public function downloadpendingPayment()
    {
        $orders = Order::where('status','!=','paid')->get();
        $pdf = PDF::loadView('admin.reports.OrdersDownload', compact('orders'))
        ->setOptions([
            'defaultFont' => 'sans-serif',
            'isHtml5ParserEnabled' => true,  // Enable HTML5 parsing
            'isRemoteEnabled' => true        // Enable external resources like images
        ])
        ->setPaper('a4', 'portrait');


        return $pdf->download('OrdersDownload_Report.pdf');
    }
}
