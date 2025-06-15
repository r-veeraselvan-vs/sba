@extends('layouts.app')
@section('content')
<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <div class="content-header">
        <div class="container-fluid">
            <div class="row mb-2">
                <div class="col-sm-6">
                    <h1 class="m-0 text-dark">Customer Requested Products</h1>
                </div>
            </div>
        </div>
    </div>
    <!-- /.content-header -->

    <div class="col-md-12">
        <div class="card">
            <div class="card-body">
                <div class="tab-content">

                    <!-- main Service -->
                    <div class="tab-pane active">
                        <form action="" method="post" class="filter-custom">
                            <label for="">Start Date: </label>
                            <input type="date" name="start_date" id="" value="{{ $start_date }}">
                            <label for=""> End Date: </label>
                            <input type="date" name="end_date" id="" value="{{ $end_date }}">
                            <input type="submit" value="Filter">
                        </form>
                        <style>
                            .filter-custom{
                                padding: 20px;
                                background: #ececec;
                                margin-bottom: 10px;
                            }
                        </style>
                        <table id="export" class="table">
                            <thead>
                                <tr>
                                    <th>Sl No</th>
                                    <th>User Name</th>
                                    <th>Requested Products</th>
                                </tr>
                            </thead>
                            <tbody>
                                @foreach ($requestedproducts_details as $i => $crp)
                                <tr>
                                    <td>{{ $i+1 }}</td>
                                    <?php
                                        $user = \App\User::where('id', $crp->user_id)->first();
                                    ?>
                                    <td>{{ $user->name }}</td>
                                    <td>{{ $crp->required_product }}</td>
                                </tr>
                                @endforeach
                            </tbody>
                        </table>
                    </div>


                </div>
            </div>
        </div>
    </div>

</div>

<script>
    $(document).ready(function() {
        var date = "{{ date('d-m-Y') }}";
        $('#requestedproducts_summary').DataTable( {
            dom: 'Blfrtip',
            buttons: [ { extend: 'excel', title: 'Requested_Products_Summary_' + date } ],
            responsive: true,
            autoWidth: false,
            order: [[ 1, "asc" ]]
        } );
        $('.dt-button').html('<i class="fa fa-download" aria-hidden="true"></i> Export to Excel');
    });
</script>

<style>
 .dt-button{
    color: #fff;
    background-color: #1050AF;
    border-color: #1050AF;
    box-shadow: none;
    display: inline-block;
    font-weight: 400;
    text-align: center;
    vertical-align: middle;
    cursor: pointer;
    border: 1px solid transparent;
    padding: .375rem .75rem;
    font-size: 1rem;
    line-height: 1.5;
    border-radius: .25rem;
    transition: color .15s ease-in-out,background-color .15s ease-in-out,border-color .15s ease-in-out,box-shadow .15s ease-in-out;
 }
 .dt-button:hover{
    color: #fff;
    background-color: #0069d9;
    border-color: #1050AF;
 }

 </style>

@endsection