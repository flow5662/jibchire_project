<%@page import="dto.ActionForward"%>
<%@page import="javax.imageio.ImageIO"%>
<%@page import="java.io.File"%>
<%@page import="java.awt.Graphics2D"%>
<%@page import="java.awt.image.BufferedImage"%>
<%@page import="java.awt.image.renderable.ParameterBlock"%>
<%@page import="java.util.Enumeration"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dto.Feed"%>
<%@page import="dto.PageInfo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>일상공유 메인</title>
	<link rel="stylesheet" type="text/css" href="style/snsList.css">
</head>
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
		<%
			}
		%>
	</header>
	<div id="wrap">

<%
	/* SnsListAction 에서 setAttribute 설정해둔 것 가져오기 */
	ArrayList<Feed> articleList = (ArrayList<Feed>) request.getAttribute("articleList");
    PageInfo pageInfo = (PageInfo)request.getAttribute("pageInfo");
	int listCount=0;
	int nowPage;
	int maxPage;
	int startPage;
	int endPage;
	// "pageInfo"라는 key값에 pageInfo라는 객체를 value값으로 넣었기 때문에 getAttribute할때도 객체로의 형변환이 필요한 것. 
	if(articleList == null || pageInfo == null){
		ActionForward forward = new ActionForward();
		out.println("null이니?");
		forward.setPath("snsListAction.bo");
		RequestDispatcher dispatcher= request.getRequestDispatcher(forward.getPath());
		dispatcher.forward(request, response);
	}else if(articleList != null && listCount > 0){		
		listCount=pageInfo.getListCount();
		nowPage=pageInfo.getPage();
		maxPage=pageInfo.getMaxPage();
		startPage=pageInfo.getStartPage();
		endPage=pageInfo.getEndPage();



%>
 
<%

%>
		<!-- 리스트, 썸네일목록 -->
		<section>
			<div id="title"> <h2>일상공유</h2></div>
			<div id="snsthunbnail">				
				<ul>
					<%
						for(int i=0;i<articleList.size();i++){
							if(i==0){
							%><a href="snsReadAction.bo?feed_id=<%=articleList.get(i).getFeed_id()%>">	<%
								out.println("<li> <div class='snstitle'>"+articleList.get(i).getFeed_date()+"</div>");
								out.println("<div class='thumbnail'><img src='feedPics/sm_"+articleList.get(i).getFeed_pics()+"'> </div>");
								out.println("<div class='txt'>"+articleList.get(i).getFeed_txt()+"<br>"+articleList.get(i).getFeed_hashtag()+" </div>");
								out.println("</li>");
							%></a><li style="width: 370px; height: 420px;" id="topmiddle"><div class="snstitle"> 1행2열 </div></li> <%	//1행2열을 값을 넣을 페이지가 아니기 때문에 여기는 그럴 필요 없음
							}else if(i==3 || i==6){
							%><li style="position: relative; top: -80px;">
	<!-- 3,6번만 a태그 걸어놨다 -->					
								<div class="snstitle"><a href="snsReadAction.bo?feed_id=<%=articleList.get(i).getFeed_id()%>">	<%= articleList.get(i).getFeed_date() %></a> </div>	
								<div class='thumbnail'><a href="snsReadAction.bo?feed_id=<%=articleList.get(i).getFeed_id()%>"><img src="feedPics/sm_<%= articleList.get(i).getFeed_pics() %>"></a></div>
								<div class='txt'><%= articleList.get(i).getFeed_txt() %><br> <%= articleList.get(i).getFeed_hashtag()%>  </div>
						
							</li><% 	
							}else{
								out.println("<li> <div class='snstitle'>"+articleList.get(i).getFeed_date()+"</div>");
								out.println("<div class='thumbnail'><img src='feedPics/sm_"+articleList.get(i).getFeed_pics()+"'></div>");
								out.println("<div class='txt'>"+articleList.get(i).getFeed_txt()+"<br>"+articleList.get(i).getFeed_hashtag()+"   </div>");
								out.println("</li>");
							}
							
							
						}
					%>
					
					
					<!-- 이렇게 만들었었는데 이제 배열 하나의 박스 만들려고 주석처리
					<li> <div class="thumbnail">000</div> </li>
					<li style="width: 370px; height: 370px; "><div class="thumbnail"> 111 </div></li>
					<li><div class="thumbnail"> 222 </div></li>
					<li><div class="thumbnail"> 333 </div></li>
					<li style="position: relative; top: -80px;"><div class="thumbnail"> 444 </div></li>
					<li><div class="thumbnail"> 555 </div></li>
					<li><div class="thumbnail"> 666 </div></li>
					<li style="position: relative; top: -80px;"><div class="thumbnail"> 777 </div></li>
					<li><div class="thumbnail"> 888 </div></li>
					 -->
				</ul>
			</div>
	    	
	    </section>
	    
	    
	    
	    
	    <!-- 페이징 -->
	    <section id="pageList">
			<%if(nowPage<=1){ %>
				[이전]&nbsp;&nbsp;
			<%}else{ %>
				<a href="snsListAction.bo?page=<%=nowPage-1 %>">[이전]</a>&nbsp;
			<%} %>
	
			<%for(int a=startPage;a<=endPage;a++){
					if(a==nowPage){%>
				[<%=a%>]&nbsp;&nbsp;
			<%}else{ %>
				<a href="snsListAction.bo?page=<%=a%>">[<%=a%>]
				</a>&nbsp;
			<%} %>
			<%} %>
			<%if(nowPage>=maxPage){ %>
				[다음]
			<%}else{ %>
				<a href="snsListAction.bo?page=<%=nowPage+1 %>">[다음]</a>
			<%} %>
		</section>
			<%
			}
			else
			{
			%>
			<section id="emptyArea">등록된 글이 없습니다.</section>
			<%
			}
			%>
		<!-- 글쓰기버튼 -->
		<section> 
			<% //로그인한 상태면 글쓰기 버튼 보이게 할 것
				String id2 = (String) session.getAttribute("ID");
				if(!(id2==null)){
			%>
			    <input type="button" value="글쓰기" onclick="location.href='snsWrite.jsp'" id="writing">
		    <%  } 	
		    %> 
		</section>
	</div>		
		
		
	<!-- footer -->
	<footer>
		<jsp:include page="footer.jsp" />
	</footer>
</body>
</html>