@extends('layouts.new.app')

@section('content')
<div class="row category-banner">
    <div class="col-lg-12">
        <div id="carouselExample" class="carousel slide carousel-container category-banner" data-bs-ride="carousel">
            <!-- Custom buttons for navigation at bottom-left corner -->
            <div class="custom-buttons">
                <button class="carousel-control-prev" type="button" data-bs-target="#carouselExample" data-bs-slide="prev">
                    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                    <span class="visually-hidden">Previous</span>
                </button>
                <button class="carousel-control-next" type="button" data-bs-target="#carouselExample" data-bs-slide="next">
                    <span class="carousel-control-next-icon" aria-hidden="true"></span>
                    <span class="visually-hidden">Next</span>
                </button>
            </div>

            <!-- Carousel items -->
            <div class="carousel-inner">
                <div class="carousel-item category-banner active">
                    <img src="{{ asset('images/category-images/category-banner.png') }}" class="d-block first-box w-100" alt="Website Logo">
                </div>
            </div>
        </div>
    </div>
</div>


<div class="row">
    
    <div class="col-lg-12 category-home">
        <a href="{{ route('home') }}" style="text-decoration: none; color: inherit;"> 
            <span> Home</span>
        </a> 
        <span>&gt; Category</span>
    </div>
    
            <div class="col-lg-12 category-frame">
                 <img src="{{ asset('images/category-images/category-frame.png') }}"/>
            </div>

</div>
       
<div class="category-image">
    @foreach($products as $product)
    <div class="category-filter">
        <img src="{{ $product->productImages->first()->image_url ?? asset('images/default.png') }}" alt="{{ $product->name }}" />
        <div class="blog-6-img-details">
            <p>{{ $product->name }}</p>
            <p style="color: #ACA7A7;">{!! $product->description !!}</p>
            <span style="color:#D74447; font-size:20px; font-weight:500;">Rs {{ $product->mrp }}</span>
            <button class="blog-6-btn" style=" font-size:10px;">
                <a href="{{ route('product.show', $product->id) }}" style="text-decoration: none; color: inherit;">Shop Now <i style="margin-left: 5px; font-size:10px;" class="fa-solid fa-arrow-right-long"></i></a>
            </button>
        </div>
    </div>
    @endforeach
</div>

<div class="category-image" style="display:none;">
    <div class="category-filter">
        <img src="{{ asset('images/category-images/image (1).png') }}" />
        <div class="blog-6-img-details">
            <p>Soan Papdi</p>
            <p style="color: #ACA7A7;">No palm Oil / Preservatives</p>
             <span style="color:#D74447; font-size:20px; font-weight:500;">Rs 325</span><del style="color: #ACA7A7;margin-left: .5rem">Rs221</del>
            <button class="blog-6-btn" style=" font-size:10px;">Shop Now<i style="margin-left: 5px; font-size:10px;" class="fa-solid  fa-arrow-right-long"></i></button>
        </div>
    </div>
    <div class="category-filter">
        <img src="{{ asset('images/category-images/image (2).png') }}" />
        <div class="blog-6-img-details">
            <p>Soan Papdi</p>
            <p style="color: #ACA7A7;">No palm Oil / Preservatives</p>
             <span style="color:#D74447; font-size:20px; font-weight:500;">Rs 325</span><del style="color: #ACA7A7;margin-left: .5rem">Rs221</del>
            <button class="blog-6-btn" style=" font-size:10px;">Shop Now<i style="margin-left: 5px; font-size:10px;" class="fa-solid  fa-arrow-right-long"></i></button>
        </div>

    </div>
    <div class="category-filter">
        <img src="{{ asset('images/category-images/image (3).png') }}" />
        <div class="blog-6-img-details">
            <p>Soan Papdi</p>
            <p style="color: #ACA7A7;">No palm Oil / Preservatives</p>
             <span style="color:#D74447; font-size:20px; font-weight:500;">Rs 325</span><del style="color: #ACA7A7;margin-left: .5rem">Rs221</del>
            <button class="blog-6-btn" style=" font-size:10px;">Shop Now<i style="margin-left: 5px; font-size:10px;" class="fa-solid  fa-arrow-right-long"></i></button>
        </div>

    </div>

    <div class="category-filter">
        <img src="{{ asset('images/category-images/image (1).png') }}" />
        <div class="blog-6-img-details">
            <p>Soan Papdi</p>
            <p style="color: #ACA7A7;">No palm Oil / Preservatives</p>
             <span style="color:#D74447; font-size:20px; font-weight:500;">Rs 325</span><del style="color: #ACA7A7;margin-left: .5rem">Rs221</del>
            <button class="blog-6-btn" style=" font-size:10px;">Shop Now<i style="margin-left: 5px; font-size:10px;" class="fa-solid  fa-arrow-right-long"></i></button>
        </div>

    </div>
 

    <div class="category-filter">
        <img src="{{ asset('images/category-images/image (2).png') }}" />
        <div class="blog-6-img-details">
            <p>Soan Papdi</p>
            <p style="color: #ACA7A7;">No palm Oil / Preservatives</p>
             <span style="color:#D74447; font-size:20px; font-weight:500;">Rs 325</span><del style="color: #ACA7A7;margin-left: .5rem">Rs221</del>
            <button class="blog-6-btn" style=" font-size:10px;">Shop Now<i style="margin-left: 5px; font-size:10px;" class="fa-solid  fa-arrow-right-long"></i></button>
        </div>

    </div>
 

    <div class="category-filter">
        <img src="{{ asset('images/category-images/image (3).png') }}" />
        <div class="blog-6-img-details">
            <p>Soan Papdi</p>
            <p style="color: #ACA7A7;">No palm Oil / Preservatives</p>
             <span style="color:#D74447; font-size:20px; font-weight:500;">Rs 325</span><del style="color: #ACA7A7;margin-left: .5rem">Rs221</del>
            <button class="blog-6-btn" style=" font-size:10px;">Shop Now<i style="margin-left: 5px; font-size:10px;" class="fa-solid  fa-arrow-right-long"></i></button>
        </div>

    </div>
 


    <div class="category-filter">
        <img src="{{ asset('images/category-images/image (1).png') }}" />
        <div class="blog-6-img-details">
            <p>Soan Papdi</p>
            <p style="color: #ACA7A7;">No palm Oil / Preservatives</p>
             <span style="color:#D74447; font-size:20px; font-weight:500;">Rs 325</span><del style="color: #ACA7A7;margin-left: .5rem">Rs221</del>
            <button class="blog-6-btn" style=" font-size:10px;">Shop Now<i style="margin-left: 5px; font-size:10px;" class="fa-solid  fa-arrow-right-long"></i></button>
        </div>

    </div>
 


    <div class="category-filter">
        <img src="{{ asset('images/category-images/image (2).png') }}" />
        <div class="blog-6-img-details">
            <p>Soan Papdi</p>
            <p style="color: #ACA7A7;">No palm Oil / Preservatives</p>
             <span style="color:#D74447; font-size:20px; font-weight:500;">Rs 325</span><del style="color: #ACA7A7;margin-left: .5rem">Rs221</del>
            <button class="blog-6-btn" style=" font-size:10px;">Shop Now<i style="margin-left: 5px; font-size:10px;" class="fa-solid  fa-arrow-right-long"></i></button>
        </div>

    </div>
 

    <div class="category-filter">
        <img src="{{ asset('images/category-images/image (3).png') }}" />
        <div class="blog-6-img-details">
            <p>Soan Papdi</p>
            <p style="color: #ACA7A7;">No palm Oil / Preservatives</p>
             <span style="color:#D74447; font-size:20px; font-weight:500;">Rs 325</span><del style="color: #ACA7A7;margin-left: .5rem">Rs221</del>
            <button class="blog-6-btn" style=" font-size:10px;">Shop Now<i style="margin-left: 5px; font-size:10px;" class="fa-solid  fa-arrow-right-long"></i></button>
        </div>

    </div>

    <div class="category-filter">
        <img src="{{ asset('images/category-images/image (6).png') }}" />
        <div class="blog-6-img-details">
            <p>Soan Papdi</p>
            <p style="color: #ACA7A7;">No palm Oil / Preservatives</p>
             <span style="color:#D74447; font-size:20px; font-weight:500;">Rs 325</span><del style="color: #ACA7A7;margin-left: .5rem">Rs221</del>
            <button class="blog-6-btn" style=" font-size:10px;">Shop Now<i style="margin-left: 5px; font-size:10px;" class="fa-solid  fa-arrow-right-long"></i></button>
        </div>

    </div>

    <div class="category-filter">
        <img src="{{ asset('images/category-images/Component 65.png') }}" />
        <div class="blog-6-img-details">
            <p>Soan Papdi</p>
            <p style="color: #ACA7A7;">No palm Oil / Preservatives</p>
             <span style="color:#D74447; font-size:20px; font-weight:500;">Rs 325</span><del style="color: #ACA7A7;margin-left: .5rem">Rs221</del>
            <button class="blog-6-btn" style=" font-size:10px;">Shop Now<i style="margin-left: 5px; font-size:10px;" class="fa-solid  fa-arrow-right-long"></i></button>
        </div>

    </div>

    <div class="category-filter">
        <img src="{{ asset('images/category-images/Component 74.png') }}" />
        <div class="blog-6-img-details">
            <p>Soan Papdi</p>
            <p style="color: #ACA7A7;">No palm Oil / Preservatives</p>
             <span style="color:#D74447; font-size:20px; font-weight:500;">Rs 325</span><del style="color: #ACA7A7;margin-left: .5rem">Rs221</del>
            <button class="blog-6-btn" style=" font-size:10px;">Shop Now<i style="margin-left: 5px; font-size:10px;" class="fa-solid  fa-arrow-right-long"></i></button>
        </div>

    </div>

    <div class="category-filter">
        <img src="{{ asset('images/category-images/Component 75.png') }}" />
        <div class="blog-6-img-details">
            <p>Soan Papdi</p>
            <p style="color: #ACA7A7;">No palm Oil / Preservatives</p>
             <span style="color:#D74447; font-size:20px; font-weight:500;">Rs 325</span><del style="color: #ACA7A7;margin-left: .5rem">Rs221</del>
            <button class="blog-6-btn" style=" font-size:10px;">Shop Now<i style="margin-left: 5px; font-size:10px;" class="fa-solid  fa-arrow-right-long"></i></button>
        </div>

    </div>


    <div class="category-filter">
        <img src="{{ asset('images/category-images/Component 78.png') }}" />
        <div class="blog-6-img-details">
            <p>Soan Papdi</p>
            <p style="color: #ACA7A7;">No palm Oil / Preservatives</p>
             <span style="color:#D74447; font-size:20px; font-weight:500;">Rs 325</span><del style="color: #ACA7A7;margin-left: .5rem">Rs221</del>
            <button class="blog-6-btn" style=" font-size:10px;">Shop Now<i style="margin-left: 5px; font-size:10px;" class="fa-solid  fa-arrow-right-long"></i></button>
        </div>

    </div>


    <div class="category-filter">
        <img src="{{ asset('images/category-images/Component 75.png') }}" />
        <div class="blog-6-img-details">
            <p>Soan Papdi</p>
            <p style="color: #ACA7A7;">No palm Oil / Preservatives</p>
             <span style="color:#D74447; font-size:20px; font-weight:500;">Rs 325</span><del style="color: #ACA7A7;margin-left: .5rem">Rs221</del>
            <button class="blog-6-btn" style=" font-size:10px;">Shop Now<i style="margin-left: 5px; font-size:10px;" class="fa-solid  fa-arrow-right-long"></i></button>
        </div>

    </div>

    <div class="category-filter">
        <img src="{{ asset('images/category-images/Component 78.png') }}" />
        <div class="blog-6-img-details">
            <p>Soan Papdi</p>
            <p style="color: #ACA7A7;">No palm Oil / Preservatives</p>
             <span style="color:#D74447; font-size:20px; font-weight:500;">Rs 325</span><del style="color: #ACA7A7;margin-left: .5rem">Rs221</del>
            <button class="blog-6-btn" style=" font-size:10px;">Shop Now<i style="margin-left: 5px; font-size:10px;" class="fa-solid  fa-arrow-right-long"></i></button>
        </div>

    </div>

    <div class="category-filter">
        <img src="{{ asset('images/category-images/Component 74.png') }}" />
        <div class="blog-6-img-details">
            <p>Soan Papdi</p>
            <p style="color: #ACA7A7;">No palm Oil / Preservatives</p>
             <span style="color:#D74447; font-size:20px; font-weight:500;">Rs 325</span><del style="color: #ACA7A7;margin-left: .5rem">Rs221</del>
            <button class="blog-6-btn" style=" font-size:10px;">Shop Now<i style="margin-left: 5px; font-size:10px;" class="fa-solid  fa-arrow-right-long"></i></button>
        </div>

    </div>
 
</div>
   

  <div class="row category-main">
    <div class="category-second-banner">
        <div class="col-lg-12 second-image">
            <img src="{{ asset('images/category-images/category-second-frame.png') }}" />
        </div>
        <div class="col-lg-12 category-gallery-main">
            <div class="category-gallery">
                <div class="category-gallery-box">
                    <img src="{{ asset('images/category-images/second-1.png') }}" />
                    <button>Sweets</button>
                </div>
                <div class="category-gallery-box">
                    <img src="{{ asset('images/category-images/second-2.png') }}" />
                    <button>Savories</button>
                </div>
                <div class="category-gallery-box">
                    <img src="{{ asset('images/category-images/second-3.png') }}" />
                    <button>Appalam</button>
                </div>
                <div class="category-gallery-box">
                    <img src="{{ asset('images/category-images/second-4.png') }}" />
                    <button>Sweets</button>
                </div>
            </div>
        </div>
    </div>
  </div>
@endsection