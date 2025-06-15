@extends('layouts.new.app')

@section('content')
<div class="row">
  <div class="col-lg-12">
    <div id="carouselExample" class="carousel slide carousel-container" data-bs-ride="carousel">
      
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
        <div class="carousel-item active">
          <img src="{{ asset('images/home-banner-1.jpg') }}" class="d-block first-box w-100" alt="Website Logo">
        </div>
        <div class="carousel-item">
          <img src="{{ asset('images/home-banner-2.jpg') }}" class="d-block first-box w-100" alt="Website Logo">
        </div>
      </div>
    </div>
  </div>
</div>




<div class="row">
  <div class="second-box col-lg-12">
    <img src="{{ asset('images/leaf-logo.png') }}" class="top-right-leaf"/> 
    <h2>A Legacy of Authentic South Indian Flavors</h2>
    <p>For over three decades, Murugan Idli has been a beacon of tradition and quality, offering an unparalleled South Indian
       dining experience. With a passion for preserving the rich culinary heritage of Tamil Nadu, we've perfected the art of crafting
       dishes that warm the soul and bring the authentic taste of South India to your table.</p>
    <img src="{{ asset('images/leaf-logo.png') }}" class="bottom-left-leaf" />
     <div class="leaf-ico">
      <button>
      <img src="{{ asset('images/premium.png') }}"/> 
      Premium Quality</button>
      <button>
      <img src="{{ asset('images/pure.png') }}"/> 
      Pure Vegetarian</button>
      <button>
      <img src="{{ asset('images/hygine.png') }}"/> 
       Hygiene Standards</button>
     </div>
  </div>
</div>


<div class="row">
    <div class="third-box ">
      <h2>Shop your Delighting Treats</h2>

      <div class="graybox">
          <div class="sweets">
            
            <img src="{{ asset('images/image.png') }}" class="bottom-left-leaf" />
            <p>Sweets<br>24 products</p>
            
          </div>
          <div class="sweets">
            <img src="{{ asset('images/image (1).png') }}" class="bottom-left-leaf" />
            <p>Sweets<br>24 products</p>
          </div>
          <div class="sweets">
            <img src="{{ asset('images/image (2).png') }}" class="bottom-left-leaf" />
            <p>Sweets<br>24 products</p>
          </div>
          <div class="sweets">
            <img src="{{ asset('images/image (3).png') }}" class="bottom-left-leaf" />
            <p>Sweets<br>24 products</p>
          </div>
          <div class="sweets">
            <img src="{{ asset('images/image (4).png') }}" class="bottom-left-leaf" />
            <p>Sweets<br>24 products</p>
          </div>
      </div>
     <div class="white-box">

     </div>
    </div>
</div>

<div class="row">
    <div class="box-4">
        <div class="box-india">
          <img src="{{ asset('images/india-svgrepo-com 1.png') }}" class="bottom-left-leaf" />
          <p>Tamil Nadu’s Favorite<span>
            Cherished by millions for authentic
            South Indian Flavors.</span></p>
        </div>
        <div class="box-india">
          <img src="{{ asset('images/Vector.png') }}" class="bottom-left-leaf" />
          <p>Tamil Nadu’s Favorite<span>
            Cherished by millions for authentic
            South Indian Flavors.</span></p>
        </div>
        <div class="box-india">
          <img src="{{ asset('images/Vector (1).png') }}" class="bottom-left-leaf" />
          <p>Tamil Nadu’s Favorite<span>
            Cherished by millions for authentic
            South Indian Flavors.</span></p>
        </div>
        
        <div class="box-india">
          <img src="{{ asset('images/Vector (2).png') }}" class="bottom-left-leaf" />
          <p>Tamil Nadu’s Favorite<span>
            Cherished by millions for authentic
            South Indian Flavors.</span></p>
        </div>
    </div>
</div>

<div class="row" style="display:none;">
  <div class="col-lg-12 box-5">
    <div class="seller">
       <div class="our-best">
         <div class="our-seller">
           <p>Our Best Sellers</p>
           <span>Authentic Handcrafted South Indian
            delicacies, made with love and tradition
            in every bite
          </span>
            <button onclick="window.location.href='{{ url('/category') }}'">See All</button>
         </div>
       </div>
       <div class="seller-img">
        <img src="{{ asset('images/image-latu.png') }}" class="bottom-left-leaf" />
         <div class="img-details">
          <p>Moti laddu</p>
          <span style="color: #D74447;font-family: Outfit;font-size: 20px;font-weight: 500;line-height: 25.2px;text-align: left;">Rs 325</span>
          <span ><i class="fa-solid fa-star"></i><i class="fa-solid fa-star"></i><i class="fa-solid fa-star"></i><i class="fa-solid fa-star"></i><i style="color: #D9D9D9;" class="fa-solid fa-star"></i></span>
          <span>(35)</span>
          <button onclick="window.location.href='{{ url('/product') }}'" class="seller-add-btn">Add to Cart</button>
         </div>
       </div>
       <div class="seller-img">
        <img src="{{ asset('images/image-halwa.png') }}" class="bottom-left-leaf" />
 <div class="img-details">
  <p>Halwa</p>
  <span style="color: #D74447;font-family: Outfit;font-size: 20px;font-weight: 500;line-height: 25.2px;text-align: left;">Rs 325</span>
  <span ><i class="fa-solid fa-star"></i><i class="fa-solid fa-star"></i><i class="fa-solid fa-star"></i><i class="fa-solid fa-star"></i><i style="color: #D9D9D9;" class="fa-solid fa-star"></i></span>
  <span>(35)</span>
  <button onclick="window.location.href='{{ url('/product') }}'" class="seller-add-btn">Add to Cart</button>

         </div>
       </div>
       <div class="seller-img">
        <img src="{{ asset('images/image -thattai.png') }}" class="bottom-left-leaf" />
        <div class="img-details">
          <p>Moti laddu</p>
          <span style="color: #D74447;font-family: Outfit;font-size: 20px;font-weight: 500;line-height: 25.2px;text-align: left;">Rs 325</span>
          <span ><i class="fa-solid fa-star"></i><i class="fa-solid fa-star"></i><i class="fa-solid fa-star"></i><i class="fa-solid fa-star"></i><i style="color: #D9D9D9;" class="fa-solid fa-star"></i></span>
          <span>(35)</span>
          <button onclick="window.location.href='{{ url('/product') }}'" class="seller-add-btn">Add to Cart</button>
        </div>
       </div>
    </div>
  </div>
</div>
{{-- Blog-Start-6 --}}

<div class="row blog-6" style="display:none;">
  <div class="col-lg-10 blog-6-head">
       <p>Guilt - Free Sweet Treats</p>
       <button onclick="window.location.href='{{ url('/category') }}'">See All</button>
  </div>
  <div class="col-lg-10 blog-6-head-img">
    <div class="blog-6-img">
      <img src="{{ asset('images/sweet-treats-1.png') }}" class="bottom-left-leaf" />
      <!-- Moved blog-6-img-details inside blog-6-img -->
      <div class="blog-6-img-details">
        <p>Soan Papdi</p>
        <p style="color: #ACA7A7;">No palm Oil / Preservatives</p>
         <span style="color:#D74447; font-size:20px; font-weight:500;">Rs 325</span><del style="color: #ACA7A7;margin-left: .5rem">Rs221</del>
        <button class="blog-6-btn" style=" font-size:10px;">Shop Now<i style="margin-left: 5px; font-size:10px;" class="fa-solid  fa-arrow-right-long"></i></button>
      </div>
    </div>

    <div class="blog-6-img">
      <img src="{{ asset('images/sweet-treats-2.png') }}" class="bottom-left-leaf" />
      <!-- Moved blog-6-img-details inside blog-6-img -->
      <div class="blog-6-img-details">
        <p>Soan Papdi</p>
        <p style="color: #ACA7A7;">No palm Oil / Preservatives</p>
         <span style="color:#D74447; font-size:20px; font-weight:500;">Rs 325</span><del style="color: #ACA7A7;margin-left: .5rem">Rs221</del>
        <button class="blog-6-btn"  style=" font-size:10px;">Shop Now<i style="margin-left: 5px; font-size:10px;" class="fa-solid  fa-arrow-right-long"></i></button>
      </div>
    </div>

    <div class="blog-6-img">
      <img src="{{ asset('images/sweet-treats-3.png') }}" class="bottom-left-leaf" />
      <!-- Moved blog-6-img-details inside blog-6-img -->
      <div class="blog-6-img-details">
        <p>Soan Papdi</p>
        <p style="color: #ACA7A7;">No palm Oil / Preservatives</p>
         <span style="color:#D74447; font-size:20px; font-weight:500;">Rs 325</span><del style="color: #ACA7A7;margin-left: .5rem">Rs221</del>
        <button class="blog-6-btn" style=" font-size:10px;">Shop Now<i style="margin-left: 5px; font-size:10px;" class="fa-solid  fa-arrow-right-long"></i></button>
      </div>
    </div>

    <div class="blog-6-img fourth-img">
      <img style="object-fit: cover;" src="{{ asset('images/sweat-treats-4.png') }}" class="bottom-left-leaf" />
      <!-- Moved blog-6-img-details inside blog-6-img -->
      <div class="blog-6-img-details" style="overflow: hidden;">
        <p>Soan Papdi</p>
        <p style="color: #ACA7A7;">No palm Oil / Preservatives</p>
         <span style="color:#D74447; font-size:20px; font-weight:500;">Rs 325</span><del style="color: #ACA7A7;margin-left: .5rem">Rs221</del>
        <button class="blog-6-btn"  style=" font-size:10px;">Shop Now<i style=" font-size:10px;" class="fa-solid  fa-arrow-right-long"></i></button>
      </div>
    </div>
  </div>
</div>
{{-- Blog-End-6 --}}


{{-- Blog-Start-7 --}}
<div class="row blog-6" style="display:none;">
  <div class="col-lg-10 blog-6-head">
       <p>Our Nutritious Savories Delights</p>
       <button onclick="window.location.href='{{ url('/category') }}'">See All</button>
  </div>
  <div class="col-lg-10 blog-6-head-img">
    <div class="blog-6-img">
      <img src="{{ asset('images/nutritious-1.png') }}" class="bottom-left-leaf" />
      <!-- Moved blog-6-img-details inside blog-6-img -->
      <div class="blog-6-img-details">
        <p>Soan Papdi</p>
        <p>No palm Oil / Preservatives</p>
         <span style="color:#D74447; font-size:20px; font-weight:500;">Rs 325</span><del style="color: #ACA7A7;margin-left: .5rem">Rs221</del>
        <button class="blog-6-btn" style=" font-size:10px;">Shop Now<i style="margin-left: 5px; font-size:10px;" class="fa-solid  fa-arrow-right-long"></i></button>
      </div>
    </div>

    <div class="blog-6-img">
      <img src="{{ asset('images/nutritious-2.png') }}" class="bottom-left-leaf" />
      <!-- Moved blog-6-img-details inside blog-6-img -->
      <div class="blog-6-img-details">
        <p>Soan Papdi</p>
        <p>No palm Oil / Preservatives</p>
         <span style="color:#D74447; font-size:20px; font-weight:500;">Rs 325</span><del style="color: #ACA7A7;margin-left: .5rem">Rs221</del>
        <button class="blog-6-btn"  style=" font-size:10px;">Shop Now<i style="margin-left: 5px; font-size:10px;" class="fa-solid  fa-arrow-right-long"></i></button>
      </div>
    </div>

    <div class="blog-6-img">
      <img src="{{ asset('images/nutritious-3.png') }}" class="bottom-left-leaf" />
      <!-- Moved blog-6-img-details inside blog-6-img -->
      <div class="blog-6-img-details">
        <p>Soan Papdi</p>
        <p>No palm Oil / Preservatives</p>
         <span style="color:#D74447; font-size:20px; font-weight:500;">Rs 325</span><del style="color: #ACA7A7;margin-left: .5rem">Rs221</del>
        <button class="blog-6-btn" style=" font-size:10px;">Shop Now<i style="margin-left: 5px; font-size:10px;" class="fa-solid  fa-arrow-right-long"></i></button>
      </div>
    </div>

    <div class="blog-6-img fourth-img">
      <img src="{{ asset('images/nutritious-4.png') }}" class="bottom-left-leaf" />
      <!-- Moved blog-6-img-details inside blog-6-img -->
      <div class="blog-6-img-details" style="overflow: hidden;">
        <p>Soan Papdi</p>
        <p>No palm Oil / Preservatives</p>
         <span style="color:#D74447; font-size:20px; font-weight:500;">Rs 325</span><del style="color: #ACA7A7;margin-left: .5rem">Rs221</del>
        <button class="blog-6-btn"  style=" font-size:10px;">Shop Now<i style=" font-size:10px;" class="fa-solid  fa-arrow-right-long"></i></button>
      </div>
    </div>
  </div>
</div>
{{-- Blog-End-Start-7 --}}

{{-- Blog-Start-8 --}}
<div class="row blog-8-container" style="display:none;">
  <div class="col-lg-10 blog-8-head">
    
      <p>Tangy Treasures - Pickle Perfection</p>
      <button onclick="window.location.href='{{ url('/category') }}'">See All</button>
 
  </div>
  <div class="col-lg-10 blog-8-img">
    <div class="blog-8-box">
      <p>New</p>
       <img style="margin-left:2.5rem; " src="{{asset('images/tangy-imag.png')}}"/><br>
       <span class="blog-8-contant">Kai Murukku(South Indian
        Chakli
      </span><br>
      <span style="font-size:14px;color: #858484;">
        No Palm Oil / Preservation
      </span><br>
      <span style="color: #D74447;font-family: Outfit;font-size: 20px;font-weight: 500;line-height: 25.2px;text-align: left;">Rs 325</span>
          <span ><i class="fa-solid fa-star"></i><i class="fa-solid fa-star"></i><i class="fa-solid fa-star"></i><i class="fa-solid fa-star"></i><i style="color: #D9D9D9;" class="fa-solid fa-star"></i></span>
          <span>(35)</span>
          <div onclick="window.location.href='{{ url('/product') }}'" class="tangy-btn">
             Add to Cart
          </div>    
    </div>
    
    <div class="blog-8-box">
      <p>New</p>
      <img style="margin-left:2.5rem; " src="{{asset('images/tangy-imag.png')}}"/><br>
      <span class="blog-8-contant">Kai Murukku(South Indian
       Chakli
     </span><br>
     <span style="font-size:14px;color: #858484;">
       No Palm Oil / Preservation
     </span><br>
     <span style="color: #D74447;font-family: Outfit;font-size: 20px;font-weight: 500;line-height: 25.2px;text-align: left;">Rs 325</span>
         <span ><i class="fa-solid fa-star"></i><i class="fa-solid fa-star"></i><i class="fa-solid fa-star"></i><i class="fa-solid fa-star"></i><i style="color: #D9D9D9;" class="fa-solid fa-star"></i></span>
         <span>(35)</span>
         <div onclick="window.location.href='{{ url('/product') }}'" class="tangy-btn">
            Add to Cart
         </div>    

    </div>
    <div class="blog-8-box">
      <p>New</p>
      <img style="margin-left:2.5rem; " src="{{asset('images/tangy-imag.png')}}"/><br>
      <span class="blog-8-contant">Kai Murukku(South Indian
       Chakli
     </span><br>
     <span style="font-size:14px;color: #858484;">
       No Palm Oil / Preservation
     </span><br>
     <span style="color: #D74447;font-family: Outfit;font-size: 20px;font-weight: 500;line-height: 25.2px;text-align: left;">Rs 325</span>
         <span ><i class="fa-solid fa-star"></i><i class="fa-solid fa-star"></i><i class="fa-solid fa-star"></i><i class="fa-solid fa-star"></i><i style="color: #D9D9D9;" class="fa-solid fa-star"></i></span>
         <span>(35)</span>
         <div onclick="window.location.href='{{ url('/product') }}'" class="tangy-btn">
            Add to Cart
         </div>    

    </div>
    <div class="blog-8-box">
      <p>New</p>
      <img style="margin-left:2.5rem; " src="{{asset('images/tangy-imag.png')}}"/><br>
      <span class="blog-8-contant">Kai Murukku(South Indian
       Chakli
     </span><br>
     <span style="font-size:14px;color: #858484;">
       No Palm Oil / Preservation
     </span><br>
     <span style="color: #D74447;font-family: Outfit;font-size: 20px;font-weight: 500;line-height: 25.2px;text-align: left;">Rs 325</span>
         <span ><i class="fa-solid fa-star"></i><i class="fa-solid fa-star"></i><i class="fa-solid fa-star"></i><i class="fa-solid fa-star"></i><i style="color: #D9D9D9;" class="fa-solid fa-star"></i></span>
         <span>(35)</span>
         <div onclick="window.location.href='{{ url('/product') }}'" class="tangy-btn">
            Add to Cart
         </div>    

    </div>
  </div>
</div>
{{-- Blog-End-8 --}}


<div class="row">
  <div class="col-lg-12 box-5">
    <div class="seller">
      <div class="our-best">
        <div class="our-seller">
          <p>Our Best Sellers</p>
          <span>Authentic Handcrafted South Indian delicacies, made with love and tradition in every bite</span>
            <a href="{{ route('productList') }}"><button>See All</button></a>
        </div>
      </div>

      @foreach($bestSellers as $product)
        <div class="seller-img">
          <!-- Assuming the product has a relation to ProductImage and using the accessor for URL -->
          <img src="{{ $product->productImages->first()->image_url ?? asset('images/default.png') }}" class="bottom-left-leaf" alt="{{ $product->name }}" />
          <div class="img-details">
            <p>{{ $product->name }}</p>
            <!-- Assuming 'matrix1' is the price field -->
            <span style="color: #D74447; font-family: Outfit; font-size: 20px; font-weight: 500; line-height: 25.2px; text-align: left;">
              Rs {{ $product->productPrice->price ?? 'N/A' }}
            </span>
            
            <!-- Rating -->
            <span>
              @for($i = 0; $i < 5; $i++)
                <i class="fa-solid fa-star" style="{{ $i < $product->average_ratings ? '' : 'color: #D9D9D9;' }}"></i>
              @endfor
            </span>
            <span>({{ $product->ratings_count }})</span>
            
            <form action="{{ route('cart.add') }}" method="POST">
                @csrf  <!-- This adds the CSRF token required by Laravel for POST requests -->
                
                <input type="hidden" name="product_id" value="{{ $product->id }}">  <!-- Assuming $product is passed to the view -->
                
                <button type="submit" class="seller-add-btn">Add to Cart</button>
            </form>
          </div>
        </div>
      @endforeach

    </div>
  </div>
</div>

<div class="row blog-6">
  <div class="col-lg-10 blog-6-head">
       <p>Guilt - Free Sweet Treats</p>
       <button>See All</button>
  </div>
  <div class="col-lg-10 blog-6-head-img">
    @foreach($sweetTreats as $product)
      <div class="blog-6-img">
        <img src="{{ $product->productImages->first()->image_url ?? asset('images/default.png') }}" class="bottom-left-leaf" alt="{{ $product->name }}" />
        <div class="blog-6-img-details">
          <p>{{ $product->name }}</p>
          <p style="color: #ACA7A7;">No palm Oil / Preservatives</p>
          <span style="color:#D74447; font-size:20px; font-weight:500;">Rs {{ $product->productPrice->price ?? 'N/A' }}</span>
          <del style="color: #ACA7A7;margin-left: .5rem">Rs {{ $product->productPrice->previous_price ?? 'N/A' }}</del>
          <button class="blog-6-btn" style=" font-size:10px;">Shop Now<i style="margin-left: 5px; font-size:10px;" class="fa-solid fa-arrow-right-long"></i></button>
        </div>
      </div>
    @endforeach
  </div>
</div>

<div class="row blog-6">
  <div class="col-lg-10 blog-6-head">
       <p>Our Nutritious Savories Delights</p>
       <button>See All</button>
  </div>
  <div class="col-lg-10 blog-6-head-img">
    @foreach($nutritiousDelights as $product)
      <div class="blog-6-img">
        <img src="{{ $product->productImages->first()->image_url ?? asset('images/default.png') }}" class="bottom-left-leaf" alt="{{ $product->name }}" />
        <div class="blog-6-img-details">
          <p>{{ $product->name }}</p>
          <p>No palm Oil / Preservatives</p>
          <span style="color:#D74447; font-size:20px; font-weight:500;">Rs {{ $product->productPrice->price ?? 'N/A' }}</span>
          <del style="color: #ACA7A7;margin-left: .5rem">Rs {{ $product->productPrice->previous_price ?? 'N/A' }}</del>
          <button class="blog-6-btn" style=" font-size:10px;">Shop Now<i style="margin-left: 5px; font-size:10px;" class="fa-solid fa-arrow-right-long"></i></button>
        </div>
      </div>
    @endforeach
  </div>
</div>

<div class="row blog-8-container">
  <div class="col-lg-10 blog-8-head">
      <p>Tangy Treasures - Pickle Perfection</p>
      <button>See All</button>
  </div>
  <div class="col-lg-10 blog-8-img">
    @foreach($tangyTreasures as $product)
      <div class="blog-8-box">
        <p>New</p>
        <img style="margin-left:2.5rem;" src="{{ $product->productImages->first()->image_url ?? asset('images/default.png') }}" /><br>
        <span class="blog-8-contant">{{ $product->name }}</span><br>
        <span style="font-size:14px; color: #858484;">No Palm Oil / Preservation</span><br>
        <span style="color: #D74447; font-family: Outfit; font-size: 20px; font-weight: 500; line-height: 25.2px; text-align: left;">Rs {{ $product->productPrice->price ?? 'N/A' }}</span>
        <span>
          @for($i = 0; $i < 5; $i++)
            <i class="fa-solid fa-star" style="{{ $i < $product->productRating ? '' : 'color: #D9D9D9;' }}"></i>
          @endfor
        </span>
        <span>({{ $product->reviews_count }})</span>
        <div class="tangy-btn">
            Add to Cart
        </div>    
      </div>
    @endforeach
  </div>
</div>


{{-- Blog-9-Start --}}
<div class="row blog-9-container">
  <div class="blog-9-small-con">
    <h2 class="text-center">Featured in</h2>
    <div class="featured-main">
       <div class="featured-box">
        <img src="{{ asset('images/feature-img-1.png') }}" />
        <p>IMRB Best Restaurant Survey</p>
       </div>
       <div class="featured-box">
        <img src="{{ asset('images/feature-img-2.png') }}" />
        <p>Favourite South Indian</p>
       </div>
       <div class="featured-box">
        <img src="{{ asset('images/feature-img-3.png') }}" />
        <p>Most Authentic South Indian Food</p>
       </div>
       <div class="featured-box">
        <img src="{{ asset('images/feature-img-4.png') }}" />
        <p>1001 Restaurants you must experience</p>
       </div>
    </div>
  </div>
</div>
{{-- Blog-9-End --}}

{{-- Blog-10-Start --}}
<div class="row blog-10-container">
  <div class="col-lg-12 crafted-main">

 
   <div class="crafted">
     <h1>Crafted with Love</h1>
     <h2>From the House of Murugan Idli</h2>
     <p>The sweets at Murugan Idli offer a delicious journey into the heart
      of South Indic rich culture and tradition. We believe every sweet
      should evoke warmth, care, and love.</p>
     <p>At Murugan Idi, our sweets are crafted with hand-picked
      ingredients, prepared to perfection, and served with love. Each
      bite tells a story of happiness and cherished memories</p>
   </div>
   <div class="crafted crafted-img">
    <img src="{{ asset('images/created-img.png') }}" />
    <img class="ellipse" src="{{ asset('images/Ellipse 1.png') }}" />
    <img class="polygon" src="{{ asset('images/Polygon 1.png') }}" />
   </div>
  </div> 
</div>

{{-- Blog-10-End --}}


{{-- Blog-11-Start --}}
<div class="row blog-11-container">
  <div class="col-lg-10 blog-11-contant">
     <h1>Finely Crafted for Memorable Celebrations</h1>
     <p>We take pride in crafting unforgettable flavors that elevate your special moments, making
      every celebration a cherished memory.</p>
  </div>
  <div class="col-lg-10 container-img-11">
     <div class="container-img">
      <img src="{{ asset('images/celebration-1.png') }}" />
      <h3>Assorted Gilt Boxes</h3>
      <p>Choose from our exquisite Hand-picked premium gifting collection</p>
      <button onclick="window.location.href='{{ url('/category') }}'">View Collection</button>
     </div>
     <div class="container-img">
      <img src="{{ asset('images/celebration-2.png') }}" />
      <h3>Dry Fruit Gilt Boxes</h3>
      <p>Sumptuous assortment of dry fruits & nuts packaged with a touch of Royalty</p>
      <button onclick="window.location.href='{{ url('/category') }}'">View Collection</button>
    </div>
     <div class="container-img">
      <img src="{{ asset('images/celebration-3.png') }}" />
      <h3>Souvenir Gill Boxes</h3>
      <p>This collection is our ode to the beauty and culture of India such box has a story to tell</p>
      <button onclick="window.location.href='{{ url('/category') }}'">View Collection</button>
    </div>
  </div>

</div>

{{-- Blog-11-end --}}

{{-- Blog-12-start --}}
<div class="row blog-12-container">
   <div class="col-lg-10 blog-12-head">
    <h2>Latest Blog</h2>
   </div>
  
   <div class="col-lg-12 blog-12-box">
         <div class="blog-12-img">
          <img src="{{ asset('images/latest-img-1.png') }}" />
          <p>September 05, 2024</p>
          <h4>Top 10 Most Popular Sweets You Must Try</h4>
          <a href="#">Read more</a>
         </div>
         <div class="blog-12-img">
          <img src="{{ asset('images/latest-img-2.png') }}" />
          <p>April 17, 2024</p>
          <h4>Preserving Cooking and Sweets</h4>
          <a href="#">Read more</a>
         </div>
         <div class="blog-12-img">
          <img src="{{ asset('images/latest-img-3.png') }}" />
          <p>April 10, 2024</p>
          <h4>Alchemy: A Reflection on the Magic of Milk</h4>
          <a href="#">Read more</a>
         </div>
   </div>
</div>
{{-- Blog-12-end --}}


{{-- Blog-13-start --}}
<div class="row blog-13-container">
<div class="col-lg-10 blog-13-head" >
<h2>We Are Also Available on</h2>
<p>Same day delivery in Bangalore</p>
</div>
<div class="col-lg-10 blog-13-images" >
  <div class="blog-13-head-img">
    <img src="{{ asset('images/swiggy-img.png') }}" />

  </div>
  <div class="blog-13-head-img">
    <img src="{{ asset('images/amazon-img.png') }}" />

  </div>
  <div class="blog-13-head-img">
    <img src="{{ asset('images/zomato-img.png') }}" />

  </div>
  <div class="blog-13-head-img">
    <img src="{{ asset('images/swiggy-img.png') }}" />

  </div>
  <div class="blog-13-head-img">
    <img src="{{ asset('images/amazon-img.png') }}" />

  </div>
  <div class="blog-13-head-img">
    <img src="{{ asset('images/swiggy-img.png') }}" />

  </div>

</div> 
</div>
{{-- Blog-13-end --}}


@endsection