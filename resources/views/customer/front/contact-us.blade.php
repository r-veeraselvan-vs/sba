@extends('layouts.app-front')
@section('content')

<main class="main">
    <div class="page-header" style="background-image: url(images/page-header.jpg)">
        <h1 class="page-title">Get in touch</h1>
    </div>
    <div class="page-content mt-10 pt-4">
        <section class="contact-section">
            <div class="container">
                <div class="row">
                    <div class="col-lg-3 col-md-4 col-xs-5 ls-m pt-3">
                        <h2 class="font-weight-bold text-uppercase ls-m mb-2">Contact us</h2>
                        <p>Looking for help? Fill the form and get products directly from farmers.</p>

                        <h4 class="mb-1 text-uppercase">Madurai kadai </h4>
                        <p>
No 7 North gate SS colony <br>
Madurai 625016</p>

                        <h4 class="mb-1 text-uppercase">Phone</h4>
                        <p><a href="tel:#">75501 52595</a></p>

                        <h4 class="mb-1 text-uppercase">Social Links</h4>
                        <p>
                            <div class="social-links mt-1">
                                <a href="#" class="social-link social-facebook fab fa-facebook-f"></a>
                                <a href="#" class="social-link social-twitter fab fa-twitter"></a>
                                <a href="#" class="social-link social-linkedin fab fa-linkedin-in"></a>
                            </div>
                        </p>
                    </div>

                    <div class="col-lg-9 col-md-8 col-xs-7">
                        <form class="ml-lg-2 pt-8 pb-10 pl-4 pr-4 pl-lg-6 pr-lg-6 grey-section" action="{{ route('contact') }}" method="post">
                            <input type="hidden" name="_token" value="{{ csrf_token() }}">
                            <input type="hidden" name="recaptcha" id="recaptcha">
                        
                            @if(Session::has('success'))
                                <div style="color: green;">We have received your enquiry. Our team will get back to you at the earliest. Thank you.</div><br>
                            @elseif( Session::has( 'errors' ))
                                <div style="color: red;">Recaptcha error</div><br>
                            @endif
                            <h3 class="ls-m mb-1">Let’s Connect</h3>
                            <p class="text-grey">Your email addres will not be published. Required fields are
                                marked *</p>
                            <div class="row">
                                <div class="col-md-6 mb-4">
                                    <input class="form-control" name="name" type="text" placeholder="Name *" required>
                                </div>
                                <div class="col-md-6 mb-4">
                                    <input class="form-control" name="email" type="email" placeholder="Email *" required>
                                </div>
                                <div class="col-12 mb-4">
                                    <textarea class="form-control" name="message" required
                                        placeholder="Your Message *"></textarea>
                                </div>
                            </div>
                            
                            <button class="btn btn-md btn-primary mb-2">Send Message</button>
                        </form>
                    </div>
                </div>
            </div>
        </section>
        <!-- End About Section-->
        <br>

        <!-- Google Maps - Go to the bottom of the page to change settings and map location. -->
        <div class="grey-section google-map" style="height: 386px">
        <!-- <iframe
            width="100%"
            height="450"
            style="border:0"
            loading="lazy"
            allowfullscreen
            src="https://www.google.com/maps/embed/v1/place?key=AIzaSyBOtBm_jImkho72J9MW43QL4y1r5CzAiH8
                &q=Space+Needle,Seattle+WA">
        </iframe> -->
       <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3930.078928854172!2d78.09594907466366!3d9.927384674280752!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3b00cf6f4261b813%3A0xe71a2f6ec8b3af85!2s7%2C%20North%20Gate%2C%20Kalavasal%2C%20S%20S%20Colony%2C%20Madurai%2C%20Tamil%20Nadu%20625016!5e0!3m2!1sen!2sin!4v1697725985593!5m2!1sen!2sin" width="100%" height="450" style="border:0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>
        </div>
        <!-- End Map Section -->
    </div>
</main>
<script src="https://www.google.com/recaptcha/api.js?render=6LcOoQAbAAAAALucyAM6im2uCbjuvq6wOeGHjYWV"></script>
<script>
         grecaptcha.ready(function() {
             grecaptcha.execute('6LcOoQAbAAAAALucyAM6im2uCbjuvq6wOeGHjYWV', {action: 'contact'}).then(function(token) {
                if (token) {
                  document.getElementById('recaptcha').value = token;
                }
             });
         });
</script>
@endsection