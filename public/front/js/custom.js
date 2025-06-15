jQuery( document ).ready(function( $ ) {
	
	var winWidth = $(window).width();
	var winHeight = $(window).height();
	var winTop = $(window).scrollTop();
	
	$(window).resize(function(){
		winWidth = $(this).width();
		winHeight = $(this).height();
		
	});
	
	$(window).scroll(function(){
		winTop = $(this).scrollTop();
		
		activeScrollTopBtn();
	});
	
	function activeScrollTopBtn(){
		if(winTop > 500){ $('#scrollTopBtn').fadeIn(500);  
		}else{ $('#scrollTopBtn').fadeOut(500); }
	}
	activeScrollTopBtn();
	
	function isScrolling(){
		if(winTop > 100){ $('#masterhead').addClass('scrolling');  
		}else{ $('#masterhead').removeClass('scrolling');  }
	}
	
	$('#scrollTopBtn').on('click', function(){
	  	$('html, body').animate({ scrollTop: 0 }, 'normal', 'linear');
	});
	
	
	
});
