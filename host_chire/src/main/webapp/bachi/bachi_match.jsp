<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<% String category = "home"; %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>고수매칭</title>
</head>
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.6.1/css/all.css">
<link rel="stylesheet" type="text/css" href="style/bachi_match.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
		<style>
		.overlay {
			position: fixed;
			top: 0;
			left: 0;
			width: 100%;
			height: 100%;
			background-color: rgba(0, 0, 0, 0.5);
			z-index: 1;
			display: none;
		}
		.popup {
			position: fixed;
			top: 30%;
			left: 50%;
			transform: translate(-50%, -50%);
			background-color: #fff;
			padding: 20px;
			z-index: 2;
			display: none;
			/* 최소 맞추기 */
			width: 600px;
		}
		.close {
			position: absolute;
			top: 5px;
			right: 5px;
			cursor: pointer;
			font-size: 30pt;
		}
		.pop{
	    display: grid;
    grid-template-columns: repeat(3, 1fr);
		}
		.serv{
		    display: inline-block;
    margin: 0.5rem;
    padding: 0.2rem 0.8rem;
    font-size: 1rem;
    border-radius: 0.4rem;
    background-color: #75ad78;
    text-align:center;
    cursor: pointer;
		}
		.serv a{
		color:white;
		}
		.service{
		display: flex;
		    gap: 20px;
    flex-direction: column;
		}
	</style>
<%
String cust_id = request.getParameter("cust_id");
String cust_pw = request.getParameter("cust_pw");
//session.setAttribute("cust_id",cust_id);
//session.setAttribute("cust_pw",cust_pw);
%>
<%
// 이미지 파일이 저장된 경로를 가져옵니다.
String imagePath = request.getServletContext().getRealPath("/image");

// 이미지 파일의 URL을 생성합니다.
String imageUrl = request.getContextPath() + "/image/";

%>
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
<body>
	<div class="wrap">
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




		<section class="section">
		
		<!-- 고수 검색부분 -->
		  
			<article>
				
				<div class="servimg">
					<div class="servtext">
					<div class="text">
						<h2>
							어떤 서비스를 찾고 계신가요?<br> 바치들을 매칭해드립니다.
							</div>
							
							<div class="search_area">
								<input type="text" id="search_text" name="gosuserch"
									placeholder="어떤 고수를 찾으시나요?" style="width: 450px;border: solid 1px gray;"> <input type="button"
									name="gosuserch" value="서비스검색" id="openPopup">
									
							</div>
						</h2>
					</div>
				</div>
			</article>
			<!-- 레이어팝업 구간 -->
	<div class="overlay" id="overlay"></div>
	<div class="popup" id="popup">
		<span class="close" id="closePopup">&times;</span>
		<div class="service">
		<h2>다음 서비스를 찾고있나요?</h2>
		<div class="pop">
		<li class="serv" id="aircon">
		<a href="bachi_match.bc?category=aircon-sigong">에어컨 시공 및 설치</a>
		</li>
		<li class="serv" id="conserting">
		<a href="bachi_match.bc?category=job-conserting">취업 컨설팅</a>
		</li>
		<li class="serv" id="math-lesson">
		<a href="bachi_match.bc?category=math-lesson">수학레슨</a>
		</li>
		<li class="serv" id="dobe-sigong">
		<a href="bachi_match.bc?category=dobe-sigong">도배시공</a>
		</li>
			<li class="serv" id="music-lesson">
		<a href="bachi_match.bc?category=music-lesson">음악레슨</a>
		</li>
		<li class="serv" id="pt-training">
		<a href="bachi_match.bc?category=pt-training">PT트레이닝</a>
		</li>
		<li class="notfound">해당 값이 없습니다.</li>
		</div>
		</div>
	</div>
			
			
<!-- 카테고리별 선택 -->

			<article>
				<!-- 
				<div class="gosucate">
					<a href="#"><div class="cate1">
							<li>레슨</li>
						</div></a> <a href="#"><div class="cate2">
							<li>홈/리빙</li>
						</div>
						<a> <a href="#"><div class="cate3">
									<li>이벤트</li>
								</div></a> <a href="#"><div class="cate4">
								
									<li>비즈니스</li>
								</div></a> <a href="#"><div class="cate5">
									<li>디자인/개발</li>
								</div></a> <a href="#"><div class="cate6">
									<li>건강/미용</li>
								</div></a> <a href="#"><div class="cate7">
									<li>알바</li>
									
								</div></a> <a href="#"><div class="cate8">
									<li>기타</li>
								</div></a>
				</div>
-->
			</article>


			<article>
				<!-- 인기서비스 카테고리 영역 -->
				<div class="bestcate">
					<div class="gosust">
						<h2>대표 서비스</h2>
					</div>


					<div class="boxlist">

						<div class="boxtitle">
							<a href="bachi_match.bc?category=aircon-sigong"><div class="bestcateimg1"></div></a>
							<div class="box2">
								<li><strong><a
										href="bachi_match.bc?category=aircon-sigong">에어컨 시공 및 설치</a></strong></li>
							</div>

						</div>
						<div class="boxtitle">
							<a href="bachi_match.bc?category=job-conserting"><div class="bestcateimg2"></div></a>

							<div class="box2">
								<li><strong><a
										href="bachi_match.bc?category=job-conserting">취업 컨설팅</a></strong></li>

							</div>
						</div>
						<div class="boxtitle">
							<a href="bachi_match.bc?category=math-lesson"><div class="bestcateimg3"></div></a>
							<div class="box2">
								<li><strong><a href="bachi_match.bc?category=math-lesson">수학과외</a></strong></li>
							</div>
						</div>

						<div class="boxtitle">
						<a href="bachi_match.bc?category=dobe-sigong">
							<div class="bestcateimg4"></div></a>
							<div class="box2">
								<li><strong><a href="bachi_match.bc?category=dobe-sigong">도배시공</a></strong></li>
							</div>
						</div>

						<div class="boxtitle">
						<a href="bachi_match.bc?category=music-lesson">
							<div class="bestcateimg5"></div></a>
							<div class="box2">
								<li><strong><a href="bachi_match.bc?category=music-lesson">음악과외</a></strong></li>
							</div>
						</div>

						<div class="boxtitle">
						<a href="bachi_match.bc?category=pt-training">
							<div class="bestcateimg6"></div>
							</a>
							<div class="box2">
								<li><strong><a href="bachi_match.bc?category=pt-training">PT트레이닝</a></strong></li>
							</div>
						</div>


					</div>
			</article>
		</section>

		<!-- 상단으로 이동하기 버튼 -->
		<a href="#" class="btn_gotop"> <span
			class="glyphicon glyphicon-chevron-up">^ </span>
		</a>

		<div style="margin-left: auto; margin-right: auto;">
			<jsp:include page="footer.jsp" />
		</div>
	</div>

<script>
	var serv = ["에어컨","시공","설치","취업","컨설팅","수학과외","도배시공","음악과외","PT"]; //일단배열

	$(function(){
		$(".notfound").hide(); //목록없습니다
		$("#openPopup").on("click",function(){
			var search_text = document.getElementById('search_text').value;
			
			if(search_text ===""){
				$(".serv").hide();
				$(".notfound").show();
			}else if(search_text === "에어컨"){
				$("#conserting").hide;
				$("#math-lesson").hide;
				$("#dobe-sigong").hide;
				$("#pt-training").hide;
				$("#music-lesson").hide;
				$("#aircon").show();
			}
			else{
				$(".serv").show();
				$(".notfound").hide();
				
				
				}
				
				
		});
		
		$("#search_text").keyup(function(event) {
	        if (event.which === 13) {
	            $("#openPopup").click();
	        }
	    });
		
		
		
	});

	
		var openPopupButton = document.getElementById('openPopup');
		var closePopupButton = document.getElementById('closePopup');
		var overlay = document.getElementById('overlay');
		var popup = document.getElementById('popup');

		openPopupButton.addEventListener('click', function() {
			overlay.style.display = 'block';
			popup.style.display = 'block';
		});

		closePopupButton.addEventListener('click', function() {
			overlay.style.display = 'none';
			popup.style.display = 'none';
		});
		
		
	</script>

</body>
</html>