<%@page import="dto.Post_bookmark"%>
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
	Post_bookmark book = new Post_bookmark();
	//ajax에서 url로 넘겨준 값 세팅하기
	int post_id=Integer.parseInt(request.getParameter("post_id"));
	String cust_id = request.getParameter("cust_id");
	book.setPost_id(post_id);
	book.setCust_id(cust_id);
	
	CmtHousewarming cmt = new CmtHousewarming();
	
	/*값이 있는지 먼저 확인하기 */
	Boolean isSelectExist = cmt.selectBook(book);
	if(!isSelectExist) {
		/* 북마크 insert하기 */
		int insertCount = cmt.insertBook(book);
	}else {
		/* 북마크 delete 하기*/
		int deleteCount = cmt.deleteBook(book);
		
	}
	
%>
</body>
</html>