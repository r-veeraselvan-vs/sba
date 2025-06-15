@extends('layouts.app-front')
@section('content')
<style>
    .text-justify{
        text-align: justify;
    }
</style>
<main class="main">
            <div class="page-header" style="background-image: url(images/page-header.jpg)">
                <h1 class="page-title">About Us</h1>
            </div>
            <div class="page-content mt-10 pt-7">
                <section class="about-section">
                    <div class="container">
                        <h2 class="title mb-lg-9">About Madurai Kadai</h2>
                        <div class="row mb-10">
                            <div class="col-md-6">
                                <img class="w-100 mb-4 appear-animate"
                                    data-animation-options="{'name':'fadeInLeftShorter'}"
                                    src="images/subpages/about.jpg" alt="Donald Store" width="587" height="517"
                                    style="position: sticky; top: 2rem;">
                            </div>
                            <div class="col-md-6 order-md-first pt-md-5">
                                <p class="text-uppercase text-grey mb-0">Who we are</p>
                                <h5 class="lh-1 ls-m">Madurai's Premier Online Grocery Experience 🛒</h5>
                                <p class="font-primary text-justify">Steeped in tradition and bursting with flavors, Madurai, our beloved city, is now poised to embrace a modern twist to its shopping habits. Introducing Madurai Kadai, an online grocery haven, intricately designed to cater to Madurai's distinctive tastes and needs.</p>
                                <p class="font-primary text-justify">Why shuffle through crowded local markets when you can access the freshest produce, top-quality grains, and essential household items with just a click? We source our products with an emphasis on quality and authenticity, ensuring that each item resonates with the rich cultural tapestry of Madurai.</p>
                                <p class="font-primary text-justify">Here's what makes shopping with Madurai Kadai an unmatched experience:</p>
                                
                                 <p class="font-primary text-justify"><b>Local Favorites: </b>From aromatic spices to regional delicacies, find everything that Madurai loves, all in one place.</p>
                                  <p class="font-primary text-justify"><b>Special Offers & Discounts: </b>Exclusive deals tailored for our Madurai family, ensuring great value with every purchase.</p>
                                   <p class="font-primary text-justify"><b>Timely Deliveries: </b>With our vast network and dedicated team, expect prompt deliveries right at your doorstep.</p>
                                <p class="font-primary text-justify"><b>Seamless Shopping Experience: </b>Our user-friendly interface, coupled with secure payment options, makes online grocery shopping a breeze.</p>
                                
                                <p class="font-primary text-justify">Join us in celebrating Madurai's rich traditions and its promising digital future. Dive into a shopping experience that pays homage to our roots while embracing modern conveniences. So, Madurai, are you ready to fill your baskets with the best of both worlds? With Madurai Kadai, you're not just shopping; you're embarking on a culinary journey through the heart of Madurai.</p>
                               <!--  <div class="row pl-xl-6 pr-xl-8 mb-6">
                                    <div class="counter text-primary text-center col-sm-4 col-md-6 col-lg-4">
                                        <span class="count-to" data-to="35" data-refresh-interval="50">0</span>
                                        <h5 class="count-title">Business Year</h5>
                                    </div>
                                    <div class="counter text-primary text-center col-sm-4 col-md-6 col-lg-4">
                                        <span class="count-to" data-to="50" data-refresh-interval="50">0</span>
                                        <h5 class="count-title">Design Brands</h5>
                                    </div>
                                    <div class="counter text-primary text-center col-sm-4 col-md-12 col-lg-4">
                                        <span class="count-to" data-to="130" data-refresh-interval="50">0</span>
                                        <h5 class="count-title">Team Members</h5>
                                    </div>
                                </div> -->
                                <!-- <ul
                                    class="list list-circle row cols-sm-2 cols-md-1 cols-xl-2 font-weight-bold text-dark font-primary mb-4">
                                    <li class="appear-animate"
                                        data-animation-options="{'name': 'fadeInRightShorter','delay':'.4s'}"><i
                                            class="fa fa-check"></i>Pellentesque ultricies nibh</li>
                                    <li class="appear-animate" data-animation-options="{'name': 'fadeInRightShorter'}">
                                        <i class="fa fa-check"></i>Pellentesque ultricies nibh</li>
                                    <li class="appear-animate"
                                        data-animation-options="{'name': 'fadeInRightShorter','delay':'.5s'}"><i
                                            class="fa fa-check"></i>Ultricies nibh pellen</li>
                                    <li class="appear-animate"
                                        data-animation-options="{'name': 'fadeInRightShorter','delay':'.3s'}"><i
                                            class="fa fa-check"></i>Ultricies nibh pellen</li>
                                </ul> -->
                            </div>
                        </div>
                    </div>
                </section>
                <!-- End About Section-->

            </div>
        </main>

@endsection