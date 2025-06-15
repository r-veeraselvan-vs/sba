<div class="tab-pane @if(Session::get('tab') == 'review') active in @endif" id="product-tab-reviews">
    <div class="d-flex align-items-center mb-5">
        @php
            $average_ratings = $product->average_ratings;
            $star = $average_ratings * 20;
        @endphp
        <h4 class="mb-0 mr-2">Average Rating:</h4>
        <div class="ratings-container average-rating mb-0">
            <div class="ratings-full">
                <span class="ratings" style="width:{{$star}}%"></span>
                <span class="tooltiptext tooltip-top">{{ $average_ratings }}</span>
            </div>
        </div>
    </div>
    @if(count($reviews) > 0)
        <div class="comments mb-6">
            <ul>                
                @foreach($reviews as $review)
                    <li>
                        <div class="comment">
                            <figure class="comment-media">
                                <a href="#">
                                    <img src="/images/avatar.png" alt="avatar">
                                </a>
                            </figure>

                            <div class="comment-body">
                                @php
                                    $rating = $review->ratings;
                                    $star = $rating * 20;
                                @endphp
                                <div class="comment-rating ratings-container mb-0">
                                    <div class="ratings-full">
                                        <span class="ratings" style="width:{{$star}}%"></span>
                                        <span class="tooltiptext tooltip-top">{{ $rating }}</span>
                                    </div>
                                </div>
                                <div class="comment-user">
                                    <span class="comment-date">{{ $review->created_at->diffForHumans() }}</span>
                                </div>

                                <div class="comment-content">
                                    <p>{{ $review->review }}</p>
                                </div>
                            </div>
                        </div>
                    </li>
                @endforeach
            </ul>
        </div>
    @endif
    <!-- End Comments -->
    <div class="reply">
        <div class="title-wrapper text-left">
            <h3 class="title title-simple text-left text-normal">Add a Review</h3>
            <p>Your email address will not be published. Required fields are marked *</p>
        </div>
        <div class="rating-form">
            <label for="rating">Your rating: </label>
            <span class="rating-stars">
                <a class="star-1" href="#">1</a>
                <a class="star-2" href="#">2</a>
                <a class="star-3" href="#">3</a>
                <a class="star-4" href="#">4</a>
                <a class="star-5" href="#">5</a>
            </span>
        </div>
        <form action="{{ route('customer.review') }}">
            <textarea id="review" cols="30" rows="4" name="review" class="form-control mb-4" placeholder="Comment *"
                required></textarea>
            <div class="row">
                <input type="hidden" name="ratings" id="rating-value" value="1">
                <input type="hidden" name="product_id" value="{{ $product->id }}">
            </div>
            <button type="submit" class="btn btn-primary btn-md">Submit<i class="d-icon-arrow-right"></i></button>
        </form>
    </div>
    <!-- End Reply -->
</div>