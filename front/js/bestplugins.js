/**
 * BEST NAVIGATION
 * @version 3.0.0
 * @author Senthil Kumar
 */
 (function ( $ ) {
 
    $.fn.bestnav = function( options ) {
		
		//DEFAULT VALUES
        var defaults = {
			breakpoint : 1023,
			dropDownWidth : 200,
			customUlClass : "menu",
			mobileBtnCustom : false,
			mobileBtnClass : "navBtn",
			mobileNavLinkClickClose : false,
			addBodyClass : false,
        };
		//OVERIDE DEFAULT VALUES
		var settings = $.extend({}, defaults, options);
		
		//MAIN VARIABLES
		var $selector = $(this);
		var winWidth = $(window).width();
		var winHeight = $(window).height();
		var handheld = false;
		var breakpoint = settings.breakpoint;
		var dropDownWidth = settings.dropDownWidth;
		var mobileBtnCustom = settings.mobileBtnCustom;
		var mobileBtnClass =  settings.mobileBtnClass;
		var mobileNavLinkClickClose = settings.mobileNavLinkClickClose;
		
		var addBodyClass = settings.addBodyClass;
		
		var $navBtn = $('.'+settings.mobileBtnClass);
		
		var $menuWrapper =  $selector.find(' > .menuWrapper');
		var customUlClass = settings.customUlClass;
		var $primaryUL = $selector.find('ul.'+customUlClass);
		var $primaryItems = $primaryUL.find(' > li');
		var $allUl = $selector.find('ul');
		var $allItems = $primaryUL.find('li');
		
		var currentNavPos = 0;
		var oldWidth = $(window).width();
		
		//ADDING HANDHELD NAVBTN
		if(!mobileBtnCustom){
			$selector.prepend('<div class="'+ mobileBtnClass +'"></div>');
			$navBtn = $('.'+settings.mobileBtnClass);
		}
		
		//WINDOW RESIZE FUNCTIONS
		$(window).resize(function(){
			winWidth = $(window).width();
			winHeight = $(window).height();
			
			if(oldWidth != winWidth){
			    oldWidth = winWidth;
			    handheldChk();
			    clsMobiMenu();
			}
			
		});
		//HANDHELD CHECK FUNCTION
		function handheldChk(){
			if(winWidth > breakpoint && breakpoint !== 0){
				handheld = false; 
				$selector.removeClass('handheld');
				if(addBodyClass){ $('body').removeClass('handheldView'); }
				//POSITIONING SUBNAV CONTAINERS
				$menuWrapper.show(0);
				$primaryUL.find('ul').hide(0).css({'width':dropDownWidth+'px'}).find('ul').hide(0).css({'left':dropDownWidth+'px'});
				$menuWrapper.css({'height':'','overflow-x':'visible'});
				//alert($primaryUL('ul ul'));
				$('#bestNav').animate({'opacity':1});
			}else if(winWidth <= breakpoint || breakpoint === 0){
				handheld = true; 
				$selector.addClass('handheld'); 
				if(addBodyClass){ $('body').addClass('handheldView'); }
				$primaryUL.find('ul').css({'width':''}).find('ul').css({'left':''});
				$menuWrapper.hide(0);
				$('#bestNav').animate({'opacity':1});
			}
		}
		handheldChk();
		
		//DESKTOP DROPDOWN NAV FUNCTION
		$selector.on({
			mouseenter : function(){ 
				if(!handheld && $(this).find(' > ul').length > 0){ dropDown($(this),true); }
			},
			mouseleave : function(){ 
				if(!handheld && $(this).find(' > ul').length > 0){ dropDown($(this),false); }
			}
		},'li');
		
		//DROPDOWN FUNCTIONS
		function dropDown(elm,action){
			var $subNav = elm.find(' > ul');
			var firstUl = elm.parent().hasClass(customUlClass);
			if(action){
				//CALCULATING WINDOW WIDTH AGAINST DD MENU WIDTH, THEN DECIDE WHERE TO DISPLAY DD MENU (LEFT OR RIGHT)
				if(firstUl){ $subNav.css({'left':'','right':''});
				}else{ $subNav.css({'left':dropDownWidth+'px','right':''}); }
				
				var subNavLft = $subNav.show(0).offset().left;
				$subNav.hide(0);
				
				if(dropDownWidth + subNavLft > winWidth){ 
					if(firstUl){ $subNav.css({'left':"",'right':'0'}); 
					}else{ $subNav.css({'left':"",'right':dropDownWidth+'px'});  }
				}else{ 
					if(firstUl){ $subNav.css({'left':"0",'right':''}); 
					}else{ $subNav.css({'left':dropDownWidth+'px'});  }
				}
				
				$subNav.stop().fadeIn(200);
			}else{
				$subNav.stop().fadeOut(200, function(){ $subNav.css({'left':'','right':''}); });
				
			}
		}
		
		//ADDING ARROWS FOR SUBNAV CONTAINERS
		function addMarkers(){
			$allItems.has('ul').find('> a').each(function(){
				var anchroLink = $(this).attr('href');
				if(anchroLink === "#"){
					$(this).addClass('accordLink');
				}
				
			});
			$allItems.has('ul').addClass('subNavParent').prepend('<span class="accordLink"></span>');
		}
		
		addMarkers();
		
		
		//HANDHELD NAV BUTTON FUNCTION
		$navBtn.on('click',function(){
			handHeldNavFunc();
		});
		
		var naveBeingOpened = false;
		function handHeldNavFunc(){
			
			if(naveBeingOpened){ return; }
			naveBeingOpened = true;
			setTimeout(function(){ naveBeingOpened = false; },400);
			
			var navActive = $navBtn.hasClass('navActive');
			if(!navActive){
				var navTop = $menuWrapper.css('top');
				$menuWrapper.css({'overflow-x':'auto','height':winHeight-navTop+'px'}).fadeIn();
				$navBtn.addClass('navActive');
				if(addBodyClass){ $('body').addClass('navOpened'); }
				
			}else if(navActive){
				clsMobiMenu();
			}
			
			if(!navActive){
				var itemHeight = $primaryUL.find(' > li > a').innerHeight();
				$primaryUL.find('span.accordLink').css({'height':itemHeight+'px'});	
			}
		}
		
		function clsMobiMenu(){ 
			var navActive = $navBtn.hasClass('navActive');
			if(navActive){
				$navBtn.removeClass('navActive');
				if(addBodyClass){ $('body').removeClass('navOpened'); }
				$menuWrapper.hide(0, function(){ $(this).css({'height':'','display':''}); });
			}
			$primaryUL.find('ul').slideUp();
			$primaryUL.find('span.accordLink').removeClass('active');
		}
		
		//CLOSE NAV WHEN CLICK OUTSIDE OR NAV LINKS
		$(document).on('click',function(e){
			if(handheld && !mobileNavLinkClickClose){
				var selId = $selector.attr('id');
				if(!$(e.target).is('.'+settings.mobileBtnClass+', .'+settings.mobileBtnClass+' *,#'+selId+' *')){ clsMobiMenu(); }
			}else if(handheld){
				if(!$(e.target).is('.'+settings.mobileBtnClass)){ clsMobiMenu(); }
			}
		});
		
		
		//SUBNAV ARROW CLICK FUNCTION
		$selector.on('click','.accordLink',function(e){
			e.preventDefault();
			if(handheld){
				$(this).toggleClass('active').parent().find(' > ul').slideToggle(300);
				$(this).parent().siblings().find('ul').slideUp();
				$(this).parent().siblings().find('.accordLink').removeClass('active');
			}
		});
		
		
		
 		//RETURN THIS OBJECT FOR CHAINABLITY
        return this;
 
    };
 
}( jQuery ));