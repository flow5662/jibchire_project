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
</head>
<style>
.result{width: 1080px;height:600px;  margin: 0 auto;}
#rentstore{width: 50%;height: inherit;  float: left; overflow: auto;}
#rentmapkakao {width:50%;height:inherit; float: right;}

.resultset{ width: 95%; border: 1px solid white; box-shadow: 0 1px 3px rgba(0,0,0,0.12), 0 1px 2px rgba(0,0,0,0.24);
 			transition: all 0.3s cubic-bezier(.25,.8,.25,1); border-radius: 10px;     margin: 10px;    background-color: #F2F2B8;}
.resultset:hover{ box-shadow: 0 7px 7px rgba(29, 31, 25, 0.23), 0 5px 5px rgba(29, 31, 25, 0.23);}
.resultset li{display: block; margin: 10px;}
</style>
<body>
<div class="result">
	<section id="rentstore"> 
<%
	JSONArray array = (JSONArray) request.getAttribute("array");
	String text = request.getParameter("text");
	for(int i=0; i<array.size(); i++){

	    //배열 안에 있는것도 JSON형식 이기 때문에 JSON Object 로 추출
	    JSONObject object = (JSONObject) array.get(i);
		    //JSON name으로 추출
// 	   	    out.println("row_"+i+" ===========================================");
// 		    out.println("<br>");
// 		    out.println("CENTER_NAME ==> "+object.get("CENTER_NAME"));
// 		    out.println("<br>");
// 		    out.println("CENTER_ADDRES ==> "+object.get("CENTER_ADDRES"));
// 		    out.println("<br>");
// 		    out.println("CENTER_TEL_NO ==> "+object.get("CENTER_TEL_NO"));
// 		    out.println("<br>");

	    if(object.get("CENTER_ADDRES").toString().contains(text)){
			String result_id = "box"+i;
%>
			<ul class="resultset" id="<%=result_id%>">
				<li>업체명 : <span><%=object.get("CENTER_NAME")%></span></li>
				<li>주소 : <span><%=object.get("CENTER_ADDRES")%></span></li>
				<li>연락처 : <span><%=object.get("CENTER_TEL_NO")%></span></li>
			</ul>
<%
	    }
	}
%>
	</section>
	<!-- 지도크기 -->
	<div id="rentmapkakao"></div>
</div>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=e7c3c7195a7bc32c881f7cd628d1975e&libraries=services"></script>
<script>
$(function(){
	/*디폴트로 리스트 첫번째 꺼 실행*/
	var ful_id = $(".resultset").attr("id");
	var ful_li1 = "#"+ful_id+" > li:nth-child(1) > span";
	var ful_li2 = "#"+ful_id+" > li:nth-child(2) > span";
	var firstcontent = $(ful_li1).text();
	var firstaddress = $(ful_li2).text();
	$.ajax({
		url : "view_map.jsp?content="+firstcontent+"&address="+firstaddress,  
		dataType : "html",
		success : function(check){
			$("#rentmapkakao").html(check);
		}
	}); 
	var rentcontent = null; 
	var rentaddress = null; 
	/*하나의 값 선택했을 때 오른쪽에 지도 보이기*/
	$(".resultset").click(function(){
		var ul_id = $(this).attr("id");
// 		alert("ul_id = "+ul_id);
		var ul_li1 = "#"+ul_id+" > li:nth-child(1) > span";
		var ul_li2 = "#"+ul_id+" > li:nth-child(2) > span";
		var centername = $(ul_li1).text();
		var centeraddress = $(ul_li2).text();
// 		alert("centeraddress = "+centeraddress);
		rentcontent = centername ; 
		rentaddress = centeraddress ;
		$.ajax({
 			url : "view_map.jsp?content="+rentcontent+"&address="+rentaddress,  
 			dataType : "html",
 			success : function(check){
 				$("#rentmapkakao").html(check);
//  				alert(check);
 			}
 		}); 
	});
});	
	
</script>
</body>
</html>