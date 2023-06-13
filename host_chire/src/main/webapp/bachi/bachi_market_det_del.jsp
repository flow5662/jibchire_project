<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%request.setCharacterEncoding("utf-8");%>
   <%@page import="java.util.ArrayList"%>
    <%@page import="dto.Bachi_market"%>
     <%@page import="dto.Bachi_product"%>
     <%@page import="java.lang.*" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:useBean id="market" class="dao.Gosu_mark">
<%
String market_id = request.getParameter("market_id");
int mark = 0;
if(market_id != null && !market_id.isEmpty()) {
    mark = Integer.parseInt(market_id);
}
out.println(market_id);
out.println(mark);
market.gosu_middle_delete(mark);
market.gosu_mark_del(mark);
response.sendRedirect("bachi_market_list.jsp");


%>


</jsp:useBean>
</body>
</html>