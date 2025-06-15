@extends('layouts.app')
@section('content')

<div class="content-wrapper">
    <section class="content-header">
        <div class="container-fluid">
            <div class="row mb-2">
                <div class="col-sm-6">
                    <h1>Settings</h1>
                </div>
            </div>
        </div>
    </section>
    <section class="content">
        <div class="container-fluid">
            <div class="row">
                <div class="col-md-4">
                    <div class="card card-primary">
                        <div class="card-header">
                            <h3 class="card-title">Settings</h3>
                        </div>

                        @csrf

                        @if($settings)
                            <form role="form" method="post" class="col-md-12"
                                action="{{ route('setting.update') }}" enctype="multipart/form-data">
                                <div class="card-body">
                                    <div class="form-group">
                                        <label for="exampleInputEmail1">Minimum Order Amount</label>
                                        <input type="number" min="0" class="form-control" name="minimum_order_amount"
                                           value="{{ $settings->minimum_order_amount }}" placeholder="Enter Minimum Order Amount" required="">
                                        @if($errors->has('minimum_order_amount'))
                                            <span class="error" for="site"
                                                style="display: inline-block;color:red;">{{ $errors->first('minimum_order_amount') }}</span>
                                        @endif
                                    </div>
                                    <div class="form-group">
                                        <label for="exampleInputEmail1">Online Payment</label>
                                        <div class="row">
                                            <div class="form-check">
                                                <input class="form-check-input" type="radio" @if($settings->online_payment == 'Yes') checked @endif value="Yes" name="online_payment">
                                                <label class="form-check-label">Yes</label>
                                            </div>
                                            <div class="form-check">
                                                <input class="form-check-input" type="radio" @if($settings->online_payment == 'No') checked @endif value="No" name="online_payment">
                                                <label class="form-check-label">No</label>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="card-footer">
                                    <button type="submit" class="btn btn-primary">Update</button>
                                </div>
                            </form>
                        @else
                            <form role="form" method="post" class="col-md-12"
                                action="{{ route('setting.update') }}" enctype="multipart/form-data">
                                <div class="card-body">
                                    <div class="form-group">
                                        <label for="exampleInputEmail1">Minimum Order Amount</label>
                                        <input type="number" min="0" class="form-control" name="minimum_order_amount"
                                            placeholder="Enter Minimum Order Amount" required="">
                                        @if($errors->has('minimum_order_amount'))
                                            <span class="error" for="site"
                                                style="display: inline-block;color:red;">{{ $errors->first('minimum_order_amount') }}</span>
                                        @endif
                                    </div>
                                </div>
                                <div class="card-footer">
                                    <button type="submit" class="btn btn-primary">Save</button>
                                </div>
                            </form>
                        @endif
                    </div>
                </div>
            </div>
        </div>
    </section>
</div>
@endsection
