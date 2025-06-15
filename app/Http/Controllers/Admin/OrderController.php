<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Order;
use App\OrderDetail;
use App\User;
use App\Product;
use App\CustRequiredProduct;
use DB;
use Illuminate\Support\Facades\Mail;
use View;
use Response;

class OrderController extends Controller
{
    public function list(Request $request)
    {
        // Fetch all products to show in the product filter dropdown
        $products = Product::all();

        $recordsPerPage = $request->input('records_per_page', 25); // Default to 25 if not set
        $searchQuery = $request->input('search', ''); // Get search query

        // Fetch base query for orders with related order details and user info
        $query = Order::with('order_detail', 'user')
                      ->orderBy('id', 'desc');
    
        // Date filter
        if ($request->filled('start_date') && $request->filled('end_date')) {
            $start_date = $request->input('start_date');
            $end_date = $request->input('end_date');
            $query->whereBetween('order_time', [$start_date, date('Y-m-d', strtotime($end_date . ' + 1 day'))]);
        } elseif ($request->filled('start_date')) {
            $start_date = $request->input('start_date');
            $query->whereDate('order_time', $start_date);
        } elseif ($request->filled('end_date')) {
            $end_date = $request->input('end_date');
            $query->whereDate('order_time', $end_date);
        }
    
        // Product filter
        if ($request->filled('product_id')) {
            $productId = $request->input('product_id');
            $query->whereHas('order_detail', function ($q) use ($productId) {
                $q->where('product_id', $productId);
            });
        }
    
        // Status filter (Pending payment, Paid, Failed)
        if ($request->filled('status')) {
            $status = $request->input('status');
            $query->where('delivery_status', $status);
        }

        if ($searchQuery) {
            $query->where('customer_name', 'like', "%{$searchQuery}%") // Example search condition
                  ->orWhere('order_number', 'like', "%{$searchQuery}%");
        }
        
        // Fetch orders and all status counts
        $orders = $query->paginate($recordsPerPage); 
    
        // Fetch counts for the statuses
        $totalCount = Order::count();
        $pendingPaymentCount = Order::where('delivery_status', 'Order Received')->count();
        $paidCount = Order::where('delivery_status', 'Delivered')->count();
        $failedCount = Order::where('delivery_status', 'Not Applicable')->count();
    
        // Pass the orders and counts to the view
        return view('admin.order.order_list')->with([
            'orders' => $orders,
            'products' => $products, 
            'totalCount' => $totalCount,
            'pendingPaymentCount' => $pendingPaymentCount,
            'paidCount' => $paidCount,
            'failedCount' => $failedCount,
        ]);
    }    
    
    public function details($id, $type)
    {
        $order = Order::where('id', $id)
                ->with('order_details.product')
                ->orderBy('id', 'desc')->first();
        
        $riders = User::where('role', 'Rider')->get();
        
        return view('admin.order.order_details')->with([
            'order' => $order,
            'type' => $type,
            'riders' => $riders
        ]);
    }

    public function update(Request $request, $id)
    {
        Order::where('id', $id)->update([
            'delivery_status' => $request->delivery_status,
            'rider_id' => $request->rider_id
        ]);

        $order = Order::where('id', $id)
                ->with('order_details.product')
                ->orderBy('id', 'desc')->first();
        
        $email = $order->user->email;
        $name = $order->user->name;
        $data['name'] = $name;
        $data['delivery_status'] = $request->delivery_status;
        
        // send status change email        
        if($email){
            $check = explode("@",$email);
            if($check[1] != 'directfarms.biz'){
               /* Mail::send('email/order-status', compact('data'), function($q) use ($email, $name){
                    $q->to($email, $name)
                            ->subject('Order Status - Direct farm Cart');
                    $q->from('admin@directfarms.biz','Direct Farms');
                });*/
            }
        }
        // send status change email

        return redirect(route('order.detail', ['id' => $id, 'type' => 'edit']))->with([
            'success' => 'Order Updated Successfully'
        ]);
    }

    public function customers(Request $request)
    {
        $search = $request->input('search');
        $startDate = $request->input('start_date');
        $endDate = $request->input('end_date');
        $recordsPerPage = $request->input('records_per_page', 25);
        // Initialize the query to get customers with the role 'Customer'
        $query = User::where('role', 'Customer');

        // Implement search functionality
        if ($request->has('search') && $request->search != '') {
            $searchTerm = $request->search;
            $query->where(function($q) use ($searchTerm) {
                $q->where('name', 'LIKE', "%{$searchTerm}%")
                ->orWhere('email', 'LIKE', "%{$searchTerm}%");
            });
        }

        // Apply date filters
        if ($startDate) {
            $query->whereDate('created_at', '>=', $startDate);
        }

        if ($endDate) {
            $query->whereDate('created_at', '<=', $endDate);
        }

        // Handle status filtering
        if ($request->has('status') && $request->status != '') {
            $query->where('status', $request->status);
        }

        // Pagination: Change the number of records per page
        $recordsPerPage = $request->get('records_per_page', 25); // Default to 10 if not specified
        $customers = $query->orderBy('id', 'desc')->paginate($recordsPerPage);

        // Count customers based on status
        $totalCount = User::where('role', 'Customer')->count();
        $activeCount = User::where('role', 'Customer')->where('status', 'Active')->count();
        $inactiveCount = User::where('role', 'Customer')->where('status', 'Inactive')->count();

        // Pass the customers and counts to the view
        return view('admin.order.customer.customer_list')->with([
            'customers' => $customers,
            'totalCount' => $totalCount,
            'activeCount' => $activeCount,
            'inactiveCount' => $inactiveCount,
        ]);
    }

    public function customerOrderView($id)
    {
        $customer = User::where('id', $id)->first();
        $orders = Order::with('order_detail')
                ->where('user_id', $id)
                ->where('status', '!=', 'Created')
                ->orderBy('id', 'desc')
                ->get();

        return view('admin.order.customer.customer_view')->with([
            'customer' => $customer,
            'orders' => $orders
        ]);
    }
    
    public function downloadHtml($id)
    {
        // Data
         $order = Order::where('id', $id)
                ->with('order_details.product')
                ->orderBy('id', 'desc')->first();
        
        $riders = User::where('role', 'Rider')->get();
     
        $view = view('admin.order.order_details_download', ['order' => $order,
            'type' => 'text',
            'riders' => $riders])->render();
        header("Content-type: text/html");
        header("Content-Disposition: attachment; filename=orders.html");
        return $view;
                
    }

    public function viewPdf($id)
    {
        // Data
        $order = Order::where('id', $id)
                ->with('order_details.product')
                ->orderBy('id', 'desc')->first();
        // dd($order);

        $defaultConfig = (new \Mpdf\Config\ConfigVariables())->getDefaults();
        $fontDirs = $defaultConfig['fontDir'];

        $defaultFontConfig = (new \Mpdf\Config\FontVariables())->getDefaults();
        $fontData = $defaultFontConfig['fontdata'];

        $mpdf = new \Mpdf\Mpdf([
            'fontDir' => array_merge($fontDirs, [
                __DIR__ . '/resources/fonts/',
            ]),
            'ind_ta_1' => $fontData + [
                'ind_ta_1' => [
                    'R' => 'ind_ta_1.ttf'
                ]
            ],
            'default_font' => 'ind_ta_1'
        ]);

        $order_time = $order->order_time ?  date('d/m/Y', strtotime($order->order_time)) : $order->created_at->toDateString();
        
        $header = '<h3 style="text-align: center;">Madurai Kadai - Invoice</h3> <div style="text-align: center;">10G, Mullai street, Brindavan Nagar, Chennai 92</div>';
        $invoice = '<tr><th style="text-align: left; padding: 15px;">Order Date</th><td>'.$order_time.'</td><th style="text-align: left;">Order Number</th><td style="text-align: left;"> '.$order->id.'</td></tr>';
        $tableHeader = '<tr>
                <th style="text-align: left; padding: 15px; ">Sl.No</th>
                <th style="text-align: left; padding: 15px; ">Product</th>
                <th style="text-align: right; ">Price</th>
                <th style="text-align: center; ">Qty</th>
                <th style="text-align: right; ">Amount</th>
            </tr>';

        // Products
        $products = '';
        foreach($order->order_details as $i => $detail){
            $matrix1 = '';
            if(@$detail->product->matrix1 != ''){
                $matrix1 = '<b> '.@$detail->product->matrix1.' : </b>'.@$detail->product_price->matrix1;
            }
            $matrix2 = '';
            if(@$detail->product->matrix2 != ''){
                $matrix2 = '<b> '.@$detail->product->matrix2.' : </b>'.@$detail->product_price->matrix2;
            }
            $products .= '<tr><td style="text-align: left; padding: 15px;">'.($i+1).'</td><td>'.$detail->product->name.'<br>'.$matrix1.$matrix2.'</td><td style="text-align: right;">'.number_format($detail->price,2).'</td><td style="text-align: center;">'.$detail->quantity.'</td><td  style="text-align: right;">'.number_format($detail->amount,2).'</td></tr>';
        }

        // Details
        $tax = '';
        if(substr($order->address->postcode, 0, 1) == 6){
            $tax = '<b>CGST:</b>'.number_format($order->order_details->sum('cgst_amount'),2).' <b>SGST:</b>'.number_format($order->order_details->sum('sgst_amount'),2);
        }else{
            $tax = '<b>IGST:</b>'.number_format($order->order_details->sum('igst_amount'),2);
        }
        $details = '<tr><th style="text-align: left; padding: 15px;">Payment Status</th><td>'.$order->status.'</td><th></th><th style="text-align: right;">Sub Total:</th><td style="text-align: right;">'.number_format($order->sub_total,2).'</td></tr>
                    <tr><th style="text-align: left; padding: 15px;"></th><td></td><th></th><th style="text-align: right;">Shipping:</th><td style="text-align: right;">'.number_format($order->shipping_charge,2).'</td></tr>
                    <tr><th style="text-align: left; padding: 15px;"></th><td>'.$tax.'</td><th></th><th style="text-align: right;">Tax:</th><td style="text-align: right;">'.number_format($order->tax,2).'</td></tr>
                    <tr><th style="text-align: left; padding: 15px;">Delivery Status</th><td>'.$order->delivery_status.'</td><td></td><th style="text-align: right;">Total:</th><td style="text-align: right;">'.number_format($order->net_amount,2).'</td></tr>';
        
        // Customer Details
        $cust = '<span>'.ucfirst($order->user->name).'</span><br><span>'.$order->user->email.'</span><br><span>'.$order->user->mobile.'</span>';
        
        if(@$order->delivery_slot->default == 'Yes') {
            $delivery = '<b>Delivery Date: </b>'.$order->delivery_date.'<br> <b>Delivery Slot: </b> Default Slot';
        }else{
            $delivery = '<b>Delivery Date: </b>'.$order->delivery_date.'<br> <b>Delivery Slot: </b>'.@$order->delivery_slot->start.' - '.@$order->delivery_slot->end;
        }
        $address = '<span>'.$order->address->address.'</span><br><span>'.$order->address->city.', '.$order->address->country.' - '.$order->address->postcode.'</span>';
        $customer_details = '<tr><th style="text-align: left; padding: 15px;">Customer Details</th><td>'.$cust.'</td><td colspan="3">'.$delivery.'</td></tr>
                            <tr><th style="text-align: left; padding: 15px;">Customer Address</th><td>'.$address.'</td><td><b>Payment Mode: </b></td><td>'.$order->payment_mode.'</td></tr>';
        
        $mpdf->autoScriptToLang = true;
        $mpdf->autoLangToFont = true;

        $mpdf->WriteHTML('<div>
                            '.$header.'
                            <table>
                                '.$invoice.$tableHeader.$products.$details.$customer_details.'
                            </table>
                            <html-separator/>
                        </div>');
                        
                        
        $mpdf->Output();
    }

    public function summary(Request $request)
    {
        $start_date = date('Y-m-d');
        $end_date = date('Y-m-d');
        $delivery_status = ['Not Applicable', 'Order Received', 'Packed', 'Out for Delivery', 'Delivered'];
        
        if($request->start_date){
            $start_date = $request->start_date;
        }
        if($request->end_date){
            $end_date = $request->end_date;
        }
        if($request->delivery_status){
            $delivery_status = [ $request->delivery_status ];
        }

        $orderIds = Order::whereIn('delivery_status', $delivery_status)
                        ->whereDate('delivery_date', '>=' ,$start_date)
                        ->whereDate('delivery_date', '<=' ,$end_date)
                        ->pluck('id')
                        ->toArray();
                        // dd($request->delivery_status);
// dd($orderIds);
        $query = OrderDetail::with(['product.category', 'product_price'])->whereIn('order_id', $orderIds);

        $order_details = $query->groupBy('product_id')->groupBy('product_price_id')
            ->select('product_id', 'product_price_id', DB::raw('sum(quantity) as quantity'))->get();

        return view('admin.order.order_summary_list')->with([
            'order_details' => $order_details,
            'start_date' => $start_date,
            'end_date' => $end_date,
            'delivery_status' => $delivery_status
        ]);
    }

    public function requestedproductssummary(Request $request)
    {
        $start_date = date('Y-m-d');
        $end_date = date('Y-m-d');
        
        if($request->start_date){
            $start_date = $request->start_date;
        }
        if($request->end_date){
            $end_date = $request->end_date;
        }

        // Fetch records based on date range
        $requestedproducts_details = CustRequiredProduct::where(function($query) use ($start_date, $end_date) {
            $query->whereBetween('created_at', [$start_date, date('Y-m-d', strtotime($end_date . ' + 1 day'))])
                  ->orWhereBetween('updated_at', [$start_date, date('Y-m-d', strtotime($end_date . ' + 1 day'))]);
        })->get();

        return view('admin.order.requestedproducts_summary_list')->with([
            'requestedproducts_details' => $requestedproducts_details,
            'start_date' => $start_date,
            'end_date' => $end_date
        ]);
    }

}
