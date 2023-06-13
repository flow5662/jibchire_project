	                                                                  /* 검색창*/	
function searchToggle(obj, evt){
    var container = $(obj).closest('.search-wrapper');
        if(!container.hasClass('active')){
            container.addClass('active');
            evt.preventDefault();
        }
        else if(container.hasClass('active') && $(obj).closest('.input-holder').length == 0){
            container.removeClass('active');
            // clear input
            container.find('.search-input').val('');
        }
	}
$(function(){
	$("div[id$=box]").hide();
    $("#scrollnav").hide();

	                                                                  /* 슬라이더*/	
	setInterval(function(){
        moveRight();
    }, 2000);

	var slideCount = $('#slider ul li').length;
	var slideWidth = $('#slider ul li').width();
	var slideHeight = $('#slider ul li').height();
	var sliderUlWidth = slideCount * slideWidth;
	
	$('#slider').css({ width: slideWidth, height: slideHeight });	
	$('#slider ul').css({ width: sliderUlWidth, marginLeft: - slideWidth });	
    $('#slider ul li:last-child').prependTo('#slider ul');

    function moveLeft() {
        $('#slider ul').animate({
            left: + slideWidth
        }, 200, function () {
            $('#slider ul li:last-child').prependTo('#slider ul');
            $('#slider ul').css('left', '');
        });
    };
    function moveRight() {
        $('#slider ul').animate({
            left: - slideWidth
        }, 200, function () {
            $('#slider ul li:first-child').appendTo('#slider ul');
            $('#slider ul').css('left', '');
        });
    };
    $('a.control_prev').click(function () {
        moveLeft();
    });
    $('a.control_next').click(function () {
        moveRight();
    });
	                                                                  /* 마우스 관련 이벤트*/
	$("div[id$=icon]").mouseover(function(){
		$(this).next().show();
		$(this).css("filter","opacity(0.5)");
		$(this).next().mouseover(function(){
			$(this).show();
			$(this).prev().css("filter","opacity(0.5)");
		})
		$(this).next().mouseout(function(){
			$(this).hide();
			$(this).prev().css("filter","opacity(1)");
		})
	});
	$("div[id$=icon]").mouseout(function(){
		$(this).next().hide();
		$(this).css("filter","opacity(1)");
	});

	$("section [class$=pic]").mouseenter(function(){
		$(this).css("scale","1.05");
		$(this).css("cursor","pointer");
	});
	$("section [class$=pic]").mouseleave(function(){
		$(this).css("scale","1.0");
	});

	$("div[id$=nav]").mouseover(function(){
		$(this).css("color","black");
	})
                                                                      /* 스크롤 관련 이벤트*/

    $(window).scroll( function(){
			
        $("div[class$=flow]").each( function(i){
            
            var bottom_of_element = $(this).offset().top + $(this).outerHeight()/2;
            var bottom_of_window = $(window).scrollTop() + $(window).height();
            
            if( bottom_of_window > bottom_of_element ){
                $(this).animate({'opacity':'1'},700);
            }           
        }); 
    });


    $(window).scroll(function(){

    	var rollIt = $(this).scrollTop() >= 500; //윈도우 스크롤 기능의 값이 높이와 같거나 크면
    	if(rollIt){ 		
            $("#scrollnav").fadeIn(1000).css({"position":"fixed"});
        }
        else{
            $("#scrollnav").hide();
        }
    });


	    /*  toggleclass 써보려고	
	$("section [class$=pic]").mouseover(function(){
		$(this).toggleclass('sizeup');
	});
	*/
});
