@extends('layouts.app')
@section('content')
<div class="content-wrapper" style="min-height: 193px;">
    <section class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1>Product Price Update</h1>
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
                        <form role="form" method="post" class="col-md-12"  enctype="multipart/form-data" action="{{ route('product.import') }}">
                            @csrf

                            <div class="form-group">
                                <label for="exampleInputEmail1">File</label>
                                <input type="file" accept=".csv" required name="csv_file" class="form-control" required>
                            </div>

                            <div class="card-footer">
                                <button type="submit" class="btn btn-primary">Update Price</button>
                            </div>
                        </form>
                    </div>
                </div>
                <div class="col-md-7">
                    <div class="card">
                        <div class="card-body">
                            <div class="callout callout-success">
                                <h5>Validations!</h5>
                            </div>
                            @if(count($validate) > 0)
                                <br>
                                <div class="alert alert-warning">
                                <h5><i class="icon fas fa-ban"></i> Validation Error!</h5>
                                    @foreach($validate as $i => $v)
                                        <p><b>Item [{{ $i }}]</b></p>
                                        @foreach($v as $key => $value)
                                        <p>{{ $value }}</p>
                                        @endforeach
                                    @endforeach
                                </div>
                            @endif
                            <?php if($d){ echo '<br><pre>'; print_r($d); echo '</pre>'; } ?>
                        </div>
                    </div>
                </div>
            </div>	
        </div>
    </section>
  </div>


  @endsection
  

                    