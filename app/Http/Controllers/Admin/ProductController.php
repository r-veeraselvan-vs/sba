<?php

namespace App\Http\Controllers\Admin;

use App\Category;
use App\Subcategory;
use App\Http\Controllers\Controller;
use App\Product;
use App\ProductPrice;
use App\ProductFeature;
use App\ProductImage;
use App\ProductSpecification;
use Illuminate\Http\Request;
use Brian2694\Toastr\Facades\Toastr;
use Illuminate\Support\Facades\Storage;
use Response;
use Illuminate\Support\Facades\Validator;
use App\Vendor;
use Maatwebsite\Excel\Facades\Excel;
use App\Imports\ImportProduct;

class ProductController extends Controller
{
    public function list(Request $request)
    {
        if ($request->ajax()) {
            $query = Product::with('category', 'subcategory')
                ->orderBy('id', 'desc');
    
            // Apply category filter if present
            if ($request->has('category_id') && $request->category_id != '') {
                $query->where('category_id', $request->category_id);
            }
    
            // Search functionality
            if ($request->has('search') && $request->search['value'] != '') {
                $search = $request->search['value'];
                $query->where(function ($q) use ($search) {
                    $q->where('name', 'like', "%{$search}%")
                        ->orWhere('matrix1', 'like', "%{$search}%")
                        ->orWhere('gst', 'like', "%{$search}%")
                        ->orWhere('mrp', 'like', "%{$search}%")
                        ->orWhereHas('category', function ($q) use ($search) {
                            $q->where('category', 'like', "%{$search}%");
                        })
                        ->orWhereHas('subcategory', function ($q) use ($search) {
                            $q->where('subcategory', 'like', "%{$search}%");
                        });
                });
            }
    
            $totalFiltered = $query->count();
    
            // Apply pagination for DataTables
            $products = $query->skip($request->start)
                              ->take($request->length)
                              ->get();
    
            // Prepare response for DataTables
            $data = [];
            foreach ($products as $p => $product) {
                $nestedData = [];
                $nestedData[] = $p + 1;
                $nestedData[] = @$product->category->category;
                $nestedData[] = $product->subcategory->subcategory;
                $nestedData[] = '<a href="'.$product->ThumbnailUrl.'" target="_blank" rel="noopener noreferrer"><img src="'.$product->ThumbnailUrl.'" height="30px" width="30px"></a>';
                $nestedData[] = $product->name;
                $nestedData[] = $product->one_price ? $product->one_price->price : 'There is no price for this product. Please check.';
                $nestedData[] = '<span class="right badge '.($product->status == 'Active' ? 'badge-success' : 'badge-danger').'">'.$product->status.'</span>';
                
                // Merged Edit and Delete buttons into a single column with Font Awesome icons
                $actionButtons = '<a href="' . route('product.edit', ['id' => $product->id, 'tab' => 'edit', 'page' => $request->start / $request->length + 1]) . '" class="badge bg-danger mr-2" title="Edit"><i class="fas fa-edit"></i></a>';
                $actionButtons .= '<form action="' . route('product.delete', ['id' => $product->id]) . '" method="POST" style="display:inline-block;" onsubmit="return confirm(\'Are you sure you want to delete this product?\');">';
                $actionButtons .= csrf_field(); // Add CSRF token for security
                $actionButtons .= method_field('DELETE'); // Spoof the DELETE method
                $actionButtons .= '<button type="submit" class="badge bg-warning" title="Delete"><i class="fas fa-trash"></i></button>';
                $actionButtons .= '</form>';

                $nestedData[] = $actionButtons;
                $data[] = $nestedData;
            }
    
            $json_data = [
                "draw" => intval($request->draw),
                "recordsTotal" => intval(Product::count()),
                "recordsFiltered" => intval($totalFiltered),
                "data" => $data
            ];
    
            return response()->json($json_data);
        }
    
        // Load initial page with categories, subcategories, vendors
        $query = Product::with('category', 'subcategory')
                        ->orderBy('id', 'desc');
    
        // Apply category filter if present
        if ($request->has('category_id') && $request->category_id != '') {
            $query->where('category_id', $request->category_id);
        }
    
        // Apply pagination for regular view
        $products = $query->paginate(10); // Adjust per your pagination needs
    
        $categories = Category::orderBy('id', 'asc')->get();
        $subcategories = Subcategory::orderBy('id', 'asc')->get();
        $vendors = Vendor::orderBy('id', 'asc')->get();
    
        return view('admin.product.product_list', [
            'categories' => $categories,
            'subcategories' => $subcategories,
            'vendors' => $vendors,
            'products' => $products,
            'selectedCategory' => $request->category_id, // Pass selected category
        ]);
    }
    

    public function save(Request $request)
    {
        $page = $request->page;
        if($request->has('thumbnail')){
            $folder = 'product';   
            $thumbnail = $this->upload_image('PROD', $folder, $request->thumbnail);
        }else{
            $thumbnail = null;
        }

        $slug = $this->getUniqueSlug($request->name, 'product');
        
        $new = new Product();
        $new->slug = $slug;
        $new->category_id = $request->category_id;
        $new->subcategory_id = $request->subcategory_id ? $request->subcategory_id : 1;
        $new->gst = $request->gst ? $request->gst : 0;
        $new->mrp = $request->mrp;
        $new->name = $request->name;
        $new->lot_number = $request->lot_number;
        $new->matrix1 = $request->matrix1;
        $new->matrix2 = $request->matrix2;
        $new->thumbnail = $thumbnail;
        $new->description = $request->description;
        $new->nonreturnable = $request->nonreturnable;
        $new->is_offer = $request->is_offer;
        $new->is_top_selling = $request->is_top_selling;
        $new->show_in_home = $request->show_in_home;
        $new->average_ratings = 0;
        $new->ratings_count = 0;
        $new->status = $request->status;
        $new->vendor_id = $request->vendor_id;
        $new->save();

        Toastr::success('Product Added, Now add price details');
        return redirect(route('product.edit', ['id' => $new->id, 'tab' => 'price', 'page' => $page]));
    }

    public function edit($id, $tab, $page)
    {
        $product = Product::findOrFail($id);
        // Load other necessary data for the edit form
        $categories = Category::orderBy('id', 'asc')->get();
        $subcategories = Subcategory::orderBy('id', 'asc')->get();
        $matrix_ones = ProductPrice::where('product_id', $id)->pluck('matrix1')->toArray();
        $vendors = Vendor::orderBy('id', 'asc')->get();

        return view('admin.product.product_edit')->with([
            'product' => $product,
            'tab' => $tab,
            'categories' => $categories,
            'subcategories' => $subcategories,
            'matrix_ones' => array_unique($matrix_ones),
            'vendors' => $vendors,
            'page' => $page, // Pass the page number to the view
        ]);
    }

    public function update(Request $request, $id)
    {
        $tab = $request->tab;
    
        if ($request->status == 'Active') {
            $tab = $this->checkTabs($request->id);
            if ($tab != 'no') {
                Toastr::error('Any one active ' . $tab . ' is required to activate product');
                return redirect()->route('product.edit', ['id' => $request->id, 'tab' => $tab, 'page' => $request->page]);
            } else {
                $tab = "edit";
            }
        }
    
        if ($request->thumbnail) {
            $folder = 'product';
            $thumbnail = $this->upload_image('PROD', $folder, $request->thumbnail);
        } else {
            $thumbnail = $request->old_thumbnail;
        }
    
        $slug = $this->getUniqueSlug($request->name, 'product');
    
        $old = Product::find($id);
        if (!$old) {
            return redirect()->route('product.list')->with('error', 'Product not found.');
        }
    
        $old->slug = $slug;
        $old->category_id = $request->category_id;
        $old->subcategory_id = $request->subcategory_id;
        $old->gst = $request->gst ? $request->gst : 0;
        $old->name = $request->name;
        $old->lot_number = $request->lot_number;
        $old->matrix1 = $request->matrix1;
        $old->matrix2 = $request->matrix2;
        $old->thumbnail = $thumbnail;
        $old->description = $request->description;
        $old->nonreturnable = $request->nonreturnable;
        $old->is_offer = $request->is_offer;
        $old->is_top_selling = $request->is_top_selling;
        $old->show_in_home = $request->show_in_home;
        $old->status = $request->status;
        $old->vendor_id = $request->vendor_id;
        $old->mrp = $request->mrp;
        $old->save();
    
        Toastr::success('Product Updated');
    
        // Redirect back to the product listing page with correct pagination and category filter
        return redirect()->route('product.list', [
            'page' => $request->page,
            'category_id' => $request->category_id,
        ])->with('success', 'Product updated successfully.');
    }    

    public function checkTabs($product_id)
    {
        // Feature
        $tab = 'no';
        
        $images = ProductImage::where('product_id', $product_id)->where('status', 'Active')->count();
        if($images <= 0){
            $tab = 'image';
        }
        // Price
        $images = ProductPrice::where('product_id', $product_id)->where('status', 'Active')->count();
        if($images <= 0){
            $tab = 'price';
        }
        
        return $tab;
    }

    public function export(Request $request)
    {
        $headers = array(
            "Content-type" => "text/csv",
            "Content-Disposition" => "attachment; filename=Product_List.csv",
            "Pragma" => "no-cache",
            "Cache-Control" => "must-revalidate, post-check=0, pre-check=0",
            "Expires" => "0"
        );

        $productsArray = Product::where('category_id', $request->category_id)->pluck('id');

        $query = ProductPrice::with('product')->orderBy('product_id', 'asc');
        if($request->category_id){
            $query->whereIn('product_id', $productsArray);
        }
        $items = $query->get();
        $columns = array('product_price_id', 'product_id', 'product', 'matrix1', 'price','MRP');

        $callback = function() use ($items, $columns)
        {
            $file = fopen('php://output', 'w');
            fputcsv($file, $columns);
            foreach($items as $item) {
                    $fields = [ 
                        @$item->id, 
                        @$item->product_id, 
                        @$item->product->name, 
                        @$item->matrix1,
                        @$item->price,
                        @$item->product->mrp
                    ];
                fputcsv($file, $fields);
            }
            fclose($file);
        };
        return Response::stream($callback, 200, $headers);
    }

    public function exportUpdate(Request $request)
    {
        $file = $request->file('csv_file');
        
        $datas = [];
        $cols = [];
        $validate = [];
        if($file){
            if (($handle = fopen($file, "r")) !== FALSE) {
                $i = 0;
                while (($d = fgetcsv($handle, 1000000, ",")) !== FALSE) { 
                    if($i == 0){
                        $cols = $d;
                    }else{
                        $temp = array_combine($cols, $d);
                        foreach ($temp as $key => $t) {
                            $datas[$i][$key] = $t;
                        }
                    }
                    $i++;
                }
                $validate = $this->validatePrice($datas);
                if($validate){
                    return view('admin.product.product_import')->with([
                        'validate' => $validate,
                        'd' => $datas
                    ]);
                }
                $data = $this->updateProductPrice($datas);
                if($data == true){
                    Toastr::success('Product Price Updated successfully', 'Message');
                    return redirect(route('product.import'))->with([
                        'validate' => $validate,
                        'd' => $datas
                    ]);
                }
            }
        }

        return view('admin.product.product_import')->with([
            'validate' => $validate,
            'd' => $datas
        ]);
    }

    public function updateProductPrice($datas)
    {
        foreach ($datas as $k => $data) {
            $item = ProductPrice::find($data['product_price_id']);
            $item->price             = $data['price'];
            $item->save();
        }
        return true;
    }

    public function validatePrice($datas)
    {
        $error = [];
        foreach($datas as $d => $data){
            $validator = Validator::make($data, [
                'product_price_id' => 'required',
                'price' => 'required',
            ]);
            if($validator->fails()){
                $error[$d] = $validator->errors()->all();
            }

        }
        return $error;
    }

    public function productViewBulkUpdate()
    {
         return view('admin.product.product_bulk_import');
    }


    public function productBulkUpdate(Request $request)
    {

        $extension = $request->file('csv_file')->extension();
        if($extension!="txt")
        {
            Toastr::warning('Upload only csv file', 'Message');
            return redirect(route('product.ViewBulkUpdate'));

        }
  

        $file = $request->file('csv_file');
        
        $datas = [];
        $cols = [];
        $validate = [];
        if($file){
           
            $datas = $this->csvToArray($file);
            if(count($datas)==0)
            {
                Toastr::warning('Must add all the mandatory fields', 'Message');
                return redirect(route('product.ViewBulkUpdate'));
            }
            
            $category_ids =  collect($datas)->where('category_id','!=','')->unique('category_id')->pluck('category_id');
            $sub_category_ids =  collect($datas)->where('subcategory_id','!=','')->unique('subcategory_id')->pluck('subcategory_id');
            $vendor_ids =  collect($datas)->where('vendor_id','!=','')->unique('vendor_id')->pluck('vendor_id');
            $categoryCount = Category::whereIn('id',$category_ids)->count();
           
            $category_idCount = collect($datas)->where('category_id','!=','')->unique('category_id')->pluck('category_id')->toArray();
            $sub_category_idCount = collect($datas)->where('subcategory_id','!=','')->unique('subcategory_id')->pluck('subcategory_id')->toArray();
            $vendor_idCount = collect($datas)->where('vendor_id','!=','')->unique('vendor_id')->pluck('vendor_id')->toArray();

            if($categoryCount != count($category_idCount))
            {
                Toastr::error('You must provide valid values for the category', 'Message');
                return redirect(route('product.ViewBulkUpdate'));
            }

            $subcategoryCount = SubCategory::whereIn('id',$sub_category_ids)->count();
            if($subcategoryCount != count($sub_category_idCount))
            {
                Toastr::error('Please make sure to give valid subcategory values when you create a new product.', 'Message');
                return redirect(route('product.ViewBulkUpdate'));
            }

            $VendorCount = Vendor::whereIn('id',$vendor_ids)->count();
            if($VendorCount != count($vendor_idCount))
            {
                Toastr::error('Please provide valid vendor information', 'Message');
                return redirect(route('product.ViewBulkUpdate'));
            }

            $product_id = null;
            for ($i = 0; $i < count($datas); $i ++)
            {

                $pDO = 0;
                $imgDo = 0;
                $data = array_map('trim', $datas[$i]);
                 
                if(isset($data['category_id']))
                {
                    if($data['category_id']!="")
                    {
                        $dataProduct = array_map('trim', $data );
                        $slug = $this->getUniqueSlug($dataProduct['name'], 'product');
                        $dataProduct['slug'] = $slug;
            
         
                        $new = new Product();
                        $new->slug = $slug;
                        $new->category_id = $dataProduct['category_id'];
                        $new->subcategory_id = $dataProduct['subcategory_id'];
                        $new->gst = $dataProduct['gst'] ? $dataProduct['gst'] : 0;
                        $new->mrp = $dataProduct['mrp'] ? $dataProduct['mrp'] : 0;
                        $new->name = $dataProduct['name'];
                        $new->average_ratings = 0;
                        $new->ratings_count = 0;
                        $new->status = "Active";
                        $new->vendor_id = $dataProduct['vendor_id'];
                        $new->save();
                        $product_id = $new->id;
                    }
                     
                }
                if(isset($data['price']) && $product_id!=null)
                {
                    $dataPrice = array_map('trim', $data );
                    $pDO = $pDO + 1;
                   
                    $price = new ProductPrice();
                    $price->product_id = $product_id;
                    $price->weight = $dataPrice['weight'];
                    $price->price = $dataPrice['price'];
                    $price->inventory = $dataPrice['inventory'];
                    $price->display_order = $pDO;
                    $price->save();
                }
                if(isset($data['file_name']) && $product_id!=null)
                {
                    $dataImage = array_map('trim', $data );
                    $imgDo = $imgDo + 1;
                   
                    $img = new ProductImage();
                    $img->product_id = $product_id;
                    $img->image = $dataImage['file_name'];
                    $img->display_order = $imgDo;
                    $img->save();
                    
                    $old = Product::where('id',$product_id)->first();
                    $old->thumbnail = $dataImage['file_name'];
                    $old->save();
                     
                }

                  
            }
            Toastr::success('Product Uploaded successfully', 'Message');
            return redirect(route('product.ViewBulkUpdate'));
         
        }
    }
    
    public function csvToArray($filename = '', $delimiter = ',')
    {
        $columns = array("category_id", "subcategory_id", "vendor_id", "name", "gst", "mrp", "weight", "price", "inventory", "file_name");
         if (!file_exists($filename) || !is_readable($filename))
            return false;
            $header = null;
            $data = array();
            if (($handle = fopen($filename, 'r')) !== false)
            {
                while (($row = fgetcsv($handle, 1000, $delimiter)) !== false)
                {

                    if (!$header)
                    {
                        $headerData = array_map('trim', $row );
                        $result = array_diff($columns, $headerData);
                        if(count($result)==0)
                        {
                            $header =  $row ;
                         }
                        else
                        {
                            return [];
                        }
                        
                    }
                    else
                    {
                         $data[] = array_combine($header, $row);
                    }
                }
                fclose($handle);
            }

        return $data;
    }


    
    public function uploadImages(Request $request)
    {
        
        foreach ($request->file('images') as $i=>$imagefile) 
        {
            $extension = $imagefile->extension();
            if($extension=="jpg" || $extension=="jpeg" ||$extension=="png" || $extension=="webp")
            {
                $folder = 'product';   
                $thumbnail = $this->upload_bulk_image('PROD', $folder, $imagefile);
                
                $folder = 'product/image'; 
                $this->upload_bulk_image('IMG', $folder, $imagefile);   

            }
            else
            {
                 Toastr::warning('Upload only image files', 'Message');
                return redirect(route('product.ViewBulkUpdate'));
            }

                    
            
         
        }
        Toastr::success('Product Uploaded successfully', 'Message');
        return redirect(route('product.ViewBulkUpdate'));
             
    }

    public function productJSONBulkUpdate(Request $request)
    {
        $product_id = null;
        $pDO = 0;
        $imgDo = 0;
        $spDo = 0;
        $feDo = 0;
        $file = $request->file('json_file');
        if($file!=null)
        {
            $content = file_get_contents($file);
            $sjondata = json_decode($content, true);

            foreach($sjondata as $key=>$data)
            {
                 if($data['products'])
                {

                    $slug = $this->getUniqueSlug($data['products']['name'], 'product');

                    $new = new Product();
                    $new->slug = $slug;
                    $new->category_id = $data['products']['category_id'];
                    $new->subcategory_id = $data['products']['subcategory_id'];
                    $new->gst = $data['products']['gst'] ? $data['products']['gst'] : 0;
                    $new->name = $data['products']['name'];
                    $new->average_ratings = 0;
                    $new->ratings_count = 0;
                    $new->status = "Active";
                    $new->vendor_id = $data['products']['vendor_id'];
                    $new->save();

                    $product_id = $new->id;

                }
                 if($data['price'])
                {
                    foreach($data['price'] as $prices)
                    {
                        $pDO = $pDO + 1;
                   
                        $price = new ProductPrice();
                        $price->product_id = $product_id;
                        $price->weight = $prices['weight'];
                        $price->price = $prices['price'];
                        $price->inventory = $prices['inventory'];
                         $price->display_order = $pDO;
                        $price->save();
                    }
                    
                    
                
                }
                if($data['image'] && $product_id!=null)
                {
                    foreach($data['image'] as $k=>$images)
                    {
                        $imgDo = $k + 1;
                       
                        $img = new ProductImage();
                        $img->product_id = $product_id;
                        $img->image = $images['file_name'];
                        $img->display_order = $imgDo;
                        $img->save();
                        if($imgDo==1)
                        {
                            $old = Product::where('id',$product_id)->first();
                            $old->thumbnail = $images['file_name'];
                            $old->save();
                        }
                    }
                }
            }
        }
        Toastr::success('Product Uploaded successfully', 'Message');
        return redirect(route('product.ViewBulkUpdate'));
       
       

    }
    
     public function delete(Request $request , $id)
    {
        \DB::statement('SET FOREIGN_KEY_CHECKS=0');
        $product = Product::find($id);
        $product->prices()->delete();
        $product->images()->delete();
        $product->specifications()->delete();
        $product->features()->delete();
        $product->carts()->delete();
        $product->orderdetails()->delete();
        $product->reviews()->delete();
        $product->wishlist()->delete();
        
        
        $product->delete();
          Toastr::success('Product Deleted successfully', 'Message');
            return redirect(route('product.list'));
    }

    

}
