@extends('layouts.app-front')
@section('content')
<main class="main account">
    <div class="page-header" style="background-image: url('/images/page-header.jpg'); background-color: #3C63A4;">
        <h1 class="page-title">My Account</h1>
    </div>
    <!-- End PageHeader -->
    <div class="page-content mt-10 mb-10">
        <div class="container pt-1">
            <div class="tab tab-vertical">
                <!-- Side Menu -->
                @include('customer.back.common.sidebar')
                <!-- Side Menu -->

                <div class="tab-content">

                    <!-- my profile -->
                    <div class="tab-pane active in" id="profile">

                        @if(Session::has('success'))
                        <div class="alert alert-success" role="alert">{{ Session::get('success') }}</div> <br>
                        @endif
                        @if(Session::has('error'))
                        <div class="alert alert-danger" role="alert">{{ Session::get('error') }}</div> <br>
                        @endif

                        <form action="{{ route('customer.profile.update') }}" method="post" class="form">
                            <h5>My Profile</h5>
                            <div class="row">
                                <div class="col-sm-6">
                                    <label>Name *</label>
                                    <input type="text" class="form-control" name="name"
                                        value="{{ ucfirst($profile->name) }}" required="">
                                </div>
                                <div class="col-sm-6">
                                    <label>Email</label>
                                    <input type="text" class="form-control" name="email" value="{{ $profile->email }}"
                                        disabled>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-sm-6">
                                    <label>Mobile *</label>
                                    <input type="text" class="form-control" name="mobile" value="{{ $profile->mobile }}"
                                        required="">
                                </div>
                            </div>

                            @if(Auth::user()->login_type == 'Web')
                                <h5>Change Password</h5>

                                <label>Current password (leave blank to leave unchanged)</label>
                                <input type="password" class="form-control" name="current_password">

                                <label>New password (leave blank to leave unchanged)</label>
                                <input type="password" class="form-control" name="password">

                                <label>Confirm new password</label>
                                <input type="password" class="form-control" name="password_confirmation">
                            @endif

                            <button type="submit" class="btn btn-primary btn-reveal-right">SAVE CHANGES <i
                                    class="d-icon-arrow-right"></i></button>
                        </form>
                    </div>
                    <!-- my profile -->
                </div>
            </div>
        </div>
    </div>
</main>

@endsection