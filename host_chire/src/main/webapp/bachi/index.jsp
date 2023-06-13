<%@page import="dto.Feed"%>
<%@page import="java.util.ArrayList"%>
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
.skewdBox #background{background-image: url(../community/img/index/entrance01.jpg); height: inherit;    transform: skewX(-30deg);    opacity: 0.2;
    position: relative;    left: 5%;}
.skewdBox2 {  width: 100%;  height: 100%;   background-color: #f4ede7;}
.skewdBox2 #halfround{width:280px;height:400px;    background-image: url(../community/img/index/door02.jpg); box-shadow: 10px 10px 10px #8d6046; border-top-left-radius:50%; border-top-right-radius:50%;
    position: relative;    left: 15%;    top: 50px; animation:section01slide 1s ease-in;}
.skewdBox2 #explain01{ width: 50%; height: 100%; position: relative;     left: 49%;      bottom: 300px;  animation:explain01 1s ease-in;}
@keyframes section01slide{	0%{left:-15%;}100%{left:15%;}}
@keyframes explain01{	0%{left:88%;}100%{left:49%;}}

/*section01 텍스트*/
section[id^=sec] h1{font-family: 'DM Serif Text', serif; font-size: 43px; color:#8b6450;     text-shadow: 3px 4px 3px #d1beb3; }
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
#portionleft #explain02{position: absolute;   top: 90px; animation:explain02 1s ease-in;}
#portionleft ul{margin-top: 20px;}
#portionleft ul li{width: inherit;}
#portionleft ul li h5{font-size: 12pt; color: #8d6046;    font-style: italic;    font-weight: 900;}
#portionleft ul li h6{font-size: 10pt; margin: 10px 0 10px 20px;}
#portionright{width: 35%;    height: 500px;  background-color: #dcdedd;   position: absolute;    right: 0;}
#portionright #leftpicture{width:280px; height:400px; background-image: url(../community/img/index/bachi.jpg); box-shadow: 10px 10px 10px #6c746f; 
	position: absolute;    top: 50px;    left: -140px; animation:leftpicture 1s ease-in;}
#portionright #background2{background-image: url(../community/img/index/entrance02.jpg); height: inherit;  opacity: 0.2;}
@keyframes leftpicture{	0%{left:0;}100%{left:-140px;}}
@keyframes explain02{	0%{left:-60px;}100%{left:0;}}

/*section03*/
#section03{width: 100%; height: 500px; background-color: #d0c0b0;}
#section03 #explain03{width: 500px; margin: 40px auto 0 auto;}
#section03 #middlepicture{width:855px; height: 500px; margin: 0 auto;}
#section03 #middlepicture ul{display: inline-block; margin:20px 20px 0 0; }
#section03 #middlepicture ul li{display: block; }
#section03 #middlepicture ul li.pic{width:260px;height:300px;border-top-left-radius:50%; border-top-right-radius:50%;  background: #FFFFFF;  box-shadow: 10px 10px 10px #8d6046;}
#section03 #middlepicture ul li#picjoin{background-image: url(../community/img/index/join.jpg);}
#section03 #middlepicture ul li#picrequest{background-image: url(../community/img/index/request.jpg);}
#section03 #middlepicture ul li#picmaching{background-image: url(../community/img/index/matching.jpg);}
#section03 #middlepicture ul li.text{width:260px; height: 50px; margin-top: 20px; }
#section03 ul li h5{font-size: 14pt; color: #8d6046;    font-style: italic;    font-weight: 900; text-align: center;}
#section03 ul li h6{font-size: 10pt; margin: 10px 0 10px 20px; text-align: center;}

/*전체구조*/
.sns-screen ul{width : 1280px; margin : 10px auto; }
.sns-screen li{display: block; width: 370px; height: 500px;  border: 1px solid white; margin: 25px; overflow: hidden; 
			 box-shadow: 0 1px 3px rgba(0,0,0,0.12), 0 1px 2px rgba(0,0,0,0.24);
 			 transition: all 0.3s cubic-bezier(.25,.8,.25,1); border-radius: 10px;}
			/*height를 650을 주면 사진크기가 370*450정도롤 들어갈 수 있긴 한데 전체적으로 너무 길어보여서..*/
.sns-screen li:hover{ box-shadow: 0 14px 18px rgba(29, 31, 25, 0.23), 0 10px 10px rgba(29, 31, 25, 0.23);}
#writing{position: relative; top: -100px;  left: 583px;width: 100px;height: 40px; background-color:#C0C0C0; border-radius: 5px;}
		
/*박스 안의 세부구조*/
.snstitle{width: 95%; height: 10%; border: 1px solid white; margin: 10px auto 0 auto; }
.thumbnail{width: 350px; height: 70%;  border: 1px solid white; margin: 10px auto 0 auto; overflow: hidden;}
			/* 사진이 잘리는 크기와 일치하기 때문에, 이 css와 WriteAction의 BufferdImage()내의 값은 동일할 것 */
.thumbnail>img{object-fit:cover; border-radius: 5px;}
.txt{width: 95%; height: 10%; border: 1px solid white; margin: 10px auto 0 auto; }

/*회원사진,아이디*/
.snstitle .custpic{float: left; width: 50px; height: 100%; overflow:hidden; background-color:#C0C0C0; border-radius: 50%;}
.snstitle span{position: relative; top:29%; left: 3%;}

/*해시테그, 조회수, 좋아요*/
.txt .read{height: 85%; overflow: hidden;}
.txt .buttonlike{z-index:10; float: right; width: 25px; height: 25px; /*background-color:#C0C0C0; border-radius: 50%;*/}
.txt .buttonfollow{float: right; width: 25px; height: 25px;}

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
    left: -140px;
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
    font-size: 45pt;
    position: sticky;
    top: 0px;
    background-color: white;
    border-bottom: 1px solid #C0C0C0;
    z-index: 99;
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
		//response.sendRedirect("snsIndexList.sns"); //index에서 보여줄 sns 데이터 가져오기
		ArrayList<Feed> articleList = (ArrayList<Feed>) request.getAttribute("articleList");
		request.setCharacterEncoding("utf-8");
		String id = (String) session.getAttribute("ID");  //session값에서 아이디 가져올 때 null이면 일반헤더, 아니면 로그인헤더
		if((id==null)){
	%>
		<jsp:include page="header.jsp" />
	<%
		}else{
	%>
		<jsp:include page="header_login.jsp" />
		<input type="hidden" name="cust_id" value="<%=id%>">
	<%
		}

	%>
	
	<!-- 좌측 sns팝업공간 -->
	<div class="in">></div>
	<div class="fixed-banner">
		<div class="fixed-banner-scroll">
			<div class="sns-screen">
				<div class="out">
					<span class="sns-text-title">일상공유</span> <
				</div>
				<ul>
					<%
						for(int i=0;i<8;i++){
							%>
							<!-- 나머지 칸 -->
							<li>
								<a href="snsReadAction.sns?feed_id=<%=articleList.get(i).getFeed_id()%>&cust_id=<%=id%>&feed_writer=<%=articleList.get(i).getCust_id()%>">	
								  	<!-- 타이틀. 회원사진과 아이디 -->
								  	<div class='snstitle'>
								  		<div class="custpic"><img src="../sns/feedPics/<%=articleList.get(i).getCust_pic()%>" onerror="this.src='../sns/img/sns/profile04.jpg'" style="width: 50px;"></div>
								  		<span>작성자 <%=articleList.get(i).getCust_id() %></span></div>
									<div class='thumbnail'>
									<img src='../sns/feedPics/sm_<%=articleList.get(i).getFeed_pics() %>' onerror="this.src='../sns/feedPics/<%=articleList.get(i).getFeed_pics() %>'"   style="width: 350px; height: 350px;"> </div>
								</a>	
								<!-- 내용공간. hashtag, 조회수 -->
								<div class='txt'>
									<!-- 팔로우 버튼. 이미 팔로우 누른 피드는 초록색 아이콘, 안누른 피드는 검은라인 아이콘 -->
									<%
										String follow = articleList.get(i).getFollow_time();
										if(follow==null){
											%><img src="../sns/img/sns/user-unfollow-line.png" class="buttonfollow" value="<%=articleList.get(i).getCust_id()%>"><%
										}else{
											%><img src="../sns/img/sns/user-follow-fill.png" class="buttonfollow" value="<%=articleList.get(i).getCust_id()%>"><%
										}
									%>
									<!-- 좋아요 -->
									<% 
										String like= articleList.get(i).getLike_time();
										if(like==null){
											%><img src="../sns/img/sns/heart-add-line.png" class="buttonlike" value="<%=articleList.get(i).getFeed_id()%>"><%
										}else{
											%><img src="../sns/img/sns/heart-fill.png" class="buttonlike" value="<%=articleList.get(i).getFeed_id()%>"><%
										}
									%>
									<div class="read"><%=articleList.get(i).getFeed_hashtag()%>
										<br><%=articleList.get(i).getFeed_txt() %>
									</div>
								</div>
							</li>
							<%
						}
					%>
				</ul>
			</div>
		</div>
	</div>
	<div class="wrap">
		<!-- section01 -->
		<section id="section01">
			<section class="skewdBox">
				<div id="background">
					<!-- 바탕사진 들어감 -->
				</div>
			</section>
			<section class="skewdBox2">
				<div style="width: 1280px; margin: 0 auto;">
					<div id="halfround"></div>
					<div id="explain01">
						<h1>
							Show Your Rooms <br> on Community
						</h1>
						<ul>
							<li><h5>집들이</h5></li>
							<li><h6>집의 사진 및 인테리어에 이용한 상품 정보를 공유하는 공간</h6></li>
							<li><h5>일상공유</h5></li>
							<li><h6>일상에 대한 정보를 공유하고 다른 사용자와 소통하는 공간</h6></li>
							<li><h5>나와 비슷한</h5></li>
							<li><h6>우리집에 대한 정보를 입력하면 관련된 정보를 추천해주는 공간</h6></li>
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
						<h1>
							Connect with Experts <br> on Bachi
						</h1>
						<ul>
							<li><h5>바치란?</h5></li>
							<li><h6>
									어떤 한 분야의 장인을 뜻하는 말 입니다. <br> 집치레 에서는 이용자가 직접 서비스를 판매할 수 있는
									시스템을 갖추고 있습니다. <br> 로그인 후 바치전환을 시도해 보세요.
								</h6></li>
							<li><h5>바치를 이용하는 방법</h5></li>
							<li><h6>
									바치 마켓을 이용해보세요. <br> 여러가지 분야에 대한 서비스를 구매할 수 있습니다. <br>
									내가 관심있는 분야에 대해 직접 견적요청을 넣을 수도 있습니다.<br>
								</h6></li>
						</ul>
					</div>
				</div>
			</div>
			<div id="portionright">
				<div id="background2">
					<!-- 바탕사진 들어감 -->
				</div>
				<div id="leftpicture"></div>
			</div>
		</section>
		<!-- section03 -->
		<section id="section03">
			<div style="width: 1280px; margin: 0 auto;">
				<div style="position: absolute; width: inherit;">
					<div id="explain03">
						<h1>How to Use Service?</h1>
					</div>
	
					<div id="middlepicture">
						<ul>
							<li class="pic" id="picjoin"></li>
							<li class="text">
								<h5> Join</h5>
								<h6> 집치레와 함께 해 보세요</h6>
							</li>
						</ul>
						<ul>
							<li class="pic" id="picrequest"></li>
							<li class="text">
								<h5> Request & Respond </h5>
								<h6> 견적을 요청하고 답변을 받아보세요 </h6>
							</li>
						</ul>
						<ul>
							<li class="pic" id ="picmaching"></li>
							<li class="text">
								<h5> Matching</h5>
								<h6> 자신과 가장 맞는 바치와 거래해 보세요 </h6>
							</li>
						</ul>
					</div>
				</div>
			</div>
		</section>
	</div>
	<footer>
		<jsp:include page="footer.jsp" />
	</footer>
	<script>
$(document).ready(function(){
	/* 좌측 팝업 열고 닫는 기능 */
	$(".out").on("click",function(){
		$(".fixed-banner").css({'left':"-100%"});
		$(".fixed-banner").css({'transition':"all ease-out"});
		});
	$(".in").on("click",function(){
		$(".fixed-banner").css({'left':"0"});
		$(".fixed-banner").css({'transition':"all ease-in"});
		});
	
	/* 좋아요 버튼 눌렀을 때 바로 DB작업하기*/
	$(".buttonlike").click(function(){  
		//버튼 div의 value값으로 feed_id를 넣어놨음
		var feed_id= $(this).attr("value");
		var cust_id= $("input:hidden[name=cust_id]").val();
		if(cust_id==undefined){
			alert("좋아요를 이용하시려면 로그인을 실행해주세요");
		}else{ //아직 좋아요버튼을 누르지 않은 상태일때
			$.ajax({
				url : "snsHeartAction.sns?feed_id="+feed_id+"&cust_id="+cust_id,  
				dataType : "html",
				//data : "post",
				success : function(check){
					//alert("");
				}
			});

			var src1 = $(this).attr("src");
			//alert(src1);
			if(src1=="../sns/img/sns/heart-fill.png"){
				$(this).attr("src","../sns/img/sns/heart-add-line.png");
			}else{
				$(this).attr("src","../sns/img/sns/heart-fill.png");
			}

		}
	});

	/* 팔로우 버튼 눌렀을 때 바로 DB작업하기*/
	$(".buttonfollow").click(function(){  
		//버튼 div의 value값으로 feed_id를 넣어놨음
		var cust_following= $(this).attr("value");   //로그인 한 사람이 팔로잉하는 아이디
		var cust_id= $("input:hidden[name=cust_id]").val();  //로그인 한 사람의 아이디
		if(cust_id==undefined){
			alert("팔로우를 이용하시려면 로그인을 실행해주세요");
		}else{ //아직 좋아요버튼을 누르지 않은 상태일때
			$.ajax({
				url : "snsFollowAction.sns?cust_following="+cust_following+"&cust_id="+cust_id,  
				dataType : "html",
				//data : "post",
				success : function(check){
					//alert("");
				}
			});
		//내가 누른 버튼의 아이콘 변경. 그리고 같은 글쓴이를 공유하고 있는 다른 버튼들도 팔로우 버튼 자동적으로 변경 
		var src1 = $(this).attr("src");
		if(src1=="../sns/img/sns/user-unfollow-line.png"){
			$(this).attr("src","../sns/img/sns/user-follow-fill.png");
			$(".buttonfollow[value="+cust_following+"]").attr("src","../sns/img/sns/user-follow-fill.png");
		}else{
			$(this).attr("src","img/sns/user-unfollow-line.png");
			$(".buttonfollow[value="+cust_following+"]").attr("src","../sns/img/sns/user-unfollow-line.png");
		}
		}
	});
	
	/*마우스 올렸을 때 이미지 살짝 커지게 하기*/
	$("img").mouseenter(function(){
		$(this).css("scale","1.05");
		$(this).css("cursor","pointer");
	});
	$("img").mouseleave(function(){
		$(this).css("scale","1.0");
	});
	
});
</script>
</body>
</html>