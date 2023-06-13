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
String picture = request.getParameter("picture");
CmtHousewarming house = new CmtHousewarming();
Pro_post product = house.selectproduct(picture);
out.println("["+product.getPro_menu1()+"]");
out.println("<br>");
out.println("<span style='font-weight: bold'>"+product.getPro_title()+"</span>");
out.println("<br>");
out.println("<i style='font-size:8pt'>"+product.getPro_company()+"</i>");
out.println("<br>");
out.println(product.getPro_price());
%>


</body>
</html>