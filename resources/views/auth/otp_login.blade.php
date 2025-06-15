@extends('layouts.app-front')
@section('content')
<main class="main account">
    <div class="page-header" style="background-image: url('images/page-header.jpg'); background-color: #3C63A4;">
        <h1 class="page-title">{{ Session::get('form')  }} / @if(Session::get('form') == 'login') SignUp @else Login @endif</h1>
    </div>
    <!-- End PageHeader -->
    <div class="col-md-12">
        <div class="row login-form text-center">
            <div class="login-popup col-md-4 mx-auto">
                <div class="form-box">
                    <h4>Login with OTP</h4>
                    <div class="tab-pane active" id="signin">
                        <form id="sendOTPForm" action="{{ route('otp.send') }}" method="post">
                            <div class="form-group">
                                <label for="mobile">Mobile Number:</label>
                                <input type="text" class="form-control" id="mobile" name="mobile" value="{{ Session::get('otp_mobile') }}" required />
                            </div>
                            <button id="sendOTPBtn" class="btn btn-primary btn-block" type="submit">Send OTP</button>
                        </form>
                    </div>

                    @if(Session::has('otp_mobile') && Session::has('otp'))
                    <div class="tab-pane" id="verify">
                        <form action="{{ route('otp.verify') }}" method="post">
                            <div class="form-group">
                                <label for="otp">Enter OTP:</label>
                                <input type="text" class="form-control" id="otp" name="otp" required />
                            </div>
                            <button class="btn btn-primary btn-block" type="submit">Verify OTP</button>
                        </form>
                    </div>
                    @endif

                    @if(Session::get('mobile_exists') === false)
                    <div class="tab-pane active" id="register">
                        <form action="{{ route('register') }}" method="post">
                            <div class="form-group">
                                <label for="singin-email">Name:</label>
                                <input type="text" class="form-control" id="name" name="name"
                                    required />
                                    @if(Session::get('form') == 'signup') 
                                        @error('name') <span style="color:red;">{{ $message }}</span> @enderror 
                                    @endif
                            </div>

                            <div class="form-group">
                                <label for="singin-email">Your email address:</label>
                                <input type="email" class="form-control" id="email" name="email"
                                    required />
                                    @if(Session::get('form') == 'signup') 
                                        @error('email') <span style="color:red;">{{ $message }}</span> @enderror 
                                    @endif
                            </div>

                            <div class="form-group" style="display: none;">
                                <label for="singin-email">Mobile Number:</label>
                                <input type="text" class="form-control" id="mobile" name="mobile" value="{{ Session::get('otp_mobile') }}"
                                    required />
                                    @if(Session::get('form') == 'signup') 
                                        @error('mobile') <span style="color:red;">{{ $message }}</span> @enderror 
                                    @endif
                            </div>

                            <div class="form-group">
                                <label for="singin-password">Password:</label>
                                <input type="password" class="form-control" id="password"
                                    name="password" required />
                                    @if(Session::get('form') == 'signup') 
                                        @error('password') <span style="color:red;">{{ $message }}</span> @enderror 
                                    @endif
                            </div>
                            <button class="btn btn-primary btn-block" type="submit">Sign up</button>
                        </form>
                    </div>
                    @endif
                    <div class="form-footer mx-auto">
                        <a href="{{ route('email.login') }}" class="lost-link font-secondary">Login with Email!</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</main>

<style>
    .login-popup {
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
<script>
    // Function to toggle between "Send OTP" and "Resend OTP" buttons
    function toggleSendOTPButton() {
        var sendOTPBtn = document.getElementById('sendOTPBtn');
        if (sendOTPBtn) {
            sendOTPBtn.innerText = "Resend OTP";
        }
    }

    // Add event listener to the OTP verification form to toggle the button when it's visible
    document.addEventListener('DOMContentLoaded', function() {
        var verifyPane = document.getElementById('verify');
        if (verifyPane) {
            toggleSendOTPButton();
        }
    });
</script>

@endsection