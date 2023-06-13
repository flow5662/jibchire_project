<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" type="text/css" href="style/bachi_main.css">
<title>고수메인</title>
</head>
<%
String cust_id = "test123"; //request.getParameter("cust_id");
String cust_pw = "test1234"; //requset.getParameter("cust_pw");
session.setAttribute("cust_id",cust_id);
session.setAttribute("cust_pw",cust_pw);
%>
<%
// 이미지 파일이 저장된 경로를 가져옵니다.
String imagePath = request.getServletContext().getRealPath("/image");

// 이미지 파일의 URL을 생성합니다.
String imageUrl = request.getContextPath() + "/image/";

%>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<!-- 탑 버튼 -->
<script>
$(window).scroll(function(){
	if ($(this).scrollTop() > 300){
		$('.btn_gotop').show();
	} else{
		$('.btn_gotop').hide();
	}
});
$('.btn_gotop').click(function(){
	$('html, body').animate({scrollTop:0},400);
	return false;
});
</script>
<!-- 슬라이더 -->
<script type="text/javascript">
jQuery(document).ready(function ($) {
	$("subnav").hide();
	setInterval(function () {
        moveRight();
    }, 3000);

	var slideCount = $('.slider ul li').length;
	var slideWidth = $('.slider ul li').width();
	var slideHeight = $('.slider ul li').height();
	var sliderUlWidth = slideCount * slideWidth;
	
	$('.slider').css({ width: slideWidth, height: slideHeight });
	
	$('.slider ul').css({ width: sliderUlWidth, marginLeft: - slideWidth });
	
    $('.slider ul li:last-child').prependTo('.slider ul');

    function moveLeft() {
        $('.slider ul').animate({
            left: + slideWidth
        }, 200, function () {
            $('.slider ul li:last-child').prependTo('.slider ul');
            $('.slider ul').css('left', '');
        });
    };

    function moveRight() {
        $('.slider ul').animate({
            left: - slideWidth
        }, 200, function () {
            $('.slider ul li:first-child').appendTo('.slider ul');
            $('.slider ul').css('left', '');
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
<!-- 슬라이더 버튼 마우스 오버로 가리기 -->
<script type="text/javascript">
	$(function(){
		$(".headimg").mouseenter(function(){
			$('a.control_prev').show();
			$('a.control_next').show();
			});

		$(".headimg").mouseleave(function(){
				$('a.control_prev').hide();
			$('a.control_next').hide();

		});
	});

</script>


<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.6.1/css/all.css">

<body>
	<div class="wrap">
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


		<section class="selcton">

			<!-- 고수 이미지 슬라이더 -->
			<div class="headimg" id="maingosu">
				<article class="slider">
					<div class="headslider">
						<a href="#" class="control_next">>></a> <a href="#"
							class="control_prev"><</a>
						<ul class="sliders">
							<li style="width: 1900px; height: 500px;"><img
								src="img/gosu/mainimg.jpg" style="width: 1900px; height: 500px" /></li>
							<li style="width: 1900px; height: 500px;"><img
								src="img/gosu/mainimg2.jpg" style="width: 1900px; height: 500px" /></li>
							<li style="width: 1900px; height: 500px;"><img
								src="img/gosu/mainimg3.jpg" style="width: 1900px; height: 500px" /></li>
						</ul>

					</div>


				</article>
			</div>

		

			<!-- 지금 인기있는 고수 -->
			<article>
				<div class="bestgosu">
					<div class="besttext">
						<div class="bestmore"><a href="#gosu_list ">더 많은 고수 찾기 ></a></div>
						<h2>지금 인기있는 고수</h2>
					</div>
					<!-- 회원사진, 각종 정보 들어가는 곳 (n개)-->
					<div class="bo">
						<div class="boxtitle">
							<div class="bestimg1" id="imgbox1"></div>
							<!-- 추후 DB작업 시 class에서 이미지 변경 필요함  -->
							<div class="box1">
								<li>회원닉네임</li>
								<li>★4.0</li>
								<br>
								<li>경력 n년</li>*
								<li>평균 n분 이내 응답</li>
							</div>
						</div>
						<div class="boxtitle">
							<div class="bestimg2" id="imgbox1"></div>

							<div class="box1">
								<li>회원닉네임</li>
								<li>★4.0</li>
								<br>
								<li>경력 n년</li>*
								<li>평균 n분 이내 응답</li>
							</div>
						</div>
						<div class="boxtitle">
							<div class="bestimg3" id="imgbox1"></div>
							<div class="box1">
								<li>회원닉네임</li>
								<li>★4.0</li>
								<br>
								<li>경력 n년</li>*
								<li>평균 n분 이내 응답</li>
							</div>
						</div>
					</div>

					<!-- 추천 서비스 -->
					<article>
						<div class="gosuserv">
							<div class="besttext">
								<div class="bestmore"><a href="bachi_market.jsp">상품 더 보기 ></a></div>
								<h2><%
								if(id==null){
									out.println("고객");
								}else{
									out.println(id);
								}
								
								
								%>님을 위한 추천 서비스</h2>
							</div>
							<div class="bo">
								<div class="boxtitle">
									<div class="servimg1" id="imgbox1"></div>
									<div class="box1">
										<li><strong>고수의 컨텐츠1</strong></li>
										<br>
										<li>회원닉네임</li>|
										<li>고수의 카테고리</li>
									</div>
								</div>
								<div class="boxtitle">
									<div class="servimg2" id="imgbox1"></div>

									<div class="box1">
										<li><strong>고수의 컨텐츠2</strong></li>
										<br>
										<li>회원닉네임</li>|
										<li>고수의 카테고리</li>
									</div>
								</div>
								<div class="boxtitle">
									<div class="servimg3" id="imgbox1"></div>
									<div class="box1">
										<li><strong>고수의 컨텐츠3</strong></li>
										<br>
										<li>회원닉네임</li>|
										<li>고수의 카테고리</li>
									</div>
								</div>
							</div>

							
							<!-- 고수 게시글(후기) -->
							<article>
								<div class="gosustory"></div>
								<div class="gosust">
									<h2>고수's Story</h2>
								</div>
								<div class="bo">
									<div class="boxtitle">
										<div class="josurevimg1" id="imgbox1"></div>
										<div class="box2">
											<li><strong>고수의 후기글1</strong></li>
										</div>
									</div>
									<div class="boxtitle">
										<div class="josurevimg2" id="imgbox1"></div>

										<div class="box2">
											<li><strong>고수의 후기글2</strong></li>

										</div>
									</div>
									<div class="boxtitle">
										<div class="josurevimg3" id="imgbox1"></div>
										<div class="box2">
											<li><strong>고수의 후기글3</strong></li>
										</div>
									</div>
							</article>
							<!-- 고수가입 영역 -->
							<article>
								<div class="gosuq">
									<div class="maingosuimg"></div>
									<div class="gosutex">
										<h3>전문가이신가요?</h3>
										고수로 활동해 고객을 만나보세요.
										<input type="button" class="gosujoinbtn" value="고수가입" onclick="location.href='bachi_insert.bc'">
									</div>
								</div>

							</article>



						</div>
					</article>

					<!-- 상단으로 이동하기 버튼 -->
					<a href="#" class="btn_gotop"> <span
						class="glyphicon glyphicon-chevron-up">^ </span>
					</a>
		</section>

		<div style="margin-left: auto; margin-right: auto;">
			<jsp:include page="footer.jsp" />
		</div>
	</div>




</body>
</html>