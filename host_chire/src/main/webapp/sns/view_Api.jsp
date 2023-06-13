<%@page import="dto.Cust_info"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="org.json.simple.JSONArray"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=e7c3c7195a7bc32c881f7cd628d1975e&libraries=services"></script>
</head>
<style>
#wrap{width:1080px; margin:0 auto;}

/*선택창*/
section[id^=sec] h1{ font-size: 43px; color:#454a44;   }
#section03{width: 100%; background-color: #dae1da;}
#section03 #explain03{    width: 1280px;    text-align: center;     padding: 10px 0;}
#section03 #middlepicture{width:615px; margin: 0 auto;}
#section03 #middlepicture ul{display: inline-block; margin:0 20px; }
#section03 #middlepicture ul:hover{cursor: pointer;}
#section03 #middlepicture ul li{display: block; }
#section03 #middlepicture ul li.pic{width:260px;height:300px; border-top-left-radius:50%; border-top-right-radius:50%;  background: #FFFFFF;  box-shadow:  5px 5px 5px #f4f6f3; overflow: hidden;}
#section03 #middlepicture ul li.pic:hover{  box-shadow: 0 14px 18px rgba(29, 31, 25, 0.23), 0 10px 10px rgba(29, 31, 25, 0.23);}
#section03 #middlepicture ul li.text{width:260px; height: 50px;     margin: 15px 0;}
#section03 ul li h5{font-size: 16pt; color: #454a44;    font-style: italic;    font-weight: 900; text-align: center;}
#section03 ul li h6{font-size: 10pt; margin: 10px 0 10px 20px; text-align: center;}

/*위의 제목*/
#info{width: 100%; height: 50px; background-color: beige;}
#infotitle{width:1080px; margin:0 auto; text-align: center;}

/*제목 및 검색창*/
#publicApi{margin-top: 15px;}
#publicApi>ul{margin: 10px 0;}
#publicApi h2{font-size: 24pt;   margin-left: 10px;}
#publicApi input[type='text']{width: 44%;  height: 40pt; padding-left: 0.5em; border: #FFF; border-radius: 15px;
		box-shadow: 0 1px 3px #dae1da, 0 1px 2px #dae1da;    background-color: #E0E0E0;}
#publicApi #rentalshop{margin-left: 10px;}
#publicApi #repairshop{display: none;    margin-left: 10px;}
#publicApi #repairMap{display: none;}
</style>
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
	<input type="hidden" name="cust_id" value="<%=id%>">
<%
	}
%>
</header>
<%  Cust_info info = (Cust_info) request.getAttribute("Cust_info"); 
	if(!(info==null)){
%>
<input type="hidden" name="cust_region" value="<%=info.getCust_adr()%>">
<%		
	}
%>

<!-- section03 -->
<section id="section03">
	<div style="width: 1280px; margin: 0 auto;">
		<div id="explain03">
			<h1>서울시가 제공하는 공구대여소 / 시공업체 </h1>
		</div>
		<div id="middlepicture">
			<ul>
				<li class="pic"><img src="img/publicapi/gonggu2.jpg" style="width:260px;height:300px;"> </li>
				<li class="text">
					<h5> 공구대여소 찾기 </h5>
					<h6> 무료로 공구를 대여할 수 있는 곳 </h6>
				</li>
			</ul>
			<ul>
				<li class="pic"><img src="img/publicapi/gonggu3.jpg" style="width:260px;height:300px;"> </li>
				<li class="text">
					<h5> 시공업체 찾기 </h5>
					<h6> 서울시 인증 교육을 받은 업체 </h6>
				</li>
			</ul>
		</div>
	</div>
</section>
<div id="wrap">
	<section id ="publicApi">
		<h2>공구대여소 찾기</h2>
		<ul id="rentalshop">
<!-- 			<li>공구대여소 찾기</li> -->
			<li><input type="text" id="renttext" placeholder="주소나 상호명을 검색해주세요"></li>
			<li id="searchrent"> 검색 </li>
		</ul>
		<ul id="repairshop">
<!-- 			<li>시공업체 찾기 </li> -->
			<li><input type="text" id="repairtext" placeholder="주소나 상호명을 검색해주세요"></li>
			<li id="searchrepair">검색</li>
		</ul>
		<div id="rentMap" style="width: 100%;">
			<ul class="resultset"></ul>
			<div id="rentmapkakao"></div>
		</div>

		<div id="repairMap" style="width: 100%;">
			<ul class="repairset"></ul>
			<div id="repairmapkakao"></div>
		</div>
	</section>
<script>
$(function(){
	/*공공대여소 default 값 가지고 오기 */
	var address = $("input[name=cust_region]").val(); //디폴트 타입으로 로그인 한 사람의 지역정보 가져오기 
	if(address==null){
		address = "은평구";
	}
	$.ajax({
		url : "publicapirent.sns?text="+address,  
		dataType : "html",
		success : function(check){
			$("#rentMap").html(check);
		}
	}); 
	

	/*공구대여소 찾기 기능 보이기 */
	$("#middlepicture ul:nth-child(1)").click(function(){
		$("h2").text("공구대여소 찾기");
		$("#repairshop").hide();
		$("#repairMap").hide();
		$("#rentalshop").show();
		$("#rentMap").show();
	});
	/*인테리어 시공업체 찾기 기능 보이기 */
	$("#middlepicture ul:nth-child(2)").click(function(){
		$("h2").text("인테리어 시공업체 찾기");
		$("#rentalshop").hide();
		$("#rentMap").hide();
		$("#repairshop").show();
		$("#repairMap").show();
		/*인테리어 업체 default 값 가지고 오기 */
		var repairtext = $("input[name=cust_region]").val(); //디폴트 타입으로 로그인 한 사람의 지역정보 가져오기
		if(repairtext==null){
			repairtext = "은평구";
		}
		$.ajax({
			url : "publicapirepairstore.sns?text="+repairtext,  
			dataType : "html",
			success : function(check){
				$("#repairMap").html(check);
			}
		}); 
	});

	/* 공구대여소 찾기 */
	$("#searchrent").click(function(){
		var renttext = $("#renttext").val();
		$.ajax({
 			url : "publicapirent.sns?text="+renttext,  
 			dataType : "html",
 			success : function(check){
 				$("#rentMap").html(check);
 			}
 		}); 
	});
	/* 인증업체 찾기 */
	$("#searchrepair").click(function(){
		var repairtext = $("#repairtext").val();
		$.ajax({
 			url : "publicapirepairstore.sns?text="+repairtext,  
 			dataType : "html",
 			success : function(check){
 				$("#repairMap").html(check);
 			}
 		}); 
	});
	
	
	
});
</script>
<%
// 	JSONArray array = (JSONArray) request.getAttribute("array");
// 	for(int i=0; i<array.size(); i++){

// 	    //배열 안에 있는것도 JSON형식 이기 때문에 JSON Object 로 추출
// 	    JSONObject object = (JSONObject) array.get(i);
	    
// 	    if(object.get("CENTER_ADDRES").toString().contains("동대문구")){
// 		    //JSON name으로 추출
// 	   	    out.println("row_"+i+" ===========================================");
// 		    out.println("<br>");
// 		    out.println("CENTER_NAME ==> "+object.get("CENTER_NAME"));
// 		    out.println("<br>");
// 		    out.println("CENTER_ADDRES ==> "+object.get("CENTER_ADDRES"));
// 		    out.println("<br>");
// 		    out.println("CENTER_TEL_NO ==> "+object.get("CENTER_TEL_NO"));
// 		    out.println("<br>");
// 	    }
// 	}
%>
</div>
<!-- footer -->
<footer>
	<jsp:include page="footer.jsp" />
</footer>
</body>
</html>