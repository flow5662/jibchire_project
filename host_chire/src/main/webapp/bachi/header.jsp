<%@ page language="java" contentType="text/html;charset=utf-8"
	pageEncoding="utf-8"%>
<%request.setCharacterEncoding("utf-8");%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>헤더</title>
</head>
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.6.1/css/all.css">
<style>
@import
	url('https://cdn.rawgit.com/moonspam/NanumSquare/master/nanumsquare.css')
	;
* { margin : 0 ; padding : 0 ; } 
html {
	font-family: 'NanumSquare';
}

a {
	text-decoration-line: none;
	color: black;
}

.head {
	width: 1900px;
	margin-left: auto;
	margin-right: auto;
}

.header .logo {
	margin-top: 20px;
	margin-left: 350px;
	width: 150px;
	height: 50px;
	background-image: url("img/logo/chiere.jpg");
	background-repeat: no-repeat;
	float: left;
}

.header {
	width: 1280px;
	height: 85px;
	margin: 0 auto;
}

li {
	display: inline;
}

.header .cumu {
	float: left;
	margin-top: 30px;
	margin-left: 20px;
	width: 100px;
	height: 50px;
	font-size: 15pt;
	font-weight: bold;
}

.header .store {
	float: left;
	margin-top: 30px;
	margin-left: 20px;
	width: 100px;
	height: 50px;
	font-size: 15pt;
	font-weight: bold;
}

.header .gosu {
	float: left;
	margin-top: 30px;
	margin-left: 20px;
	width: 100px;
	height: 50px;
	font-size: 15pt;
	font-weight: bold;
}

.header .serch {
	float: right;
	margin-top: 20px;
	margin-left: 20px;
	width: 310px;
	height: 50px;
}

.search-txt {
	display: flex;
	padding: 0;
	width: 240px;
	border: none;
	background: none;
	outline: none;
	float: left;
	font-size: 11pt;
	line-height: 30px;
	transition: .4s;
	padding-left: 10px;
}

.header .serchbtn {
	float: left;
	margin-top: 20px;
	margin-left: 20px;
	width: 70px;
	height: 30px;
}

.topheader .cart {
	float: left;
	margin-top: 20px;
	margin-left: 20px;
	width: 70px;
	height: 30px;
}

.topheader .login {
	float: left;
	margin-top: 33px;
	margin-left: 20px;
	width: 70px;
	height: 30px;
}

.topheader .join {
	float: left;
	margin-top: 33px;
	margin-left: 20px;
	width: 70px;
	height: 30px;
}

.topheader .gosuch {
	float: left;
	margin-top: 23px;
	margin-left: 20px;
	text-align: center;
	line-height: 40px;
	width: 94px;
	height: 40px;
	color: white;
	background-color: #789849;
	border-radius: 8px;
	border: none;
	cursor: pointer;
}

.search-box {
	padding: 5px;
	/*position: absolute;*/
	/*top: 10%;
		left: 61%;*/
	box-shadow: 0px 0px .5px 1px #926b61;
	height: 30px;
	background-color: #fff;
	border: 1px solid #926b61;
	border-radius: 30px;
	transition: 0.4s;
	width: 282px;
}

.search-btn {
	text-decoration: none;
	float: right;
	width: 30px;
	height: 30px;
	background-color: #fff;
	border-radius: 50%;
	display: flex;
	justify-content: center;
	align-items: center;
	color: #926b61;
}

.gosuch:hover {
	background-color: #8B4513;
}

.nav {
	margin-top: 20px;
	width: 1280px;
	height: 40px;
	background-color: white;
	text-align: center;
	line-height: 20px;
	margin-top: 20px;
	margin-left: auto;
	margin-right: auto;
}

.nav .index1 {
	float: left;
	width: 100px;
	height: 40px;
}

.nav .index2 {
	float: left;
	margin-left: 20px;
	width: 100px;
	height: 40px;
}

.nav .index3 {
	float: left;
	margin-left: 20px;
	width: 100px;
	height: 40px;
}

.nav .index4 {
	float: left;
	margin-left: 20px;
	width: 100px;
	height: 40px;
}

.nav .index5 {
	float: left;
	margin-left: 20px;
	width: 100px;
	height: 40px;
}

.header a:hover {
	color: #926b61;
}

.nav #gosu .index1 a {
	color: #926b61;
}

.nav .index1 a:hover {
	color: #926b61;
}

.nav .index2 a:hover {
	color: #926b61;
}

.nav .index3 a:hover {
	color: #926b61;
}

.nav .index4 a:hover {
	color: #926b61;
}

.nav .index5 a:hover {
	color: #926b61;
}

.topheader {
	width: 1280px;
	height: 70px;
	float: left;
	margin: 0 auto;
}

.top {
	float: right;
	margin-right: 20px;
}

.items {
	width: 400px;
	height: 320px;
	margin-top: 75px;
	margin-right: -390px;
}

.items2 {
	position: relative;
	background-color: white;
	border: 1px solid rgb(218, 221, 224);
	border-radius: 6px;
	box-shadow: rgba(63, 71, 77, 0.2) 0px 2px 5px 0px;
	float: right;
	padding: 8px;
	z-index: 999;
}

.item_index {
	display: flex;
	-webkit-box-align: center;
	align-items: center;
	padding: 15px;
	background-color: rgb(255, 255, 255);
	border-radius: 2px;
	transition: background-color 0.1s ease 0s;
	word-break: keep-all;
	white-space: nowrap;
	font-size: 15px;
	line-height: 0;
	outline: none;
}

.item_text {
	font-size: 15px;
	font-weight: bold;
	line-height: 21px;
	color: rgb(47, 52, 56);
}

.items_text_area {
	margin-left: 12px
}

.item_text_ex {
	margin: 4px 0px 0px;
	font-size: 12px;
	line-height: 16px;
	color: rgb(130, 140, 148);
}

.item_index:hover {
	background-color: lightgray;
}

.items, .items, .items2 {
	display: none;
	/* default로 안보이게 함 */
}
/*이미지*/
.item_index	.pictogram_een {
	fill: #F4D6B0;
}

.item_index	.pictogram_twee {
	fill: #F8AD89;
}

.item_index	.pictogram_vier {
	fill: #E54D2E;
}

.item_index	.pictogram_vijf {
	fill: #01A59C;
}

.item_index	.pictogram_zes {
	fill: #0C6667;
}

.item_index	.st0 {
	fill: #F27261;
}

.item_index	.st1 {
	fill: none;
}

.item_index	.st2 {
	fill: #F8AD89;
}

.item_index	.st3 {
	clip-path: url(#SVGID_2_);
	fill: #01A59C;
}

.item_index	.st4 {
	clip-path: url(#SVGID_2_);
	fill: none;
}

.item_index	.st5 {
	clip-path: url(#SVGID_2_);
	fill: #0C6667;
}

.item_index	.st6 {
	fill: #0C6667;
}

.cart .st0 {
	fill: #000000;
}

.tophead {
	width: 100%;
	border-bottom: 1px solid lightgray;
	height: 70px;
	background-color: #d0c0b0;
}

.line {
	width: 100%;
	border-bottom: 1px solid lightgray;
}
</style>
<body>
	<!-- 헤더 -->
	<header>
		<div class="tophead">
			<div style="width: 1280px; margin: 0 auto;">
				<div class="topheader">
					<div class="top">
<!-- 						<div class="cart"> -->
<!-- 							<a href="#cart"> <svg height="35px" width="35px" -->
<!-- 									version="1.1" id="_x32_" xmlns="http://www.w3.org/2000/svg" -->
<!-- 									xmlns:xlink="http://www.w3.org/1999/xlink" -->
<!-- 									viewBox="0 0 512 512" xml:space="preserve"> -->
<!-- 									<g> -->
<!-- 										<path class="st0" -->
<!-- 										d="M494.365,133.438c-11.528-15.738-29.35-25.678-48.804-27.219L126.245,80.918l-3.129-17.749 -->
<!-- 										c-5.252-29.676-28.858-52.657-58.671-57.066L24.597,0.187C15.093-1.209,6.253,5.359,4.84,14.846 -->
<!-- 										c-1.409,9.512,5.158,18.356,14.658,19.761v-0.008l39.861,5.907c14.97,2.218,26.868,13.785,29.501,28.71l54.009,306.134 -->
<!-- 										c5.073,28.735,30.027,49.669,59.206,49.678h221.971c9.606,0,17.394-7.792,17.394-17.39c0-9.607-7.788-17.398-17.394-17.398H202.075 -->
<!-- 										c-12.282,0.009-22.813-8.836-24.946-20.934l-5-28.349h244.879c31.234,0,58.346-21.55,65.367-52.005l23.258-100.767 -->
<!-- 										c1.151-5,1.717-10.06,1.717-15.086C507.35,158.962,502.88,145.04,494.365,133.438z M319.692,125.33l72.469,5.745v180.898h-72.469 -->
<!-- 										V125.33z M296.502,311.973h-72.47V117.752l72.47,5.746V311.973z M131.451,110.415l69.395,5.496v196.062h-33.833L131.451,110.415z -->
<!-- 										 M477.378,181.668l-23.245,100.776c-3.986,17.278-19.385,29.53-37.125,29.53h-1.657V132.916l27.926,2.208 -->
<!-- 										c11.049,0.866,21.174,6.516,27.706,15.447c4.838,6.592,7.381,14.495,7.381,22.526C478.363,175.949,478.038,178.809,477.378,181.668 -->
<!-- 										z" /> -->
<!-- 										<path class="st0" -->
<!-- 										d="M215.346,450.165c-17.076,0-30.909,13.853-30.909,30.926c0,17.073,13.832,30.909,30.909,30.909 -->
<!-- 											c17.078,0,30.927-13.836,30.927-30.909C246.273,464.018,232.423,450.165,215.346,450.165z" /> -->
<!-- 										<path class="st0" -->
<!-- 										d="M381.539,450.165c-17.073,0-30.913,13.853-30.913,30.926c0,17.073,13.84,30.909,30.913,30.909 -->
<!-- 											c17.072,0,30.922-13.836,30.922-30.909C412.461,464.018,398.612,450.165,381.539,450.165z" /> -->
<!-- 									</g> -->
<!-- 								</svg> -->
<!-- 							</a> -->
<!-- 						</div> -->
						<div class="login">
							<li><a href="login.jsp">로그인</a></li>
						</div>
						<div class="join">
							<li><a href="join.jsp">회원가입</a></li>
						</div>
<!-- 						<input type="button" class="gosuch" id="write" value="글쓰기"> -->
					</div>
					<div class="items items2">
						<a class="item_index" href="#커뮤니티">
							<div style="width: 50px; height: 50px;">
								<!-- 이미지영역 -->
								<svg version="1.1" id="Uploaded to svgrepo.com"
									xmlns="http://www.w3.org/2000/svg"
									xmlns:xlink="http://www.w3.org/1999/xlink" width="50px"
									height="50px" viewBox="0 0 32 32" xml:space="preserve">
								<g>
									<circle class="pictogram_vier" cx="16" cy="16" r="16" />
									<path class="pictogram_een"
										d="M1.174,22C3.549,27.861,9.287,32,16,32s12.451-4.139,14.826-10H1.174z" />
									<path class="pictogram_vijf"
										d="M16,22H1.174c1.146,2.828,3.077,5.246,5.523,7H16V22z" />
									<polygon class="pictogram_twee"
										points="29.57,18.023 29.557,18.01 29.534,18.033 	" />
									<polygon class="pictogram_twee"
										points="17.036,14.665 22.333,19.962 29.533,18.033 18.965,7.465 	" />
								<g>
								<path class="pictogram_zes"
										d="M22.333,19.962l-5.298-5.298l-1.939,7.237L22.333,19.962z M18.179,21.076
									C18.079,21.102,18.019,21.118,18.179,21.076L18.179,21.076z M18.291,21.046c-0.013,0.003-0.026,0.007-0.039,0.01
									C18.265,21.052,18.276,21.049,18.291,21.046z M31.979,15.587l-2.423,2.423l-0.023,0.023l0,0l0,0L18.965,7.465l-0.028-0.028
									l5.197-5.197C28.725,4.959,31.834,9.899,31.979,15.587z" />
								<path class="st6"
										d="M18.402,21.016c0.007-0.002,0.011-0.003,0.011-0.003c-0.001,0-0.002,0.001-0.003,0.001
									C18.409,21.014,18.405,21.015,18.402,21.016z" />
								</g>
								</g>
							</svg>
								<!-- 이미지영역 -->
							</div>
							<div class="items_text_area">
								<div class="item_text">커뮤니티 글쓰기</div>
								<div class="item_text_ex">글을 작성해 많은 사람들이 인테리어를 볼 수 있게
									해보세요.</div>
							</div>
						</a> <a class="item_index" href="store/used/board_index.jsp">
							<div style="width: 50px; height: 50px;">
								<!-- 이미지영역 -->
								<svg version="1.1" id="Uploaded to svgrepo.com"
									xmlns="http://www.w3.org/2000/svg"
									xmlns:xlink="http://www.w3.org/1999/xlink" width="50px"
									height="50px" viewBox="0 0 32 32" xml:space="preserve">
								<g>
									<circle class="pictogram_vier" cx="16" cy="16" r="16" />
									<path class="pictogram_een"
										d="M1.174,22C3.549,27.861,9.287,32,16,32s12.451-4.139,14.826-10H1.174z" />
									<path class="pictogram_vijf"
										d="M16,22H1.174c1.146,2.828,3.077,5.246,5.523,7H16V22z" />
									<polygon class="pictogram_twee"
										points="29.57,18.023 29.557,18.01 29.534,18.033 	" />
									<polygon class="pictogram_twee"
										points="17.036,14.665 22.333,19.962 29.533,18.033 18.965,7.465 	" />
									<g>
										<path class="pictogram_zes"
										d="M22.333,19.962l-5.298-5.298l-1.939,7.237L22.333,19.962z M18.179,21.076
											C18.079,21.102,18.019,21.118,18.179,21.076L18.179,21.076z M18.291,21.046c-0.013,0.003-0.026,0.007-0.039,0.01
											C18.265,21.052,18.276,21.049,18.291,21.046z M31.979,15.587l-2.423,2.423l-0.023,0.023l0,0l0,0L18.965,7.465l-0.028-0.028
											l5.197-5.197C28.725,4.959,31.834,9.899,31.979,15.587z" />
										<path class="st6"
										d="M18.402,21.016c0.007-0.002,0.011-0.003,0.011-0.003c-0.001,0-0.002,0.001-0.003,0.001
											C18.409,21.014,18.405,21.015,18.402,21.016z" />
								</g>
								</g>
							</svg>
								<!-- 이미지영역 -->
							</div>
							<div class="items_text_area">
								<div class="item_text">중고거래 판매글</div>
								<div class="item_text_ex">중고거래 글을 작성해 중고상품을 판매해보세요.</div>
							</div>
						</a> <a class="item_index" href="#고수 후기글">
							<div style="width: 50px; height: 50px;">
								<!-- 이미지영역 -->
								<svg version="1.1" id="Uploaded to svgrepo.com"
									xmlns="http://www.w3.org/2000/svg"
									xmlns:xlink="http://www.w3.org/1999/xlink" width="50px"
									height="50px" viewBox="0 0 32 32" xml:space="preserve">
									<g>
										<circle class="pictogram_vier" cx="16" cy="16" r="16" />
										<path class="pictogram_een"
										d="M1.174,22C3.549,27.861,9.287,32,16,32s12.451-4.139,14.826-10H1.174z" />
										<path class="pictogram_vijf"
										d="M16,22H1.174c1.146,2.828,3.077,5.246,5.523,7H16V22z" />
										<polygon class="pictogram_twee"
										points="29.57,18.023 29.557,18.01 29.534,18.033 	" />
										<polygon class="pictogram_twee"
										points="17.036,14.665 22.333,19.962 29.533,18.033 18.965,7.465 	" />
										<g>
											<path class="pictogram_zes"
										d="M22.333,19.962l-5.298-5.298l-1.939,7.237L22.333,19.962z M18.179,21.076
												C18.079,21.102,18.019,21.118,18.179,21.076L18.179,21.076z M18.291,21.046c-0.013,0.003-0.026,0.007-0.039,0.01
												C18.265,21.052,18.276,21.049,18.291,21.046z M31.979,15.587l-2.423,2.423l-0.023,0.023l0,0l0,0L18.965,7.465l-0.028-0.028
												l5.197-5.197C28.725,4.959,31.834,9.899,31.979,15.587z" />
											<path class="st6"
										d="M18.402,21.016c0.007-0.002,0.011-0.003,0.011-0.003c-0.001,0-0.002,0.001-0.003,0.001
												C18.409,21.014,18.405,21.015,18.402,21.016z" />
									</g>
									</g>
								</svg>
								<!-- 이미지영역 -->
							</div>
							<div class="items_text_area">
								<div class="item_text">고수 후기글</div>
								<div class="item_text_ex">고수의 의뢰를 마친 당신,후기 글을 작성하세요.</div>
							</div>
						</a> <a class="item_index" href="#sns글쓰기">
							<div style="width: 50px; height: 50px;">
								<!-- 이미지영역 -->
								<svg version="1.1" id="Uploaded to svgrepo.com"
									xmlns="http://www.w3.org/2000/svg"
									xmlns:xlink="http://www.w3.org/1999/xlink" width="50px"
									height="50px" viewBox="0 0 32 32" xml:space="preserve">
									<g>
										<circle class="pictogram_vier" cx="16" cy="16" r="16" />
										<path class="pictogram_een"
										d="M1.174,22C3.549,27.861,9.287,32,16,32s12.451-4.139,14.826-10H1.174z" />
										<path class="pictogram_vijf"
										d="M16,22H1.174c1.146,2.828,3.077,5.246,5.523,7H16V22z" />
										<polygon class="pictogram_twee"
										points="29.57,18.023 29.557,18.01 29.534,18.033 	" />
										<polygon class="pictogram_twee"
										points="17.036,14.665 22.333,19.962 29.533,18.033 18.965,7.465 	" />
										<g>
											<path class="pictogram_zes"
										d="M22.333,19.962l-5.298-5.298l-1.939,7.237L22.333,19.962z M18.179,21.076
												C18.079,21.102,18.019,21.118,18.179,21.076L18.179,21.076z M18.291,21.046c-0.013,0.003-0.026,0.007-0.039,0.01
												C18.265,21.052,18.276,21.049,18.291,21.046z M31.979,15.587l-2.423,2.423l-0.023,0.023l0,0l0,0L18.965,7.465l-0.028-0.028
												l5.197-5.197C28.725,4.959,31.834,9.899,31.979,15.587z" />
											<path class="st6"
										d="M18.402,21.016c0.007-0.002,0.011-0.003,0.011-0.003c-0.001,0-0.002,0.001-0.003,0.001
												C18.409,21.014,18.405,21.015,18.402,21.016z" />
										</g>
									</g>
								</svg>
								<!-- 이미지 끝 -->
							</div>
							<div class="items_text_area">
								<div class="item_text">SNS글쓰기</div>
								<div class="item_text_ex">글쓰기</div>
							</div>
						</a>
					</div>
				</div>
			</div>
		</div>

		<div class="header">
			<div class="cumu">
				<li><a href="../community/community.jsp"> 커뮤니티 </a></li>
			</div>
<!-- 			<div class="store"> -->
<!-- 				<li><a href="shopping.jsp"> 스토어 </a></li> -->
<!-- 			</div> -->
			<div class="gosu">
				<li><a href="bachi_main.jsp"> 바치 </a></li>
			</div>
			<li><a href="snsIndexList.sns"><div class="logo"></div></a></li>

			<div class="serch">
				<div class="search-box">
					<li><input type="text" class="search-txt" placeholder="검색">
						<a class="search-btn" href="#"> <i class="fas fa-search"></i>
					</a></li>
				</div>
			</div>
			<!-- <div class="serchbtn"><li>검색</li></div> -->

		</div>
	</header>
	<div class="line"></div>
	<!-- nav -->
	<div class="nav">
		<nav>
			<div id="cumu">
				<div class="index1">
					<li><a href="../community/select_board.jsp">집들이</a></li>
				</div>
				<div class="index2">
					<li><a href="../sns/snsListAction.sns">일상공유</a></li>
				</div>
				<div class="index2">
					<li><a href="login.jsp">나와 비슷한</a></li>
				</div>
			</div>

<!-- 			<div id="shop"> -->
<!-- 				<div class="index1"> -->
<!-- 					<li><a href="../store/used_board/board_index.jsp">중고거래</a></li> -->
<!-- 				</div> -->
<!-- 				<div class="index2"> -->
<!-- 					<li><a href="#">브랜드관</a></li> -->
<!-- 				</div> -->
<!-- 				<div class="index3"> -->
<!-- 					<li><a href="#">신상품</a></li> -->
<!-- 				</div> -->
<!-- 				<div class="index4"> -->
<!-- 					<li><a href="#">베스트</a></li> -->
<!-- 				</div> -->
<!-- 				<div class="index5"> -->
<!-- 					<li><a href="#">이벤트</a></li> -->
<!-- 				</div> -->
<!-- 			</div> -->
			<div id="gosu">
				<div class="index1">
					<li><a href="../bachi/bachi_match-home.bc">고수매칭</a></li>
				</div>
				<div class="index2">
					<li><a href="../bachi/bachi_market_cust_ver.jsp"> 마켓 </a></li>
				</div>
				
			</div>
		</nav>
	</div>
	<div class="line"></div>
</body>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script>
	$(function(){
		$("#cumu").hide();
		$("#shop").hide();
		$("#gosu").hide();
		$(".nav").hide();
		
		$(".cumu").mouseenter(function(){
			$(".nav").slideDown();
			$("#cumu").show();
			$("#shop").hide();
			$("#gosu").hide();
		});
		$(".store").mouseenter(function(){
			$(".nav").slideDown();
			$("#shop").show();
			$("#cumu").hide();
			$("#gosu").hide();
		})
		$(".gosu").mouseenter(function(){
			$(".nav").slideDown();
			$("#gosu").show();
			$("#cumu").hide();
			$("#shop").hide();
		});

		$(".cumu , .store, .gosu").mouseout(function(){
			$(".nav").mouseenter(function(){
				$(".nav").show();
			});
			$("header ~ .line").mouseout(function(){
				$(".nav, .header").mouseenter(function(){
					$(".nav").show();
				});	
				$(".nav").slideUp();
			});
		});
		
		$("#write").on("click", function() {
			$(".items, .items, .items2").toggle();
		});
	});
</script>
</html>