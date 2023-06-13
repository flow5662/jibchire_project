<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
#wrap{width: 1280px; margin :0 auto;}
table#info{width: 70%; border:1px solid #A0A0A0; box-shadow: 0 0 5px #A0A0A0; margin: 20px auto 0 auto;}
thead {text-align: center; height: 50px; }
tbody tr:first-child{height: 300px;}
tbody tr:nth-child(2){height: 100px; text-align: center;}
tbody td{width: 49%;}
td{border:1px solid #A0A0A0;}
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
	request.setAttribute("cust_id", id);
%>
	<jsp:include page="header_login.jsp" />
<%
	}
%>
	<div id="wrap">
		<table id="info">
			<thead>
				<tr><td colspan="2"> 원하는 작업을 선택해 주세요</td></tr>
			</thead>
			<tbody>
				<tr><td> 이미지 </td>
					<td> 이미지  </td>
				</tr>
				<tr><td> 내 소개 입력하기 </td>
					<td> 나에게 맞는 추천을 받기 위해 <br> 집 정보 입력하기 </td>
				</tr>
			</tbody>
		</table>
	</div>
<footer>
	<jsp:include page="footer.jsp" />
</footer>	
</body>
</html>