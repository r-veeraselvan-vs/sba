@extends('layouts.app-front')
@section('content')
<main class="main account">
    <div class="page-header" style="background-image: url('images/page-header.jpg'); background-color: #3C63A4;">
        <h1 class="page-title">{{ Session::get('form')  }} / @if(Session::get('form') == 'login') SignUp @else Login @endif</h1>
    </div>
    <!-- End PageHeader -->
    <div class="col-md-12" >
        <div class="row login-form text-center">
            <div class="login-popup col-md-4 mx-auto">
                <div class="form-box">
                    <div class="card">
                        <div class="card-header">
                            <label>Choose Login Method</label>
                        </div>
                        <div class="card-body">
                            <a href="{{ route('email.login') }}">
                                <button class="btn btn-primary btn-block mb-3" type="submit" style="border-radius: 10px; box-shadow: 0 2px 4px rgba(0, 0, 0, 0.2);">Login with Email</button>
                            </a>

                            <div style="margin: 10px 0; text-align: center; font-weight: bold; color: #6c757d;">(or)</div>
                            
                            <a href="{{ route('otp.login') }}">
                                <button class="btn btn-primary btn-block mb-3" type="submit" style="border-radius: 10px; box-shadow: 0 2px 4px rgba(0, 0, 0, 0.2);">Login with OTP</button>
                            </a>
                        </div>
                    </div>
                </div>
                <div class="form-footer col-md-12 mx-auto">
                    <a href="{{ route('otp.login') }}" class="lost-link font-secondary">Register!</a>
                </div>
            </div>
        </div>
    </div>
</main>

<style>
.login-popup{
    max-width: none;
}
</style>

@if (count($errors) > 0)
<script type="text/javascript">
$(document).ready(function() {
    $('#exampleModal2').modal('show');
});
</script>
@endif

@endsection