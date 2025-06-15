@extends('layouts.app-front')
@section('content')
<main class="main account">
    <div class="page-header" style="background-image: url('images/page-header.jpg'); background-color: #3C63A4; display: none;">
        <h1 class="page-title">{{ Session::get('form')  }} / @if(Session::get('form') == 'login') SignUp @else Login @endif</h1>
    </div>
    <!-- End PageHeader -->
    <div class="col-md-12" >
        <div class="row login-form text-center">
            <div class="login-popup col-md-4 mx-auto">
                <div class="form-box">
                    <h4>Login with Email</h4>
                    <div class="tab-pane active" id="signin">
                        <form action="{{ route('login.new') }}" method="post">
                            <div class="form-group">
                                <label for="singin-email">Email address:</label>
                                <input type="email" class="form-control" id="singin-email" name="email"
                                    required />
                                    @if(Session::get('form') == 'login') 
                                        @error('email') <span style="color:red;">{{ $message }}</span> @enderror 
                                    @endif
                            </div>
                            <div class="form-group">
                                <label for="singin-password">Password:</label>
                                <input type="password" class="form-control" id="singin-password"
                                    name="password" required />
                                    @if(Session::get('form') == 'login') 
                                        @error('password') <span style="color:red;">{{ $message }}</span> @enderror 
                                    @endif
                            </div>
                            <div class="form-footer">
                                <a href="{{ route('otp.login') }}" class="lost-link font-secondary">Register!</a>
                                <a href="{{ route('otp.login') }}" class="lost-link font-secondary">Login with OTP!</a>
                                <a href="{{ url('password/reset') }}" class="lost-link font-secondary">Lost your password?</a>
                            </div>
                            <button class="btn btn-primary btn-block" type="submit">Sign in</button>
                        </form>
                    </div>
                        <div class="form-choice text-center" style="display: none;">
                            <label class="font-secondary">Sign in with social account</label>
                            <div class="social-links">
                                <a href="{{ route('social.login', ['provider' => 'facebook']) }}" class="social-link social-facebook fab fa-facebook-f"></a>
                                <!-- <a href="{{ route('social.login', ['provider' => 'twitter']) }}" class="social-link social-twitter fab fa-twitter"></a> -->
                                <a href="{{ route('social.login', ['provider' => 'google']) }}" class="social-link social-google fab fa-google"></a>
                            </div>
                            @if ($errors->any())
                                @foreach ($errors->all() as $error)
                                    <div style="color:red;">{{ $error }}</div>
                                @endforeach
                            @endif
                        </div>
                        <!-- Socialite Include -->
                     {{-- @include('auth.social') --}}
                        <!-- Socialite Include -->
                    </div>
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