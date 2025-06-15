<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0">
    <title > {{ @$title ? @$title.' | ' : '' }} {{ config("app.name") ? config("app.name") : 'Madurai Kadai' }}</title>

    <meta name="keywords" content="{{ @$title }}" id="keywords" />
    <meta name="description" content="{{ @$title }}" id="description">

    <!-- Favicon -->
    <link rel="icon" type="image/png" href="{{ asset('images/icons/favicon.png') }}">

    <script>
        WebFontConfig = {
            google: {
                families: ['Open+Sans:400,600,700', 'Poppins:400,600,700']
            }
        };
        (function(d) {
            var wf = d.createElement('script'),
                s = d.scripts[0];
            wf.src = '/js/webfont.js';
            wf.async = true;
            s.parentNode.insertBefore(wf, s);
        })(document);
    </script>



       <link rel="stylesheet" type="text/css" href="{{ asset('assets/vendor/fontawesome-free/css/all.min.css') }}">
    <link rel="stylesheet" type="text/css" href="{{ asset('assets/vendor/animate/animate.min.css') }}">

    <!-- Plugins CSS File -->
    <link rel="stylesheet" type="text/css" href="{{ asset('assets/vendor/magnific-popup/magnific-popup.min.css') }}">
    <link rel="stylesheet" type="text/css" href="{{ asset('assets/vendor/owl-carousel/owl.carousel.min.css') }}">
    <link rel="stylesheet" type="text/css" href="{{ asset('assets/vendor/photoswipe/photoswipe.min.css') }}">
    <link rel="stylesheet" type="text/css" href="{{ asset('assets/vendor/photoswipe/default-skin/default-skin.min.css') }}">

    <link rel="stylesheet" type="text/css" href="{{ asset('css/style.min.css') }}">
    <link rel="stylesheet" type="text/css" href="{{ asset('css/demo1.min.css') }}">
    <style>
        .carousel-inner>.item>a>img, .carousel-inner>.item>img, .img-responsive, .thumbnail a>img, .thumbnail>img {
            aspect-ratio: 501 / 173;
    object-fit: cover;
        }
        .owl-carousel .owl-item img {
    display: block;
    width: 100%;
    aspect-ratio: 1000 / 563;
    object-fit: contain;
}
.product-media img {
    display: block;
    width: 100%;
    height: auto;
    transition: all .5s;
    aspect-ratio: 1000 / 563;
    object-fit: contain;
}
    </style>
</head>

<body class="home">
    <!-- <div class="loading-overlay">
        <div class="bounce-loader">
            <div class="bounce1"></div>
            <div class="bounce2"></div>
            <div class="bounce3"></div>
            <div class="bounce4"></div>
        </div>
    </div> -->
    <div class="page-wrapper">
        <h1 class="d-none">Thought Feast</h1>
        @yield('content')
    </div>

    <!-- Scroll Top -->
    <a id="scroll-top" href="#top" title="Top" role="button" class="scroll-top"><i class="fas fa-chevron-up"></i></a>


</body>

<!-- Plugins JS File -->
 <script src="{{ asset('assets/vendor/jquery/jquery.min.js') }}"></script>
<script src="{{ asset('assets/vendor/sticky/sticky.min.js') }}"></script>
<script src="{{ asset('assets/vendor/imagesloaded/imagesloaded.pkgd.min.js') }}"></script>
<script src="{{ asset('assets/vendor/magnific-popup/jquery.magnific-popup.min.js') }}"></script>
<script src="{{ asset('assets/vendor/owl-carousel/owl.carousel.min.js') }}"></script>
<script src="{{ asset('assets/vendor/elevatezoom/jquery.elevatezoom.min.js') }}"></script>
<script src="{{ asset('assets/vendor/photoswipe/photoswipe.min.js') }}"></script>
<script src="{{ asset('assets/vendor/photoswipe/photoswipe-ui-default.min.js') }}"></script>

<script src="{{ asset('assets/vendor/owl-carousel/owl.carousel.min.js') }}"></script>
<!-- Main JS File -->
<script src="{{ asset('js/main.js') }}"></script>
<script>
      history.pushState(null, null, location.href);
    window.onpopstate = function () {
        history.go(1);
    };</script>
</html>