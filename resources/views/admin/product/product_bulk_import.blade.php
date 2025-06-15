@extends('layouts.app')
@section('content')
<style type="text/css">

    @media screen and (min-device-width: 500px) {
        .toast {
            width: auto !important;
            max-width: 600px !important;
        }
    }

</style>
<div class="content-wrapper" style="min-height: 193px;">
    <section class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1>Product Bulk Upload</h1>
          </div>
        </div>
      </div>
    </section>
    <section class="content">
        <div class="container-fluid">
            <div class="row">
                <div class="col-md-5">
                    <div class="card card-primary">
                        <div class="card-header">
                            <h3 class="card-title">Choose File (.csv) </h3>
                        </div>
                        <form role="form" method="post" class="col-md-12"  enctype="multipart/form-data" action="{{ route('product.BulkUpdate') }}">
                            @csrf

                            <div class="form-group">
                                <label for="exampleInputEmail1">File</label>
                                <input type="file" accept=".csv" required name="csv_file" class="form-control" required>
                            </div>

                            <div class="card-footer">
                                <button type="submit" class="btn btn-primary">Update Bulk</button>
                            </div>
                        </form>
                    </div>
                </div>
                 <div class="col-md-5">
                    <div class="card card-primary">
                        <div class="card-header">
                            <h3 class="card-title">Choose File (.json) </h3>
                        </div>
                        <form role="form" method="post" class="col-md-12"  enctype="multipart/form-data" action="{{ route('product.json.BulkUpdate') }}">
                            @csrf

                            <div class="form-group">
                                <label for="exampleInputEmail1">File</label>
                                <input type="file" accept=".json" required name="json_file" class="form-control" required>
                            </div>

                            <div class="card-footer">
                                <button type="submit" class="btn btn-primary">Update Bulk</button>
                            </div>
                        </form>
                    </div>
                </div>
               
            </div>	
             <section class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1>Product Multiple Image  Upload</h1>
          </div>
        </div>
      </div>
    </section>
            
                  <div class="row">
                <div class="col-md-5">
                    <div class="card card-primary">
                        <div class="card-header">
                            <h3 class="card-title">Choose Multiple images </h3>
                        </div>
                        <form role="form" method="post" class="col-md-12"  enctype="multipart/form-data" action="{{ route('product.image.BulkUpdate') }}">
                            @csrf

                            <div class="form-group">
                                <label for="exampleInputEmail1">Images</label>
                                <input type="file" accept="image/*"  name="images[]" class="form-control" multiple required>
                            </div>

                            <div class="card-footer">
                                <button type="submit" class="btn btn-primary">Update Multiple Images</button>
                            </div>
                        </form>
                    </div>
                </div>
               
            </div>  
        </div>
    </section>
  </div>


  @endsection
  

                    