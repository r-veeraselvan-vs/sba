@extends('layouts.app')
@section('content')
<div class="content-wrapper" style="min-height: 193px;">
    <section class="content-header">
        <div class="container-fluid">
            <div class="row mb-2">
                <div class="col-sm-6">
                    <h1>Customer Edit</h1>
                </div>
            </div>
        </div>
    </section>
    <section class="content">
        <div class="container-fluid">
            <div class="col-md-5">
                <div class="card">

                    <form role="form" method="post" class="col-md-12" enctype="multipart/form-data"
                        action="{{ route('customer.update') }}">
                        @csrf
                        <input type="hidden" name="user_id" value="{{ $customer->user_id }}">

                        <div class="form-group">
                            <label for="exampleInputEmail1">Shipping Excluded</label>
                            <div class="row">
                                <div class="form-check">
                                    <input class="form-check-input" type="radio" @if($customer->shipping_excluded == 'Yes')
                                    checked @endif value="Yes" name="shipping_excluded">
                                    <label class="form-check-label">Yes</label>
                                </div>
                                <div class="form-check">
                                    <input class="form-check-input" type="radio" @if($customer->shipping_excluded == 'No')
                                    checked @endif value="No" name="shipping_excluded">
                                    <label class="form-check-label">No</label>
                                </div>
                            </div>
                        </div>

                        <div class="card-footer">
                            <button type="submit" class="btn btn-primary">Update</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
</div>
</section>
</div>

@endsection
