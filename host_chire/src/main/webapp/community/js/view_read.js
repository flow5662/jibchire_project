$(function(){	
	
	/* 포지션별로 지정된 아이콘에 대한 정보 가져오기 */
	$("#position img").mouseover(function(){
		var pro_id = $(this).attr("id");
		//alert(pro_id);
		var div_id = "#item_div"+pro_id;
		$.ajax({
 			url : "select_item.jsp?pro_id="+pro_id,  
 			dataType : "html",
 			success : function(check){
				//alert(check);
 				$(div_id).html(check);
 			}
 		}); 
 		$(div_id).show(100);
		$("#position img").mouseout(function(){
			$(div_id).hide(50,'swing');
			$(".postPics").css("top", 0);
		});
	});
	/* 처음 게시글을 클릭할 때 2번사진에 포커스가 가있기 때문에 나머지는 지우면 됨 */
	$("#position ul li:nth-child(1)").hide();
	$("#position ul li:nth-child(3)").hide();
	$("#position ul li:nth-child(4)").hide();
	/*사진에 마우스 올리면 각기 다른 아이콘 위치 뜨기*/
	$(".insertedpicture li:nth-child(1)").mouseover(function(){
//		alert("1");
		$("#position ul li:nth-child(1)").show();
		$("#position ul li:nth-child(2)").hide();
		$("#position ul li:nth-child(3)").hide();
		$("#position ul li:nth-child(4)").hide();
	});
	$(".insertedpicture li:nth-child(2)").mouseover(function(){
//		alert("2");
		$("#position ul li:nth-child(1)").hide();
		$("#position ul li:nth-child(2)").show();
		$("#position ul li:nth-child(3)").hide();
		$("#position ul li:nth-child(4)").hide();
	});
	$(".insertedpicture li:nth-child(3)").mouseover(function(){
//		alert("3");
		$("#position ul li:nth-child(1)").hide();
		$("#position ul li:nth-child(2)").hide();
		$("#position ul li:nth-child(3)").show();
		$("#position ul li:nth-child(4)").hide();
	});
	$(".insertedpicture li:nth-child(4)").mouseover(function(){
//		alert("4");
		$("#position ul li:nth-child(1)").hide();
		$("#position ul li:nth-child(2)").hide();
		$("#position ul li:nth-child(3)").hide();
		$("#position ul li:nth-child(4)").show();
	});

	
	//상품상세설명 
 	$(".itemthumbnailinfo").hide();
	$(".itemthumbnail > li#item10").mouseover(function(){
		var picName = $(".itemthumbnail > li#item10 >input[type=hidden]").val();
 		$.ajax({
 			url : "select_product.jsp?picture="+picName,  
 			dataType : "html",
 			success : function(check){
 				$(".itemthumbnailinfo").html(check);
 			}
 		}); 
		$(".itemthumbnailinfo").show();
	});
	$(".itemthumbnail > li#item11").mouseover(function(){
		var picName = $(".itemthumbnail > li#item11 >input[type=hidden]").val();
 		$.ajax({
 			url : "select_product.jsp?picture="+picName,  
 			dataType : "html",
 			success : function(check){
 				$(".itemthumbnailinfo").html(check);
 			}
 		}); 
		$(".itemthumbnailinfo").show();
	});
	$(".itemthumbnail > li#item12").mouseover(function(){
		var picName = $(".itemthumbnail > li#item12 >input[type=hidden]").val();
 		$.ajax({
 			url : "select_product.jsp?picture="+picName,  
 			dataType : "html",
 			success : function(check){
 				$(".itemthumbnailinfo").html(check);
 			}
 		}); 
		$(".itemthumbnailinfo").show();
	});
	$(".itemthumbnail > li#item13").mouseover(function(){
		var picName = $(".itemthumbnail > li#item13 >input[type=hidden]").val();
 		$.ajax({
 			url : "select_product.jsp?picture="+picName,  
 			dataType : "html",
 			success : function(check){
 				$(".itemthumbnailinfo").html(check);
 			}
 		}); 
		$(".itemthumbnailinfo").show();
	});
	$(".itemthumbnail > li#item14").mouseover(function(){
		var picName = $(".itemthumbnail > li#item14 >input[type=hidden]").val();
 		$.ajax({
 			url : "select_product.jsp?picture="+picName,  
 			dataType : "html",
 			success : function(check){
 				$(".itemthumbnailinfo").html(check);
 			}
 		}); 
		$(".itemthumbnailinfo").show();
	});
	$(".itemthumbnail > li#item15").mouseover(function(){
		var picName = $(".itemthumbnail > li#item15 >input[type=hidden]").val();
 		$.ajax({
 			url : "select_product.jsp?picture="+picName,  
 			dataType : "html",
 			success : function(check){
 				$(".itemthumbnailinfo").html(check);
 			}
 		}); 
		$(".itemthumbnailinfo").show();
	});
	$(".itemthumbnail > li#item16").mouseover(function(){
		var picName = $(".itemthumbnail > li#item16 >input[type=hidden]").val();
 		$.ajax({
 			url : "select_product.jsp?picture="+picName,  
 			dataType : "html",
 			success : function(check){
 				$(".itemthumbnailinfo").html(check);
 			}
 		}); 
		$(".itemthumbnailinfo").show();
	});
	$(".itemthumbnail > li#item17").mouseover(function(){
		var picName = $(".itemthumbnail > li#item17 >input[type=hidden]").val();
 		$.ajax({
 			url : "select_product.jsp?picture="+picName,  
 			dataType : "html",
 			success : function(check){
 				$(".itemthumbnailinfo").html(check);
 			}
 		}); 
		$(".itemthumbnailinfo").show();
	});
	$(".itemthumbnail > li#item18").mouseover(function(){
		var picName = $(".itemthumbnail > li#item18 >input[type=hidden]").val();
 		$.ajax({
 			url : "select_product.jsp?picture="+picName,  
 			dataType : "html",
 			success : function(check){
 				$(".itemthumbnailinfo").html(check);
 			}
 		}); 
		$(".itemthumbnailinfo").show();
	});
	$(".itemthumbnail > li#item19").mouseover(function(){
		var picName = $(".itemthumbnail > li#item19 >input[type=hidden]").val();
 		$.ajax({
 			url : "select_product.jsp?picture="+picName,  
 			dataType : "html",
 			success : function(check){
 				$(".itemthumbnailinfo").html(check);
 			}
 		}); 
		$(".itemthumbnailinfo").show();
	});
// 	$(".itemthumbnail > li:nth-child(2)").mouseover(function(){
// 		var picName = $(".itemthumbnail > li:nth-child(2) >input[type=hidden]").val();
// 		$.ajax({
// 			url : "select_product.jsp?picture="+picName,  
// 			dataType : "html",
// 			success : function(check){
// 				$(".itemthumbnailinfo > li:nth-child(2)> div").html(check);
// 			}
// 		}); 
// 		$(".itemthumbnailinfo > li:nth-child(2) > div").show();
// 	});
	
	$(".itemthumbnail > li ").mouseout(function(){
		$(".itemthumbnailinfo").hide();
	});
	
	//메인사진 4개 보이기
	$(".insertedpicture > li:first-child").mouseover(function(){
		var picName = $(".insertedpicture > li:first-child >input[type=hidden]").val();
		$(".pics>#insertedbigpicture").attr("src",picName);
	});
	$(".insertedpicture > li:nth-child(2)").mouseover(function(){
		var picName = $(".insertedpicture > li:nth-child(2) >input[type=hidden]").val();
		$(".pics>#insertedbigpicture").attr("src",picName);
	});
	$(".insertedpicture > li:nth-child(3)").mouseover(function(){
		var picName = $(".insertedpicture > li:nth-child(3) >input[type=hidden]").val();
		$(".pics>#insertedbigpicture").attr("src",picName);
	});
	$(".insertedpicture > li:nth-child(4)").mouseover(function(){
		var picName = $(".insertedpicture > li:nth-child(4) >input[type=hidden]").val();
		$(".pics>#insertedbigpicture").attr("src",picName);
	});
	
// 	자동 슬라이딩 기능 꺼둠
// 	setInterval(function(){moveRight();}, 9000);
	var slideCount = $('#slider .itemthumbnail li').length; //리스트 개수
	var slideWidth = $('#slider .itemthumbnail li').width();
	var slideHeight = $('#slider .itemthumbnail li').height()+$('#slider .itemthumbnailinfo li').height();
	var sliderUlWidth = slideCount * slideWidth;
	var selectNum = null;
	if(slideCount<6){
		selectNum=0;
		$('a.control_prev').hide();
		$('a.control_next').hide();
		/*상품 6개 이하면 굳이 슬라이드 버튼 안누를 수 있게끔 */
	}else{
		selectNum = slideCount-6;
	}
	
	$('#slider').css({ width: slideWidth * slideCount, height: slideHeight });	
	$('#slider .itemthumbnail').css({ width: sliderUlWidth, marginLeft: - slideWidth*selectNum });	//한 줄에 6개 들어감
    $('#slider .itemthumbnail li:last-child').prependTo('#slider ul');

    function moveLeft() {
        $('#slider .itemthumbnail').animate({
            left: + slideWidth
        }, 200, function () {
            $('#slider .itemthumbnail li:last-child').prependTo('#slider .itemthumbnail');
            $('#slider .itemthumbnail').css('left', '');
        });
    };
    function moveRight() {
        $('#slider .itemthumbnail').animate({
            left: - slideWidth
        }, 200, function () {
            $('#slider .itemthumbnail li:first-child').appendTo('#slider .itemthumbnail');
            $('#slider .itemthumbnail').css('left', '');
        });
    };
    $('a.control_prev').click(function () {
        moveLeft();
    });
    $('a.control_next').click(function () {
        moveRight();
    });
    
	$("input:button[value=삭제]").click(function(){  // 글삭제 버튼 눌렀을 때 한 번 더 의도 체크, 확인버튼 누를 때 삭제
		var num = $("#post_id").val();
		var con = confirm("삭제하시겠습니까?");
		if(con){
			location.href='delete_write.jsp?post_id='+num; //url로 값을 바로 줘서 다음페이지에서 아무런 그거 없어도 되니까
		}
	});
	});