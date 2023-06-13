<%@page import="dto.PageInfo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>받은견적</title>
</head>
<style>
.wrap{margin:0 auto;}
.request-ans{width:1280px;margin:0 auto;padding-top:30px;}
.list{display: flex;flex-direction: column;align-items: center;text-align: center;}
.user{box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);border-radius: 5px;height: 70px;width: 70px;}
table{text-align: center;border-spacing: 0 15px;border-collapse: separate;}
th {font-size: 16pt;}
</style>

<body>
<%
PageInfo pageInfo = (PageInfo)request.getAttribute("pageInfo");
int listCount=pageInfo.getListCount();
int nowPage=pageInfo.getPage();
int maxPage=pageInfo.getMaxPage();
int startPage=pageInfo.getStartPage();
int endPage=pageInfo.getEndPage();

%>
<div class="wrap">
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
	<%
		}
	%>
	</header>


<div class="request-ans">
<div class="list">
<table>
<tr><th style="width: 160px;">대분류 카테고리</th><th style="width: 190px;">중분류 카테고리</th><th style="width: 200px;">목적</th><th style="width: 200px;
">장소</th><th style="width: 200px;">유형</th><th style="width: 200px;">질문일자</th></tr>



<c:forEach items="${bachi_reqest}" var="i">

<tr class="user"><td><a href="bachi_match_anser_det?est_id=${i.est_id}">${i.gosu_menu1}</a></td>
<td><a href="bachi_match_anser_det?est_id=${i.est_id}">${i.gosu_menu2}</a></td>
<td><a href="bachi_match_anser_det?est_id=${i.est_id}">${i.est_q1}</a></td>
<td><a href="bachi_match_anser_det?est_id=${i.est_id}">${i.est_q2}</a></td>
<td><a href="bachi_match_anser_det?est_id=${i.est_id}">${i.est_q3}</a></td>
<td><a href="bachi_match_anser_det?est_id=${i.est_id}">${i.est_q_date}</a></td></tr>

</c:forEach>
<c:if test="${empty bachi_reqest}"><tr><td colspan="6" style="height: 60px;">게시글 정보가 없습니다.</td></tr></c:if>
</table>


	<!-- 페이징 수정요망!! -->
	<section id="pageList">
		<%if(nowPage<=1){ %>
		◀
		<%}else{ %>
		<a href="bachi_match_anser?page=<%=nowPage-1 %>">◀</a>
		<%} %>

		<%for(int a=startPage;a<=endPage;a++){
				if(a==nowPage){%>
		<a href="bachi_match_anser?page=<%=a %>"><%=a %></a>
		<%}else{ %>
		<a href="bachi_match_anser?page=<%=a %>"><%=a %>
		</a>
		<%} %>
		<%} %>

		<%if(nowPage>=maxPage){ %>
		▶
		<%}else{ %>
		<a href="bachi_match_anser?page=<%=nowPage+1 %>">▶</a>
		<%} %>
	</section>
</div>
</div>
    <div style="margin-left: auto; margin-right: auto;">
<jsp:include page="footer.jsp" />
</div>
</div>

</body>
</html>