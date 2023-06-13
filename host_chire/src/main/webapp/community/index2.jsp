<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>집치레</title>
</head>
<style>
/* reset css */ 
* { margin : 0 ; padding : 0 ; } 
/* 가로폭 좁혀졌을 때 화면이 항상 중앙에 보일 수 있도록*/
.wrap{	margin: 0 auto;}

/*slider css*/                           					  /* 여기서부터 slider css*/
#slider {  position: relative;  overflow: hidden;  margin: 20px auto 0 auto;}
#slider ul {  position: relative;  margin: 0;  padding: 0;  list-style: none;}
#slider ul li {  position: relative;  display: block;  float: left;  margin: 0;padding: 0;  height: 480px;  text-align: center;  line-height: 300px;}
a.control_prev, a.control_next {  position: absolute;top: 40%;  z-index: 999;  display: block;  padding: 4% 3%;
  color: #fff;  font-size: 30px;  opacity: 0.8;  cursor: pointer;}
a.control_prev:hover, a.control_next:hover {  opacity: 1;  -webkit-transition: all 0.2s ease;}
a.control_prev {}
a.control_next {  right: 0;}
/*slider css*/                                            	 /*여기까지 slider css*/

#csBannerFixed{    height: 100%;    width: 190px;    background: #FFFFFF;    border-left: 1px solid #e1e1e1;
}
.css-title{
display: flex; 
width:100%;
padding-top: 20px;
}
.css-title>span{font-size: 24px; font-weight:bold;}
.css-section-all{
width:1280px;
height: auto;
margin: 0 auto;
}
.css-chire-img{ /*커뮤니티,고수,스토어 모두의 이미지*/
display: grid;grid-template-columns: repeat(3, 1fr);gap: 42px;
}
.img-pic{
    width: 620px;
    height: 400px;
}
.css-chire-imgline{
padding-top:20px;
}
.css-text{
display: grid;grid-template-columns: repeat(3, 1fr);gap: 42px;
padding-top:20px;
}
.css-text-area{
  width: 620px;
  height: 200px;
}

/*좌측 sns내용*/
.fixed-banner{
    height: 100%;
    width: 450px;
    background: #FFFFFF;
    border-right: 1px solid #e1e1e1;
}
.fixed-banner{
position: fixed;
    _position: absolute;
    top: 0px;
    left: 0px;
    z-index: 100000;
}
.sns-screen{
    position: relative;
}
.sns-img{
 width: 370px;
 height: 370px;
 padding: 20px;
 overflow: hidden;
}
.fixed-sns-img{
 width: 370px;
 height: 370px;
object-fit:cover;
}
.sns-text-title{
    position: relative;
    top: 20px;
    left: -80px;
    font-size: 20px;
}
.sns-user-area{
display: flex;
    flex-direction: column;
    justify-content: space-evenly;
    align-items: center;
    border-top: 1px solid #C0C0C0;
    padding-top: 20px;
}
.sns-id-hesh{
width:415px;
height: 100px;
}
.sns-user-img{
    width: 50px;
    height: 50px;
    margin: 0 20px;
}
.sns-user-img>img{border-radius: 50%; width:50px; height:50px;}
.sns-user{
    display: flex;
    flex-direction: column;
    justify-content: space-between;
    padding: 0 20px;
}
.sns-like{
    width: 30px;
    height: 30px;
    display: flex;
    padding-left:20px;
}
.hash-tag{
display: flex;
padding:10px 0 10px 20px;
}
.sns-text-area{
    padding:0 0 20px 20px;
    display: flex;
    width: 90%;
}
.fixed-banner-scroll{
overflow-y:auto;
overflow-x:hidden;
height: 100%;
}
.fixed-banner-scroll::-webkit-scrollbar {
  display: none;
}
.user{
display: flex;
align-items: center;
}
.out{
    display: flex;
    flex-direction: row;
    justify-content: flex-end;
    padding-right: 30px;
    font-size: 50pt;
    position: sticky;
    top: 0px;
    background-color: white;
    border-bottom: 1px solid #C0C0C0;
}
.in{
    position: fixed;
    _position: absolute;
    top: 20px;
    left: 20px;
    z-index: 100000;
    font-size: 50pt;
    background-color: #97939375;
    border-radius: 300px;
    width: 91px;
    height: 91px;
    text-align: center;
    align-items: center;
    line-height: 1.5;
}
</style>
<body>

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
<div class="wrap">
	<!-- 중앙 상단부 슬라이더-->
	<div id="slider">
	  <a href="#" class="control_next">>></a>
	  <a href="#" class="control_prev"><<</a>
	  <ul>
	    <li><img src="img/index/banner1.png" style="width: 1280px; height: 480px;"></li>
	    <li><img src="img/index/banner2.png" style="width: 1280px; height: 480px;"></li>
	    <li><img src="img/index/banner1.png" style="width: 1280px; height: 480px;"></li>
	    <li><img src="img/index/banner2.png" style="width: 1280px; height: 480px;"></li>
	  </ul>  
	</div>

	<!-- 중앙 하단부 커뮤니티, 스토어, 바치 사진&설명칸 -->
	<div class="css-section-all">
		<section>
			<article>
				<div class="css-title"><span>집치레에서 이용 할 수 있는 것</span></div>			
				<!-- 커뮤니티/스토어/고수의 이미지 및 설명 영역 -->
				<div class="css-chire-imgline">
					<div class="css-chire-img">
						<img src="img/index/community.gif" class="img-pic"/>
						<img src="img/index/bachi.gif" class="img-pic"/s>
					</div>
				</div>
			</article>
			<article>
			<div class="css-text">
				<div class="css-text-area">
					<h3> 커뮤니티</h3>
					<li>커뮤니티 안에서는 글을 작성할 수 있으며, 인테리어에 관한 정보를 볼 수 있습니다.<br>
					또한,각종 정보를 공유하고 sns기능과 같이 팔로우를 하고,좋아요 등 많은 기능을 사용할 수 있습니다.</li>
				</div>
				<div class="css-text-area">
					<h3> 바치 </h3>
					<li>바치에서는 바치를 등록하여 직접 서비스 판매자가 될 수 있습니다.<br>
					또한,고객으로 서비스를 구매할 수 있으며 ,견적요청을 통해 많은 정보를 얻을 수 있습니다. </li>
				</div>
			</div>
			</article>
		</section>
	</div>
</div>

<!-- 좌측 sns팝업공간 -->
<div class="in">></div>
<div class="fixed-banner">
	<div class="fixed-banner-scroll">
		<div class="sns-screen">
			<div class="out"> <span class="sns-text-title">집치레 sns</span> < </div>
			
			<!-- sns영역 -->
			<div class="sns-user-area">
				<div class="sns-user">
					<!-- 프로필 사진 & 아이디 -->
					<div class="user">
						<div class="sns-user-img"><img src="img/index/201.jpg" style=""> </div>
						<span> jeong_minney </span>
					</div>
					<!-- 게시글 사진 -->
					<div class="sns-img"><img src="img/index/111.jpg" class="fixed-sns-img"/></div>
					<!-- 좋아요 버튼 -->
					<div><img  class="sns-like" src="img/index/heart.png" ></div>
					<!-- 해시태그 및 내용 -->
					<div class="hash-tag">#드라이플라워 #초록색서랍</div>	
					<div class="sns-text-area">집에있는 오래된 서랍 새로운 색으로 변신! 바치에서 만난 고수님이 리폼해주셨다</div>
				</div>
			</div>
			<div class="sns-user-area">
				<div class="sns-user">
					<!-- 프로필 사진 & 아이디 -->
					<div class="user">
						<div class="sns-user-img"><img src="img/index/202.jpg" style=""> </div>
						<span> minzzzy </span>
					</div>
					<!-- 게시글 사진 -->
					<div class="sns-img"><img src="img/index/112.jpg" class="fixed-sns-img"/> </div>
					<!-- 좋아요 버튼 -->
					<div><img  class="sns-like" src="img/index/heart.png" ></div>
					<!-- 해시태그 및 내용 -->
					<div class="hash-tag">#초록색소파 #거실</div>	
					<div class="sns-text-area">소파에 어울리는 탁자와 사이드 조명을 배치했다. 집이 한층 더 포근해 진 것 같다</div>
				</div>
			</div>
			<div class="sns-user-area">
				<div class="sns-user">
					<!-- 프로필 사진 & 아이디 -->
					<div class="user">
						<div class="sns-user-img"><img src="img/index/203.png" style=""> </div>
						<span> greeen501 </span>
					</div>
					<!-- 게시글 사진 -->
					<div class="sns-img"><img src="img/index/113.jpg" class="fixed-sns-img"/> </div>
					<!-- 좋아요 버튼 -->
					<div><img  class="sns-like" src="img/index/heart.png" ></div>
					<!-- 해시태그 및 내용 -->
					<div class="hash-tag">#오후 #거실</div>	
					<div class="sns-text-area">집바치레서 새로운 테이블과 의자를 구매! 거실에 잘 어울리는 것 같아 기분이 좋다</div>
				</div>
			</div>
		</div>
	</div>
</div>
<footer>
	<jsp:include page="footer.jsp" />
</footer>
<script>
$(document).ready(function(){
	/* 좌측 팝업 열고 닫는 기능 */
	$(".out").on("click",function(){
		$(".fixed-banner").css({'left':"-100%"});
		$(".fixed-banner").css({'transition':"all 1s"});
		});
	$(".in").on("click",function(){
		$(".fixed-banner").css({'left':"0"});
		$(".fixed-banner").css({'transition':"all 1s"});
		});
	});
	
	/*slider 관련 기능*/
	$("subnav").hide();
	setInterval(function () {
	    moveRight();
	}, 3000);
	
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
</script>
</body>
</html>