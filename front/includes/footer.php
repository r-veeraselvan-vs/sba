

<footer>
	<div class="contentWrap">
    	<p>Copyright &copy; <script type="text/javascript" type="text/javascript">document.write((new Date()).getFullYear());</script> <a href="#">www.kannottam.com</a></p>
    </div>
</footer>

<script src="js/jquery-2.2.4.min.js" ></script>
<script src="js/bestplugins.js" ></script>
<script type="text/javascript" src="slick/slick.js"></script>
<script type="text/javascript">
jQuery( document ).ready(function( $ ) {
	var winWidth = $(window).width();
	var winTop = $(window).scrollTop();
	
	$(window).resize(function(){
		winWidth = $(window).width();
		
		//DISABLE DROP DOWN IN WRITERS PAGE ON DESKTOP
		if(winWidth > 768){ $('#writeDDList').css('display', ''); $('#writeDDBtn').removeClass('active'); }
	});
	
	//TOP SEARCH BUTTON
	$('.searchBtn').on('click', function(e){ e.preventDefault(); $('#search_form').fadeToggle(300); });
	$(document).on('click', function(e){ if(!$(e.target).is('.searchBtn, #search_form, #search_form *')){ $('#search_form').fadeOut(300); } });
		
	//TOP MENU
	$('#bestNav').bestnav({
		breakpoint : 1150,
		dropDownWidth : 200,
		customUlClass : "menu",
		displayArrow : true,
		linkArrow : true,
		mobileBtnCustom:true,
		mobileBtnClass : "navBtn",
		addBodyClass : true,
	});
	
	//HOMEPAGE BOOK SLIDER
	if($('.bookSlider').length){
		$('.bookSlider').slick({
			infinite: true,
			slidesToShow: 5,
			slidesToScroll: 1,
			arrows: true,
			speed:500,
			responsive: [
				{ breakpoint: 1190, settings: { slidesToShow: 4, } },
				{ breakpoint: 991, settings: { slidesToShow: 3, } },
				{ breakpoint: 760, settings: { slidesToShow: 2, } },
				{ breakpoint: 567, settings: { slidesToShow: 1, } },
			]
		});
	}
	
	//DROP DOWN SCRIPT IN WRITERS PAGE
	$('#writeDDBtn').on('click', function(){
		$(this).toggleClass('active');
		if(winWidth < 768){ $('#writeDDList').slideToggle(300); }
	});
	
	//CART QUANTITY ADD AND SUBSTRACT METHOD
	$('.cartPlus').on('click', function(e){
		e.preventDefault();
		var qty = $(this).parent().find('.qty').val();
		$(this).parent().find('.qty').val(parseInt(qty)+1);
	});
	$('.cartMinus').on('click', function(e){
		e.preventDefault();
		var qty = $(this).parent().find('.qty').val();
		if(qty > 0){ $(this).parent().find('.qty').val(parseInt(qty)-1); }
	});
	
	//FORM LABEL ANIMATION - STARTS
	$('.animatedLabels .formFieldBox input, .animatedLabels .formFieldBox textarea').on('focus', function(){
		$(this).parent().addClass('focused');	
	}).on('blur', function(){
		if($(this).val().trim() == ''){
			$(this).parent().removeClass('focused');	
		}
	});
	$('.animatedLabels .formFieldBox input, .animatedLabels .formFieldBox textarea').each(function(){
		if($(this).val().trim() != ''){
			$(this).parent().addClass('focused');	
		}
	});
	//FORM LABEL ANIMATION - ENDS
	
	//COMMENTS STAR RATING - STARTS
	var selected = 0; 
	$('.commentRating .starInput').on('mouseenter', function(){
		$(this).addClass('active').prevAll('.starInput').addClass('active');
	}).on('mouseleave', function(){
		$(this).removeClass('active').prevAll('.starInput').removeClass('active');
		if(selected > 0){ 
			$('.commentRating .starInput').slice(0, selected).addClass('active');
			$('.commentRating .starInput').slice(selected, $('.commentRating .starInput').length).removeClass('active');
		}
	}).on('click', function(){
		rated = true;
		selected = $(this).index();
		$(this).addClass('active').prevAll('.starInput').addClass('active');
		$('.commentRating .starInput').slice(selected, $('.commentRating .starInput').length).removeClass('active');
		$('#ratingVal').val(selected);
	});
	//COMMENTS STAR RATING - ENDS
	
	//MAGAZINE DETAILS - TYPE SELECT - STARTS
	$('.qtyPriceWrap label.priceBox').on('click', function(e){
		$(this).addClass('selected').siblings().removeClass('selected');
	});
	//MAGAZINE DETAILS - TYPE SELECT - ENDS
	
	//DETAILS PAGE BOOK SLIDER - STARTS
	if ( $('#singleMainSlider').length ) {
        var $slider = $('#singleMainSlider')
            .on('init', function(slick) {
                $('#singleMainSlider').fadeIn(1000);
            })
            .slick({
				infinite: false,
                slidesToShow: 1,
                slidesToScroll: 1,
                arrows: false,
                asNavFor: '#singleThumbSlider'
            });

		var $slider2 = $('#singleThumbSlider')
			.on('init', function(slick) {
				$('#singleThumbSlider').fadeIn(1000);
			})
			.slick({
				infinite: false,
				slidesToShow: 4,
				slidesToScroll: 1,
				arrows: false,
				asNavFor: '#singleMainSlider',
				dots: false,
				centerMode: false,
				focusOnSelect: true
			});
		 //remove active class from all thumbnail slides
		 $('#singleThumbSlider .slick-slide').removeClass('slick-active');
		 //set active class to first thumbnail slides
		 $('#singleThumbSlider .slick-slide').eq(0).addClass('slick-active');
		 // On before slide change match active thumbnail to current slide
		 $('#singleMainSlider').on('beforeChange', function (event, slick, currentSlide, nextSlide) {
			var mySlideNumber = nextSlide;
			$('#singleThumbSlider .slick-slide').removeClass('slick-active');
			$('#singleThumbSlider .slick-slide').eq(mySlideNumber).addClass('slick-active');
		});
	}
	//DETAILS PAGE BOOK SLIDER - ENDS

	
});

</script>

</body>
</html>
