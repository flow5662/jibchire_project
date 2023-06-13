<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>집치레</title>
</head>
<style>
@import url('https://cdn.rawgit.com/moonspam/NanumSquare/master/nanumsquare.css');
/* reset css */ 
* { margin : 0 ; padding : 0 ; font-family: 'NanumSquare'; } 
/* 가로폭 좁혀졌을 때 화면이 항상 중앙에 보일 수 있도록*/
.wrap{	margin: 0 auto;}

/*section01*/
@import url('https://fonts.googleapis.com/css2?family=DM+Serif+Text&display=swap');
#section01{width:100%; height: 500px; background-color: #f4ede7;} 
.skewdBox {  position: absolute;      left: -60px;   width: 45%;  height: 500px;  background-color:#d1c9be;
	transform: skewX(30deg) translateX(-85px);  overflow: hidden;}
.skewdBox #background{background-image: url(img/index/entrance01.jpg); height: inherit;    transform: skewX(-30deg);    opacity: 0.2;
    position: relative;    left: 5%;}
.skewdBox2 {  width: 100%;  height: 100%;   background-color: #f4ede7;}
.skewdBox2 #halfround{width:280px;height:400px;    background-image: url(img/index/door02.jpg); box-shadow: 10px 10px 10px #8d6046; border-top-left-radius:50%; border-top-right-radius:50%;
    position: relative;    left: 15%;    top: 50px; animation:section01slide 2s ease-in;}
.skewdBox2 #explain01{ width: 50%; height: 100%; position: relative;     left: 49%;      bottom: 300px;  animation:explain01 2s ease-in;}
@keyframes section01slide{	0%{left:-15%;}100%{left:15%;}}
@keyframes explain01{	0%{left:88%;}100%{left:49%;}}

/*section01 텍스트*/
section[id^=sec] h1{font-family: 'DM Serif Text', serif; font-size: 43px; color:#8b6450; }
.skewdBox2 ul{margin-top: 20px;}
.skewdBox2 ul li {width: inherit;  background-color: wheat;} 
.skewdBox2 ul li h5{font-size: 12pt; color: #8d6046;    font-style: italic;    font-weight: 900;}
.skewdBox2 ul li h6{font-size: 10pt;  margin: 10px 0 10px 20px;}

/*section02*/
#section02{width: 100%; height: 500px;}
#portionleft{width: 100%; height: inherit; float: left;     position: absolute;    left: 0;}
#portionleft #leftexplain{    width: 900px;  height: inherit;   
/* position: absolute;   top: 100px;   right: 10%; */
    margin: 0 auto;
}
#portionleft #explain02{position: absolute;   top: 90px; animation:explain02 2s ease-in;}
#portionleft ul{margin-top: 20px;}
#portionleft ul li{width: inherit;}
#portionleft ul li h5{font-size: 12pt; color: #8d6046;    font-style: italic;    font-weight: 900;}
#portionleft ul li h6{font-size: 10pt; margin: 10px 0 10px 20px;}
#portionright{width: 35%;    height: 500px;  background-color: #dcdedd;   position: absolute;    right: 0;}
#portionright #leftpicture{width:280px; height:400px; background-image: url(img/index/bachi.jpg); box-shadow: 10px 10px 10px #6c746f; 
	position: absolute;    top: 50px;    left: -140px; animation:leftpicture 2s ease-in;}
#portionright #background2{background-image: url(img/index/entrance02.jpg); height: inherit;  opacity: 0.2;}
@keyframes leftpicture{	0%{left:0;}100%{left:-140px;}}
@keyframes explain02{	0%{left:-60px;}100%{left:0;}}

/*section03*/
#section03{width: 100%; height: 500px; background-color: #d0c0b0; position: absolute;}
#section03 #explain03{width: 500px; margin: 60px auto 0 auto;}


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
		//response.sendRedirect("snsIndexList.sns"); //index에서 보여줄 sns 데이터 가져오기
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
	<!-- section01 -->
	<section id="section01">
		<section class="skewdBox">
			<div id="background"><!-- 바탕사진 들어감 --></div>
		</section>
			<section class="skewdBox2">
				<div style="width: 1280px; margin: 0 auto;">
					<div id="halfround"></div>
					<div id="explain01">
						<h1> Show Your Rooms <br> on Community </h1>
						<ul>
							<li><h5> 집들이</h5> </li>
							<li><h6> 집의 사진 및 인테리어에 이용한 상품 정보를 공유하는 공간 </h6>  </li>
							<li><h5> 일상공유 </h5> </li>
							<li><h6> 일상에 대한 정보를 공유하고 다른 사용자와 소통하는 공간 </h6>  </li>
							<li><h5> 나와 비슷한 </h5> </li>
							<li><h6> 우리집에 대한 정보를 입력하면 관련된 정보를 추천해주는 공간</h6>  </li>
						</ul>
					</div>
				</div>
			</section>
		</section>
	<!-- section02 -->
	<section id="section02">
		<div id="portionleft">
			<div id="leftexplain">
				<div id="explain02">
					<h1>Connect with Experts <br>on Bachi</h1>
					<ul>
						<li><h5> 바치란?</h5> </li>
						<li><h6> 어떤 한 분야의 장인을 뜻하는 말 입니다. <br> 집치레 에서는 이용자가 직접 서비스를 판매할 수 있는 시스템을 갖추고 있습니다. <br>
								로그인 후 바치전환을 시도해 보세요.  </h6>  </li>
						<li><h5> 바치를 이용하는 방법 </h5> </li>
						<li><h6> 바치 마켓을 이용해보세요. <br> 여러가지 분야에 대한 서비스를 구매할 수 있습니다. <br> 
								내가 관심있는 분야에 대해 직접 견적요청을 넣을 수도 있습니다.<br>  </h6>  </li>
					</ul>
				</div>
			</div>
		</div>
		<div id="portionright">
			<div id="background2"><!-- 바탕사진 들어감 --></div>						
			<div id="leftpicture"></div>			
		</div>
	</section>
	<!-- section03 -->
	<section id="section03">
		<div style="width:1280px; margin : 0 auto;">
			<div id="explain03"> <h1>How to Use Service?</h1> </div>
		</div>
	</section>
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
		$(".fixed-banner").css({'transition':"all 2s ease-out"});
		});
	$(".in").on("click",function(){
		$(".fixed-banner").css({'left':"0"});
		$(".fixed-banner").css({'transition':"all 2s ease-in"});
		});
});
</script>
</body>
</html>