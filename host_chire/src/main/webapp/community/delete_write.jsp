<%@page import="dao.CmtHousewarming"%>
<%@ page import="dto.Post_house" %>
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
		request.setCharacterEncoding("utf-8");
		CmtHousewarming del = new CmtHousewarming();
		int post_id= Integer.parseInt(request.getParameter("post_id"));
		del.delete(post_id);
		out.println("<script> alert('삭제 되었습니다')"); 
		out.println("document.location.href = 'index.jsp' </script>");
	%>
</body>
</html>