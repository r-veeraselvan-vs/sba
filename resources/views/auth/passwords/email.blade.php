@extends('layouts.app-front')
@section('content')
<main class="main account">
    <div class="page-header" style="background-image: url('/images/page-header.jpg'); background-color: #3C63A4;">
        <h1 class="page-title">Reset Password</h1>
    </div>
    <!-- End PageHeader -->
    <div class="col-md-12">
        <div class="row login-form">
            <div class="col-md-3"></div>
            <div class="login-popup col-md-6">
                <div class="form-box">
                    <h4>Reset Password</h4>
                    <div class="tab-pane active" id="signin">
                        <form class="login100-form" method="POST" action="{{ route('password.email') }}">
                            @csrf
                            <div class="form-group">
                                <label>Email</label>
                                <input class="form-control" type="text" name="email" placeholder="Email address...">
                            </div>
                            @error('email') <span style="color:red;">{{ $message }}</span> @enderror

                            <div class="form-footer">
                                <div class="form-checkbox">
                                    <input type="checkbox" class="custom-checkbox" id="signin-remember"
                                        name="signin-remember" />
                                </div>
                                <a href="{{ url('login') }}" class="lost-link font-secondary">Login</a>
                            </div>
                            <button type="submit" class="btn btn-primary btn-block">
                                Send Password Reset Link
                            </button>
                        </form>
                    </div>
                </div>
            </div>
            <div class="col-md-3"></div>
        </div>
    </div>
</main>

<style>
.login-popup {
    max-width: none;
}
</style>


@endsection