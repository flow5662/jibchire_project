<%@ page import="dao.CmtHousewarming" %>
<%@ page import="dto.Post_house" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.net.URLEncoder"%>
<%@ page import="java.io.File"%>
<%@ page import="java.io.*"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>게시글 읽기</title>
	<link rel="stylesheet" type="text/css" href="style/view_read.css">
</head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script src="js/view_read.js"> </script>
<%
 request.setCharacterEncoding("utf-8");
%>
<%
	Post_house po = (Post_house)request.getAttribute("post");
%>
<body>
 	<!-- header -->
 	<header>
    <% 
		request.setCharacterEncoding("utf-8"); 
		String id = (String) session.getAttribute("ID");  //session값에서 아이디 가져올 때 null이면 일반헤더, 아니면 로그인헤더
		if((id==null)){
	%>
		<jsp:include page="header.jsp" />
	<%
		}else{
	%>
		<jsp:include page="header_login.jsp" />
	<%
		}
	%>
	</header>
		<div id="wrap">

			<%
			String savePath = "/community/communityPic";
			ServletContext context = getServletContext();
			String sDownloadPath = context.getRealPath(savePath);
			String sFilePath = sDownloadPath + "\\" + po.getPost_pics();
			//out.println("<section id='mainpic'><img src='"+sFilePath+"'> </section>");
			//out.println(sFilePath);
			%>
			<!-- 사진 슬라이더 -->
			<div id="mainpic">
				 <img src="postPics/<%=po.getPost_pics() %>" id="mainpicimg">
				 			<!-- 세부내용박스(집특징, 평수 등등) -->	   	
			   	<div id="info">
			   		<table>
			   			<tr><td>주거형태</td>
			   				<td><%=po.getPost_house()%> </td>
			   				<td>방개수</td>
			   				<td><%=po.getPost_rooms()%>개</td>
			   				<td>집 평수</td>
			   				<td><%=po.getPost_m2()%>평</td>
			   			</tr>
			   			<tr>	
			   				<td>집 연식</td>
			   				<td><%=po.getPost_houseold()%>년 이상</td>
			   				<td>가족 인원</td>
			   				<td><%=po.getPost_fam()%>명</td>
			   				<td>가족 형태</td>
			   				<td><%=po.getPost_family()%></td>
			   			</tr>
	<!-- 		   			<tr> 스타일, 색상 빠졌음--> 
	<!-- 		   				<td>가족 인원</td> -->
	<%-- 		   				<td><%=po.getPost_fam()%>명</td> --%>
	<!-- 		   				<td>가족형태</td> -->
	<%-- 		   				<td><%=po.getPost_family()%></td> --%>
	<!-- 		   				<td>반려동물</td> -->
	<%-- 		   				<td><%=po.getPost_pet()%></td> --%>
	<!--    					</tr> -->
	<!--    					<tr> -->
	<!-- 		   				<td>지역</td> -->
	<%-- 		   				<td><%=po.getPost_region()%></td> --%>
	<!-- 		   				<td>예산</td> -->
	<%-- 		   				<td><%=po.getPost_budget()%>만원</td> --%>
	<!-- 		   				<td></td> -->
	<!-- 		   				<td></td> -->
	<!--    					</tr> -->
	<!--    					<tr> -->
	<!-- 		   				<td>공사시작일</td> -->
	<%-- 		   				<td><%=po.getPost_startdate()%></td> --%>
	<!-- 		   				<td>공사마감일</td> -->
	<%-- 		   				<td><%=po.getPost_enddate()%></td> --%>
	<!-- 		   				<td></td> -->
	<!-- 		   				<td></td> -->
	<!-- 		   			</tr> -->
			   		</table>
				</div >
			</div>

		   	<div id="title"> 
		   		<h1><%=po.getPost_title() %></h1>
		   		<!-- //현재 session에서 저장된 ID값과 db에서 가져온 id 값이 일치한다면 버튼생성 -->
		   		<%
		   		//글의 데이터에서 작성자의 아이디와, 현제 로그인한 사람의 아이디가 동일하면 삭제, 수정버튼 생성
			   	String id2 = po.getCust_id();
				if(!(id==null) && id.equals(id2)){ 
					out.println("<input type='button' value='삭제' onclick="+"location.href='delete_write.jsp?post_id="+po.getPost_id()+"'>"); //삭제버튼 누르면 그 글을 바로 삭제
					out.println("<input type='button' value='수정' onclick="+"location.href='view_update.jsp?post_id="+po.getPost_id()+"'>"); //수정버튼 누르면 그 글의 수정페이지로
					out.println("<input type = 'hidden' name ='post_id' id='post_id' value = "+po.getPost_id()+">");
				}	
				%>   	
		   	</div>	
			<!-- 내용 -->
			<div class="content">
		   		<pre>
		   			<%=po.getPost_txt()%>
		   		</pre>
    		</div>
    		<div class="postPics">
				 <div class="pics">
				 	<img src="postPics/<%=po.getPost_pic2() %>" id="insertedbigpicture" style="width:630px; height: 780px;">
				 </div>
				 <div class="postItem">
				 	<!-- 큰 사진에 대한 상품 사진 넣는 공간 -->
				 	<ul class="insertedpicture">
				 		<li><img src="postPics/<%=po.getPost_pics()%>" style="width:130px; height: 190px;"> 
				 			<input type="hidden" value="postPics/<%=po.getPost_pics()%>"></li>
				 		<li><img src="postPics/<%=po.getPost_pic2()%>" style="width:130px; height: 190px;"> 
				 			<input type="hidden" value="postPics/<%=po.getPost_pic2()%>"></li>
				 		<li><img src="postPics/<%=po.getPost_pic3()%>" style="width:130px; height: 190px;"> 
				 			<input type="hidden" value="postPics/<%=po.getPost_pic3()%>"></li>
				 		<li><img src="postPics/<%=po.getPost_pic4()%>" style="width:130px; height: 193px;"> 
				 			<input type="hidden" value="postPics/<%=po.getPost_pic4()%>"></li>
				 	</ul>
				 </div> 
	 		</div>
	 		<!-- 상품(슬라이드) 에 대한 세부정보 들어가는 공간 -->
			 	<ul class="itemthumbnailinfo">
			 		<li> <div id="iteminfo10" class="postIteminfos">123 </div> </li>
			 		<li> <div class="postIteminfos">123 </div> </li>
			 		<li> <div class="postIteminfos"> 123</div> </li>
			 		<li> <div class="postIteminfos"> 123</div> </li>
			 	</ul>
			<!-- 상품 슬라이드 -->
			<div id="slider" >
				<a class="control_next">>></a>
				<a class="control_prev"><<</a>
				<ul class="itemthumbnail">
<%-- 						<% if(!(po.getPost_item10()==null)){ %> --%>
				    <li class="item10"><img src="postPics/<%=po.getPost_item10()%>"style="width:130px; height: 130px;">
				    	<input type="hidden" value="<%=po.getPost_item10()%>"></li>
<%-- 				    	<% }else if(!(po.getPost_item11()==null)){ %> --%>
				    <li><img src="postPics/<%=po.getPost_item11()%>"style="width:130px; height: 130px;">
				    	<input type="hidden" value="<%=po.getPost_item11()%>"></li>
<%-- 				    	<% }else if(!(po.getPost_item12()==null)){ %> --%>
				    <li><img src="postPics/<%=po.getPost_item12()%>"style="width:130px; height: 130px;">
				    	<input type="hidden" value="<%=po.getPost_item12()%>"></li>
<%-- 				    	<% }else if(!(po.getPost_item13()==null)){ %> --%>
				    <li><img src="postPics/<%=po.getPost_item13()%>"style="width:130px; height: 130px;">
				    	<input type="hidden" value="<%=po.getPost_item13()%>"></li>
<%-- 			    		<% }else if(!(po.getPost_item14()==null)){ %> --%>
			    	<li><img src="postPics/<%=po.getPost_item14()%>"style="width:130px; height: 130px;">
				    	<input type="hidden" value="<%=po.getPost_item14()%>"></li>
<%-- 				    	<% }else if(!(po.getPost_item15()==null)){ %> --%>
				    <li><img src="postPics/<%=po.getPost_item15()%>"style="width:130px; height: 130px;">
				    	<input type="hidden" value="<%=po.getPost_item15()%>"></li>
				    	<%  if(!(po.getPost_item16()==null)){ %>
				    <li><img src="postPics/<%=po.getPost_item16()%>"style="width:130px; height: 130px;">
				    	<input type="hidden" value="<%=po.getPost_item16()%>"></li>
				    	<% }else if(!(po.getPost_item17()==null)){ %>
				    <li><img src="postPics/<%=po.getPost_item17()%>"style="width:130px; height: 130px;">
				    	<input type="hidden" value="<%=po.getPost_item17()%>"></li>
				    	<% }else if(!(po.getPost_item18()==null)){ %>
			    	<li><img src="postPics/<%=po.getPost_item18()%>"style="width:130px; height: 130px;">
				    	<input type="hidden" value="<%=po.getPost_item18()%>"></li>
				    	<% }else if(!(po.getPost_item19()==null)){ %>
			    	<li><img src="postPics/<%=po.getPost_item19()%>"style="width:130px; height: 130px;">
				    	<input type="hidden" value="<%=po.getPost_item19()%>"></li>
				    	<%} %>
			    </ul>
			</div>	
			<pre>
    			<%=po.getPost_txt2()%>
    		</pre>
<!--     		<div class="postPics"> -->
<%-- 				 <div class="pics"> <img src="postPics/<%=po.getPost_pic3() %>"style="width:600px; height: auto;"> </div> --%>
<!-- 				 <div class="postItem"> -->
<!-- 				 	<ul class="itemthumbnailinfo"> -->
<!-- 				 		<li> <div class="postIteminfos"> </div> </li> -->
<!-- 				 		<li> <div class="postIteminfos"> </div> </li> -->
<!-- 				 		<li> <div class="postIteminfos"> </div> </li> -->
<!-- 				 		<li> <div class="postIteminfos"> </div> </li> -->
<!-- 				 	</ul> -->
<!-- 				 	큰 사진에 대한 상품 사진 넣는 공간 -->
<!-- 				 	<ul class="itemthumbnail"> -->
<%-- 				 		<li><img src="postPics/<%=po.getPost_item10()%>" style="width:120px; height: 120px;">  --%>
<%-- 				 			<input type="hidden" value="<%=po.getPost_item10()%>"></li> --%>
<%-- 				 		<li><img src="postPics/<%=po.getPost_item11()%>" style="width:120px; height: 120px;">  --%>
<%-- 				 			<input type="hidden" value="<%=po.getPost_item11()%>"></li> --%>
<%-- 				 		<li><img src="postPics/<%=po.getPost_item12()%>" style="width:120px; height: 120px;">  --%>
<%-- 				 			<input type="hidden" value="<%=po.getPost_item12()%>"></li> --%>
<%-- 				 		<li><img src="postPics/<%=po.getPost_item13()%>" style="width:120px; height: 120px;">  --%>
<%-- 				 			<input type="hidden" value="<%=po.getPost_item13()%>"></li> --%>
<!-- 				 	</ul> -->
<!-- 				 </div>  -->
<!-- 			</div> -->
		</div>
	<!-- footer -->
	<footer>
		<jsp:include page="footer.jsp" />
	</footer>
<script>
$(function(){
	//상품상세설명 
	$(".postIteminfos").hide();
	$(".itemthumbnail > li.item10").mouseover(function(){
		var picName = $(".itemthumbnail > li.item10 >input[type=hidden]").val();
// 		$.ajax({
// 			url : "select_product.jsp?picture="+picName,  
// 			dataType : "html",
// 			success : function(check){
// 				$(".itemthumbnailinfo > li:first-child > div").html(check);
// 			}
// 		}); 
		$("#iteminfo10").show();
		//$(".itemthumbnailinfo > li:first-child > div").show();
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
// 	$(".itemthumbnail > li:nth-child(3)").mouseover(function(){
// 		var picName = $(".itemthumbnail > li:nth-child(3) >input[type=hidden]").val();
// 		$.ajax({
// 			url : "select_product.jsp?picture="+picName,  
// 			dataType : "html",
// 			success : function(check){
// 				$(".itemthumbnailinfo > li:nth-child(3)> div").html(check);
// 			}
// 		}); 
// 		$(".itemthumbnailinfo > li:nth-child(3) > div").show();
// 	});
// 	$(".itemthumbnail > li:nth-child(4)").mouseover(function(){
// 		var picName = $(".itemthumbnail > li:nth-child(4) >input[type=hidden]").val();
// 		$.ajax({
// 			url : "select_product.jsp?picture="+picName,  
// 			dataType : "html",
// 			success : function(check){
// 				$(".itemthumbnailinfo > li:nth-child(4)> div").html(check);
// 			}
// 		}); 
// 		$(".itemthumbnailinfo > li:nth-child(4) > div").show();
// 	});
	
	$(".itemthumbnail > li.item10 ").mouseout(function(){
		$(".postIteminfos").hide();
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

	var slideCount = $('#slider ul li').length; //리스트 개수
	var slideWidth = $('#slider ul li').width();
	var slideHeight = $('#slider ul li').height();
	var sliderUlWidth = slideCount * slideWidth;
	var selectNum = null;
	if(slideCount<6){
		selectNum=0;
		$('a.control_prev').hide();
	}else{
		selectNum = slideCount-6;
	}
	
	$('#slider').css({ width: slideWidth * slideCount, height: slideHeight });	
	$('#slider ul').css({ width: sliderUlWidth, marginLeft: - slideWidth*selectNum });	//한 줄에 6개 들어감
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
});
</script>
</body>
</html>