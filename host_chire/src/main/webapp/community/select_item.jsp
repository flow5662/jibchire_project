<%@page import="dto.Pro_post"%>
<%@page import="dao.CmtHousewarming"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
int pro_id = Integer.parseInt(request.getParameter("pro_id"));
CmtHousewarming house = new CmtHousewarming();
Pro_post product =house.selectItem(pro_id);
%>
<div id="selectwrap">
	<img id="selectimg" src="postPics/<%=product.getPro_picture()%>" style="width: 100px;">
	<ul id="selectinfo">
		<li>[<%=product.getPro_menu1()%>]</li>
		<li><h4><%=product.getPro_title()%></h4></li>
		<li><h5><%=product.getPro_company()%></h5></li>
		<li><%=product.getPro_price()%></li>
	</ul>
</div>
</body>
</html>