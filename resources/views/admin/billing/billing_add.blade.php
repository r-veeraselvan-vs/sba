@extends('layouts.app')
@section('content')
<div class="content-wrapper" style="min-height: 193px;">
    <section class="content-header">
        <div class="container-fluid">
            <div class="row mb-2">
                <div class="col-sm-6">
                    <h1>Add Billing </h1>
                </div>
            </div>
        </div>
    </section>
    <section class="content">
        <div class="container-fluid">
            <div class="invoice p-3 mb-3">

            <!-- product Lists -->
           
            <form action="{{ route('billing') }}" method="post">
                <div class="row">
                    <div class="col-12 table-responsive">
                        <table class="table table-striped" id="product_table">
                            <tr id="-1">
                                <th>#</th>
                                <th class="big-col">Product</th>
                                <th class="small-col">Qty</th>
                                <th class="small-col">Price</th>
                                <th class="small-col-b">Tax %</th>
                                <th class="small-col-b">Tax</th>
                                <th class="small-col">Subtotal</th>
                                <th></th>
                            </tr>
                            <tr id="0">
                                <td>1</td>
                                <td class="big-col">
                                    <input type="hidden" name="order_details[0][product_id]" id="product_id_0">
                                    <input type="hidden" name="order_details[0][offer_price]" id="offer_price_0">
                                    <input type="hidden" name="order_details[0][weight]" id="weight_0">
                                    <input type="hidden" name="order_details[0][total_weight]" id="total_weight_0">
                                    <select required name="order_details[0][product_price_id]" id="product_price_id_0" onChange="loadProduct(0)" class="select2 form-control" data-placeholder="Select Product" style="width: 100%;">
                                        <option value=""></option>
                                        @foreach($product_prices as $product_price)
                                            <option value="{{ $product_price->id }}">
                                                <b>
                                                    @if($product_price->product)
                                                        {{ $product_price->product->name }}
                                                    @else
                                                        N/A <!-- or any default value you want to show when product is null -->
                                                    @endif
                                                </b>  
                                                &nbsp;&nbsp;&nbsp;&nbsp; - {{ $product_price->matrix1 }} {{ $product_price->matrix2 }} ({{ $product_price->inventory }})
                                            </option>
                                        @endforeach
                                    </select>
                                </td>
                                <td class="small-col">
                                    <input required type="number" onKeyup="calculateTotal(0)" onChange="calculateTotal(0)" name="order_details[0][quantity]" min="1" id="quantity_0">
                                </td>
                                <td class="small-col">
                                    <input type="number" name="order_details[0][price]" id="price_0" class="read-only" readonly>
                                </td>
                                <td class="small-col-b">
                                    <input type="number" name="order_details[0][gst_percent]" id="gst_percent_0" class="read-only" readonly>
                                </td>
                                <td class="small-col-b">
                                    <input type="number" name="order_details[0][gst_amount]" id="gst_amount_0" class="read-only" readonly>
                                </td>
                                <td class="small-col d-flex">
                                    <input type="number" name="order_details[0][amount]" id="amount_0" class="read-only" readonly>
                                </td>
                                <td>
                                    <a href="#" onclick="remove(0);" id="delete_0"><span class="badge badge-danger"><i class="fas fa-trash"></i></span></a>
                                </td>
                            </tr>
                        </table>
                    </div>

                </div> 
                 <div class="add-button">
                <button type="button" onclick="add_product();" class="btn btn-primary btn-sm">Add Product</button>
            </div>
            <br>

                <div class="row customer-section">
                    <div class="col-9 row">
                        <div class="form-group col-md-8">
                            <label>Select Customer</label>
                            <div class="select2-purple">
                                <select required id="user_id" name="order[user_id]" onChange="getCustomer()" class="select2 form-control" data-placeholder="Select a Customer" style="width: 100%;">
                                    <!-- Render customer heres -->
                                </select>
                            </div>
                        </div>
                        <div class="form-group col-md-4 cust-btn">
                            <label for=""></label>
                            <div class="btn btn-sm btn-success" data-toggle="modal" data-target="#add_customer"><i class="fa fa-plus"></i></div>
                        </div>
                    </div>
                    <div class="col-3">
                        <div class="">
                            <table class="">
                                <tbody>
                                    <tr>
                                        <td>
                                            <label for="">Tax:</label>
                                            <input type="number" name="order[gst_amount]" class="box-size read-only tax" readonly>
                                        </td>
                                        <td>
                                            <label for="">Subtotal:</label>
                                            <input type="number" name="order[sub_total]" class="box-size read-only sub_total" readonly>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>

                <div class="row address-section">
                    <div class="col-12 row">
                        <div class="form-group col-md-3">
                            <label>Select Address</label>
                        </div>
                        <div class="form-group col-md-9">
                            <div class="btn btn-sm btn-success" data-toggle="modal" data-target="#add_address"><i class="fa fa-plus"></i></div>
                        </div>
                    </div>
                    <div class="col-12">
                        <div class="invoice-info row" id="render-address" >
                            <!-- render here -->
                        </div>
                    </div>

                </div> 
                <div class="row delivery-slot">
                    <div class="col-4">
                        <label for="">Delivery Date</label>
                        <select name="order[delivery_date]" id="delivery_date" class="form-control" required onChange="changeSlots()">                                           
                        </select>
                    </div>
                    <div class="col-4">
                        <label for="">Delivery Slot</label>
                        <select name="order[delivery_slot_id]" id="delivery_slot_id" class="form-control" required>                                           
                        </select>
                    </div>

                </div>

                <div class="row">
                    <div class="col-8 left-section">
                    </div>

                    <div class="col-4 right-section">
                        <div class="table-responsive">
                            <table class="table table-striped">
                                <tbody>
                                    <tr>
                                        <th style="width:50%">Subtotal:</th>
                                        <td>
                                            <input type="number" name="order[sub_total]" class="read-only sub_total" readonly>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th>Tax:</th>
                                        <td>
                                            <input type="number" name="order[tax]" class="read-only tax" readonly>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th>Shipping:</th>
                                        <td>
                                            <input required type="number" name="order[shipping_charge]" id="shipping_charge" class="read-only" readonly>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th>Total:</th>
                                        <td>
                                            <input type="number" name="order[net_amount]" id="net_amount" class="read-only" readonly>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>

                </div>
                <div class="row no-print">
                    <div class="col-12">
                        <button type="submit" class="btn btn-success float-right"> Place Order </button>
                    </div>
                </div>
            </form>

            <!-- Rough Used fields -->
            <input type="hidden" name="upcomming_slots" id="upcomming_slots">
            <!-- Rough Used fields -->
        </div>
    </div>
</div>
</section>
</div>

<script src="http://code.jquery.com/jquery-1.9.1.min.js"></script>
<link href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/2.0.1/css/toastr.css" rel="stylesheet"/>
<script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/2.0.1/js/toastr.js"></script>

<script>
    function add_product(){
        resetCustomerAndShipping();
        var key = parseFloat($('#product_table tr:last-child').attr('id')) + 1;
        var product_prices = @json($product_prices);
        var options = '';
        $.each(product_prices, function (key, val) {
            options += "<option value='"+val.id+"'>" +  (val.product ? val.product.name : 'Unknown') + ' &nbsp;&nbsp;&nbsp;&nbsp; - '+val.matrix1+' '+val.matrix2+' ('+ val.inventory +")</option>"
        });
        var add_product = '<tr id="'+key+'">'+
                            '<td>'+(key+1)+'</td>'+
                            '<td class="big-col">'+
                                '<input type="hidden" name="order_details['+key+'][product_id]" id="product_id_'+key+'">'+
                                '<input type="hidden" name="order_details['+key+'][offer_price]" id="offer_price_'+key+'">'+
                                '<input type="hidden" name="order_details['+key+'][weight]" id="weight_'+key+'">'+
                                '<input type="hidden" name="order_details['+key+'][total_weight]" id="total_weight_'+key+'">'+
                                '<select required name="order_details['+key+'][product_price_id]" id="product_price_id_'+key+'" onChange="loadProduct('+key+')" class="select2 form-control" data-placeholder="Select Product" style="width: 100%;">'+
                                    '<option value=""></option>'+options+
                                '</select>'+
                            '</td>'+
                            '<td class="small-col">'+
                                '<input required type="number" onKeyup="calculateTotal('+key+')" onChange="calculateTotal('+key+')" name="order_details['+key+'][quantity]" min="1" id="quantity_'+key+'">'+
                            '</td>'+
                            '<td class="small-col">'+
                                '<input type="number" name="order_details['+key+'][price]" id="price_'+key+'" class="read-only" readonly>'+
                            '</td>'+
                            '<td class="small-col-b">'+
                                '<input type="number" name="order_details['+key+'][gst_percent]" id="gst_percent_'+key+'" class="read-only" readonly>'+
                            '</td>'+
                            '<td class="small-col-b">'+
                                '<input type="number" name="order_details['+key+'][gst_amount]" id="gst_amount_'+key+'" class="read-only" readonly>'+
                            '</td>'+
                            '<td class="small-col">'+
                                '<input type="number" name="order_details['+key+'][amount]" id="amount_'+key+'" class="read-only" readonly>'+
                            '</td>'+
                            '<td>'+
                                '<a href="#" onclick="remove('+key+');" id="delete_'+key+'"><span class="badge bg-danger"><i class="fas fa-trash"></i></span></a>'+
                            '</td>'+
                        '</tr>';
                    $('#product_table').append(add_product);
                    selectRefresh();
    }

    function selectRefresh() {
        $('.select2').select2({
            tags: true,
            // allowClear: true,
            width: '100%'
        });
    }

    $(function () {
        selectRefresh();
        getCustomers();
    })

    function getCustomers() {
      $("#user_id").append('');
      $.ajax({
        type: 'GET',
        url: "{{ route('billing.customers') }}",
        success: function (data) {
            var customers = JSON.parse(data);
            // console.log('customers', customers)
            var options = "<option value=''></option>";
            $.each(customers, function (key, val) {
              options += "<option value='"+val.id+"'>" +  val.name +' &nbsp; &#8226; &nbsp; '+ val.mobile +' &nbsp; &#8226; &nbsp; ' + val.email + "</option>"
            });
            $("#user_id").append(options);
            // console.log('options', options)
        },
        error: function(data) { 
            console.log(data);
        }
      });
    }


    function getCustomer() {
      $("#render-address").html('');
      var id = $("#user_id").val();
      $.ajax({
        type: 'GET',
        url: "/admin/billing/customer/" + id,
        success: function (data) {
            var user = JSON.parse(data);
            if(user.addresses.length > 0){
              console.log('addresses', user.addresses)
              var adresses = user.addresses;
              var options = "";
              $.each(adresses, function (key, val) {
                  console.log('val', val)
                options += "<label class='labl' onClick='checkShipping()' id='address_id_"+val.id+"'>"+
                              "<input type='radio' name='order[address_id]' value='"+val.id+"' id='address_id' />"+
                              "<div class='add-cl'><b>"+(val.short_name ? val.short_name : val.city)+" - "+val.postcode+"</b><br>"+val.address+
                              "<div id='add_msg_"+val.id+"' class='add_msg'></div>"+
                              "</div>"+
                            "</label>";
              });
              $("#render-address").html(options);
            }else{
                alertMsg('error', 'Address not found.');
            }
        },
        error: function(data) { 
            console.log(data);
        }
      });
    }

    function loadProduct(key) {

        $('#price_'+key).val(0);
        $('#offer_price_'+key).val(0);
        $('#weight_'+key).val(0);
        $('#total_weight_'+key).val(0);
        resetCustomerAndShipping();

        var product_prices = @json($product_prices);
        console.log('product_prices', product_prices)
        var product_price_id = $('#product_price_id_'+key).val();
        var data = product_prices.filter(product_price => product_price.id == product_price_id)
        console.log('data', data)
        var product_price = data[0];
        console.log('product_price', product_price)

        var offer_price = product_price.offer_price ? product_price.offer_price : 0;
        var price = (offer_price > 0) ? offer_price : product_price.price;
        var gst_percent = product_price.product.gst;

        $('#product_id_'+key).val(product_price.product_id);
        $('#weight_'+key).val(product_price.weight);
        $('#offer_price_'+key).val(offer_price);
        $('#price_'+key).val(price);
        $('#gst_percent_'+key).val(gst_percent);

        // Check Inventory
        var inventory = product_price.inventory;
        $('#quantity_'+key).attr({ "max" : inventory });
        
        calculateTotal(key);
    }

    function calculateTotal(key){
        resetCustomerAndShipping();
        var price = $('#price_'+key).val();
        var quantity = $('#quantity_'+key).val();
        var weight = $('#weight_'+key).val();
        var total_weight = quantity * weight;
        // console.log('price', price, 'quantity', quantity)
        var amount = price * quantity;
        var gst_percent = $('#gst_percent_'+key).val();
        var gst_amount = (amount * gst_percent) / 100;
        $('#amount_'+key).val(amount);
        $('#gst_amount_'+key).val(gst_amount);
        $('#total_weight_'+key).val(total_weight);
        calculateOverallTotal();
    }

    function calculateOverallTotal(){
        var items = parseFloat($('#product_table tr:last-child').attr('id'));
        $('#items').val(items);
        var sub_total = 0;
        for(var i=0; i<=items; i++){
            var value = parseFloat($('#amount_'+i).val()) ? parseFloat($('#amount_'+i).val()) : 0;
            sub_total = parseFloat(sub_total) + value;
        }
        // console.log('sub_total', sub_total)
        $('.sub_total').val(sub_total);
        var shipping_charge = $('#shipping_charge').val() ? $('#shipping_charge').val() : 0;
        var tax = 0;
        for(var i=0; i<=items; i++){
            var gst_amount = parseFloat($('#gst_amount_'+i).val()) ? parseFloat($('#gst_amount_'+i).val()) : 0;
            tax = parseFloat(tax) + gst_amount;
        }
        $('.tax').val(tax);
        // var net_amount = parseFloat(shipping_charge) + parseFloat(sub_total) + parseFloat(tax);
        var net_amount = parseFloat(shipping_charge) + parseFloat(sub_total);
        $('#net_amount').val(net_amount);
    }

    function checkShipping() {
        var address_id = $("input[name='order[address_id]']:checked").val();
         console.log('address_id', address_id);
        if(address_id){
            console.log('address_id', address_id)
            var sub_total = $(".sub_total").val() ? $(".sub_total").val() : 0;

            $.ajax({
                type: 'GET',
                url: "/admin/billing/shipping/" + address_id + "/" + sub_total,
                success: function (data) {
                    var res = JSON.parse(data);
                    if(res){
                        var msgTag = '';
                        if(res.status == 'success'){
                            msgTag = '<span class="badge badge-success">'+res.msg+'</span>';
                        }else{
                            msgTag = '<span class="badge badge-danger">'+res.msg+'</span>';
                        }
                        alertMsg(res.status, res.msg);

                        $('.add_msg').html('')
                        $('#shipping_charge').val(res.shipping_charge)
                        calculateOverallTotal()

                        // Delivery Slot Functions
                        $("#delivery_date").empty();
                        $("#delivery_slot_id").empty();
                        var upcomming_slots = res.upcomming_slots;
                        $('#upcomming_slots').val(JSON.stringify(upcomming_slots))
                        var options = (upcomming_slots.length > 0) ? "<option value=''> -- Select Date -- </option>" : '';
                        $.each(upcomming_slots, function (key, val) {
                            options += "<option value='"+val.date+"'>" +  val.date + ' (' + val.day + ")</option>"
                        });
                        $("#delivery_date").append(options);
                        $('#add_msg_'+res.address_id).html(msgTag)
                    }
                },
                error: function(data) { 
                    console.log(data);
                }
            });
        }
    }

    function changeSlots(){
        $('#delivery_slot_id').empty();
        var delivery_date = $('#delivery_date').val();
        var up_slots = $('#upcomming_slots').val();
        var upcomming_slots = JSON.parse(up_slots);
        console.log('upcomming_slots', upcomming_slots)
        Object.keys(upcomming_slots).forEach(function(key) {
            var val = upcomming_slots[key];
            if(val.date == delivery_date){
                console.log(val.date, delivery_date)
                var slots = val.slots;
                $('#delivery_slot_id').append('<option value="">-- Select Slot --</option>');
                slots.forEach( function(item, index){
                    console.log('item', item)
                    if(item.default == 'Yes'){
                        $('#delivery_slot_id').append('<option value="'+item.id+'">Default Slot</option>');
                    }else{
                        $('#delivery_slot_id').append('<option value="'+item.id+'">'+item.start+' - '+item.end+'</option>');
                    }
                }); 
            }
        });
    }

    function resetCustomerAndShipping(){
        $('#user_id').empty();
        getCustomers();
        $("#render-address").html('');
        $('#delivery_date').empty();
        $('#delivery_slot_id').empty();
    }

    function remove(key){
        $('#delete_'+key).closest('tr').remove();
        resetCustomerAndShipping();
        calculateOverallTotal();
    }
    
    function addCustomer() {
        var name = $('#name').val();
        var email = $('#email').val();
        var mobile = $('#mobile').val();

        $.ajax({
        type: 'POST',
        data: { name: name, email: email, mobile: mobile },
        url: "{{ route('billing.create.user') }}",
        success: function (data) {
            var res = JSON.parse(data);
            alertMsg(res.status, res.msg);
            if(res.status == 'success'){
                $('#name').val('');
                $('#email').val('');
                $('#mobile').val('');
                $('#add_customer').modal('hide');
                resetCustomerAndShipping();
            }
        },
        error: function(data) { 
            console.log(data);
        }
      });
    }

    function alertMsg(status, msg){
        toastr.remove();
        if(status == 'error'){
            toastr.error(msg, 'Error');
        }else{
            toastr.success(msg, 'Success');
        }
    }

    function addAddress(){
        var user_id = $('#user_id').val();
        var address = $('#address').val();
        var building_name = $('#building_name').val();
        var city = $('#city').val();
        var short_name = $('#short_name').val();
        var route = $('#route').val();
        var postcode = $('#postcode').val();

        $.ajax({
        type: 'POST',
        data: { user_id, address, building_name, city, short_name, route, postcode },
        url: "{{ route('billing.create.address') }}",
        success: function (data) {
            var res = JSON.parse(data);
            var msg = (res.msg == 'The user id field is required.') ? 'Select Customer.' : res.msg;
            alertMsg(res.status, res.msg);
            if(res.status == 'success'){
                $('#address').val('');
                $('#building_name').val('');
                $('#city').val('');
                $('#short_name').val('');
                $('#route').val('');
                $('#postcode').val('');
                $('#add_address').modal('hide');
                getCustomer();
            }
        },
        error: function(data) { 
            console.log(data);
        }
      });
    }


</script>

<style>
    .select2-selection__rendered{
        line-height: 17px !important;
    }

    /* readonly */
    .read-only{
        background-color : #EBEBE4;
        border : 1px solid #ABADB3;
        padding : 2px 1px;
        color : rgb(84, 84, 84);
        text-align:right;
    }
    .small-col input {
        width: 100px;
    }
    .small-col-b input {
        width: 80px;
    }
    td.big-col {
        width: 800px;
    }

    /* Address section  */
    .row.address-section {
        background: #f2f2f2;
        padding: 5px;
    }

    .labl {
        display : block;
        background: #f9eccc;
        margin: 5px;
        width: 31%;
    }
    .labl:hover{
        border: 1px solid #fbc648;
    }
    .labl p{
        font-size: 12px;
        font-weight: 400;
        padding: 3px;
    }
    .labl > input{ 
        visibility: hidden; 
        position: absolute; 
    }
    .labl > input + div{ /* DIV STYLES */
        cursor:pointer;
        border:2px solid transparent;
    }
    .labl > input:checked + div{ /* (RADIO CHECKED) DIV STYLES */
        background-color: #fbc648;
    }
    label:not(.form-check-label):not(.custom-file-label){
        font-weight: none !important;
    }
    .add-cl {
        font-weight: 400;
        font-size: 12px;
        padding: 5px;
    }

    /* Customer section  */
    .row.customer-section {
        background: #949495;
    }
    input.box-size {
        width: 100%;
    }
    .trash-btn{
        color: red;
        padding-left: 10px;
        padding-top: 5px;
        font-size: 17px;
    }
    .trash-btn:hover {
        text-shadow: 1px 1px 1px #d9d9d7;
        font-size: 16px;
    }
    .cust-btn{
        margin-top: 29px;
    }
    .badge-danger{
        background-color: red !important;
    }
    .toast-error{
        background-color: red !important;
    }
    /* Delivery Slot */
    .row.delivery-slot {
        background-color: #d9d9d7;
        padding: 10px;
    }

    /* left section */
    .left-section {
        background: #f2f2f2;
    }
    .right-section{
        background: #ebebe4;
    }
</style>


  <!-- Add Customer -->
    <div class="modal fade" id="add_customer">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h4 class="modal-title">Add Customer</h4>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="form-group">
                        <label for="name">Name</label>
                        <input type="text" required class="form-control" name="name" id="name" placeholder="Enter Name">
                    </div>
                    <div class="form-group">
                        <label for="email">Email</label>
                        <input type="email" required class="form-control" name="email" id="email" placeholder="Enter Email">
                        <span style="font-size: 12px;">Note: Email's which like <i style="color: blue; "><b>******@directfarms.biz</b></i> should not receive emails.</span>
                    </div>

                    <div class="form-group">
                        <label for="mobile">Mobile</label>
                        <input type="number" required class="form-control" name="mobile" id="mobile" placeholder="Enter Mobile">
                    </div>
                </div>

                <div class="card-footer">
                    <button type="submit" class="btn btn-primary" onClick="addCustomer()">Save</button>
                </div>
            </div>
        </div>
    </div>
  <!-- Add Customer -->

  <!-- Add Address -->
    <div class="modal fade" id="add_address">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="modal-header">
                    <h4 class="modal-title">Add Address</h4>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">

                    <div class="row">
                        <div class="col-md-6">
                            <div>
                                <div>
                                    <label>Address *</label>
                                    <input type="text" class="form-control" name="address" id="address" value="" required>
                                </div> 
                                <div>
                                    <label>Door No./Apartment (Building Name) *</label>
                                    <input type="text" class="form-control" required name="building_name" id="building_name" value="" >
                                </div>
                            </div>           
                            <div>
                                <label>City *</label>
                                <input type="text" class="form-control" name="city" id="city" value="" required="">
                            </div>
                        </div>
                        <div class="col-md-6"> 
                            <div>
                                <label>Save As (Short Name) *</label>
                                <input type="text" class="form-control" name="short_name" required id="short_name" placeholder="ie: Home, Office, etc..." value="">
                            </div>
                            <div>
                                <label>Route / Landmark</label>
                                <input type="text" class="form-control" name="route" id="route" value="">
                            </div>
                            <div>
                                <label>Post Code *</label>
                                <input type="number" class="form-control" name="postcode" id="postcode" value="" required>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="card-footer">
                    <button type="submit" class="btn btn-primary" onClick="addAddress()">Save</button>
                </div>
            </div>
        </div>
    </div>
  <!-- Add Address -->
@endsection
