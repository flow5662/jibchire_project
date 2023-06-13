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
#repairstore{width: 50%;height: inherit; float: left; overflow: auto;}
#repairmapkakao{width:50%;height:inherit; float: right;}

.repairset{ width: 95%; border: 1px solid white; box-shadow: 0 1px 3px rgba(0,0,0,0.12), 0 1px 2px rgba(0,0,0,0.24);
 			transition: all 0.3s cubic-bezier(.25,.8,.25,1); border-radius: 10px;     margin: 10px;    background-color: #F2F2B8;}
.repairset:hover{ box-shadow: 0 7px 7px rgba(29, 31, 25, 0.23), 0 5px 5px rgba(29, 31, 25, 0.23);}
.repairset li{display: block; margin: 10px;}
</style>
<body>
<div class="result">
	<section id="repairstore">
<%
	JSONArray array = (JSONArray) request.getAttribute("array");
	String text = request.getParameter("text");
	for(int i=0; i<array.size(); i++){

	    //배열 안에 있는것도 JSON형식 이기 때문에 JSON Object 로 추출
	    JSONObject object = (JSONObject) array.get(i);
	    
// 		JSON name으로 추출
//    	out.println("row_"+i+" ===========================================");
// 	    out.println("<br>");
// 	    out.println("ENT_NO ==> "+object.get("ENT_NO"));
// 	    out.println("<br>");
// 	    out.println("ENT_NM ==> "+object.get("ENT_NM"));
// 	    out.println("<br>");
// 	    out.println("ENT_BUSI_NO ==> "+object.get("ENT_BUSI_NO"));
// 	    out.println("<br>");
// 	    out.println("OPEN_DT ==> "+object.get("OPEN_DT"));
// 	    out.println("<br>");
// 	    out.println("ENT_OWNER_NM ==> "+object.get("ENT_OWNER_NM"));
// 	    out.println("<br>");
// 	    out.println("ENT_TEL_NO ==> "+object.get("ENT_TEL_NO"));
// 	    out.println("<br>");
// 	    out.println("BIZ_ITEM ==> "+object.get("BIZ_ITEM"));
// 	    out.println("<br>");
// 	    out.println("HOLD_LCNS ==> "+object.get("HOLD_LCNS"));
// 	    out.println("<br>");
// 	    out.println("MAIN_CNSTRCT_FLD_NM ==> "+object.get("MAIN_CNSTRCT_FLD_NM"));
// 	    out.println("<br>");
// 	    out.println("ENT_ADM_CD ==> "+object.get("ENT_ADM_CD"));
// 	    out.println("<br>");
// 	    out.println("ENT_ADDR ==> "+object.get("ENT_ADDR"));
// 	    out.println("<br>");
	    if(object.get("ENT_ADDR").toString().contains(text)){
			String result_id = "box"+i;
			String phone = " (제공하지 않음)";
			if(object.get("ENT_TEL_NO")==null || object.get("ENT_TEL_NO").equals(null)){
				phone = (String) object.get("ENT_TEL_NO");
			}
%>
			<ul class="repairset" id="<%=result_id%>">
<%-- 				<li><%=object.get("ENT_NO")%></li> --%>
				<li>업체명 : <span><%=object.get("ENT_NM")%></span></li>
<%-- 				<li><%=object.get("ENT_BUSI_NO")%></li> --%>
<%-- 				<li><%=object.get("OPEN_DT")%></li> --%>
<%-- 				<li><%=object.get("ENT_OWNER_NM")%></li> --%>
				<li>연락처 :<span><%=phone%></span></li>
<%-- 				<li><%=object.get("BIZ_ITEM")%></li> --%>
				<li>보유면허 : <span><%=object.get("HOLD_LCNS")%></span></li>
				<li>주요시공분야 : <span><%=object.get("MAIN_CNSTRCT_FLD_NM")%></span></li>
<%-- 				<li><%=object.get("ENT_ADM_CD")%></li> --%>
				<li>주소 : <span><%=object.get("ENT_ADDR")%></span></li>
			</ul>
<%
	    }
	    
	}
%>
	 </section>
	<!-- 지도크기 -->
	<div id="repairmapkakao"></div>
</div>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=e7c3c7195a7bc32c881f7cd628d1975e&libraries=services"></script>
<script>
$(function(){
	/*디폴트 값 보이기*/
	var ful_id = $(".repairset").attr("id");
	var ful_li1 = "#"+ful_id+" > li:nth-child(1) > span";
	var ful_li2 = "#"+ful_id+" > li:nth-child(5) > span";
	var fcentername = $(ful_li1).text();
	var fcenteraddress = $(ful_li2).text();
	$.ajax({
		url : "view_repairmap.jsp?content1="+fcentername+"&address1="+fcenteraddress,  
		dataType : "html",
		success : function(check){
			$("#repairmapkakao").html(check);
		}
	}); 	
	
	var repaircontent = null; 
	var repairaddress = null;
	/*하나의 값 선택했을 때 오른쪽에 지도 보이기*/
	$(".repairset").click(function(){
		var ul_id = $(this).attr("id");
// 		alert("ul_id = "+ul_id);
		var ul_li1 = "#"+ul_id+" > li:nth-child(1) > span";
		var ul_li2 = "#"+ul_id+" > li:nth-child(5) > span";
		var centername = $(ul_li1).text();
		var centeraddress = $(ul_li2).text();
// 		alert("centeraddress = "+centeraddress);
		repaircontent = centername ; 
		repairaddress = centeraddress ;
		$.ajax({
 			url : "view_repairmap.jsp?content1="+repaircontent+"&address1="+repairaddress,  
 			dataType : "html",
 			success : function(check){
//  				alert(check);
 				$("#repairmapkakao").html(check);
//  				alert(check);
 			}
 		}); 
	});

});	
	
</script>
</body>
</html>