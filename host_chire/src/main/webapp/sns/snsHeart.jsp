<%@page import="dto.Feed_like"%>
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
<%
	/* SnsListAction 에서 setAttribute 설정해둔 것 가져오기 */
	ArrayList<Feed> articleList = (ArrayList<Feed>) request.getAttribute("articleList");
    PageInfo pageInfo = (PageInfo)request.getAttribute("pageInfo");
	// "pageInfo"라는 key값에 pageInfo라는 객체를 value값으로 넣었기 때문에 getAttribute할때도 객체로의 형변환이 필요한 것. 
	int listCount=pageInfo.getListCount();
	int nowPage=pageInfo.getPage();
	int maxPage=pageInfo.getMaxPage();
	int startPage=pageInfo.getStartPage();
	int endPage=pageInfo.getEndPage();
%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>일상공유 메인</title>
	<link rel="stylesheet" type="text/css" href="style/snsList.css">
</head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
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
			// 원래 여기에 response.sendRedirect("snsHeartLoginAction.sns?cust_id=+id"); 를 호출해서 값을 가져오려고 했는데.. 오류는 안나지만 articlelist와 같이 for문을 돌리면 오류가 난다 아아아악!!!!! 짜증
			}
		%>
	</header>
	<div id="wrap">
	<%
	ArrayList<Feed_like> flist = (ArrayList<Feed_like>) request.getAttribute("flist");
	if(articleList != null && listCount > 0){
	%>
		<!-- 리스트, 썸네일목록 -->
		<section>
			<div id="title"> <h2>일상공유</h2></div>
			<div id="snsthunbnail">				
				<ul>
					<%
						for(int i=0;i<articleList.size();i++){
							if(i==0){
							%>
							<!-- 1열1행 -->
							<li><a href="snsReadAction.sns?feed_id=<%=articleList.get(i).getFeed_id()%>">	
							  	<div class='snstitle'><%=articleList.get(i).getFeed_date() %></div>
								<div class='thumbnail'><img src='feedPics/sm_<%=articleList.get(i).getFeed_pics() %>'> </div></a>
								<div class='txt'>조회수<%=articleList.get(i).getFeed_read() %>
									<div class="buttonlike" value="<%=articleList.get(i).getFeed_id()%>"></div>
								</div>
							</li>
							<!-- 검색창 및 메뉴가 들어갈 1행2열 여기서 집어넣기 -->
							<li style="width: 370px; height: 420px;" id="topmiddle">
								<div class="serch">
									<div class="search-box">
										<input type="text" class="search-txt" placeholder="검색">
										<a class="search-btn" href="#">
								        	<i class="fas fa-search"></i>
							     		</a>
						     		</div>
					     		</div>
					     		<div> 좋아요 리스트 
					     		</div>
							</li> 
							<%	
							}else if(i==3 || i==6){
							%>
							<!-- 2행2열, 3행3열 중앙에 위치 다름 -->
							<li style="position: relative; top: -80px;"><a href="snsReadAction.sns?feed_id=<%=articleList.get(i).getFeed_id()%>">	
								<div class="snstitle"><%= articleList.get(i).getFeed_date() %></div>	
								<div class='thumbnail'><img src="feedPics/sm_<%= articleList.get(i).getFeed_pics() %>"></a></div>
								<div class='txt'>조회수<%=articleList.get(i).getFeed_read() %>
									<div class="buttonlike" value="<%=articleList.get(i).getFeed_id()%>"></div> 
								</div>
							</li> 
							<% 	
							}else{
							%>
							<!-- 나머지 칸 -->
							<li><a href="snsReadAction.sns?feed_id=<%=articleList.get(i).getFeed_id()%>">
								<div class='snstitle'><%=articleList.get(i).getFeed_date() %></div>
								<div class='thumbnail'><img src='feedPics/sm_<%=articleList.get(i).getFeed_pics() %>'></div></a>
								<div class='txt'>조회수<%=articleList.get(i).getFeed_read() %>
									<div class="buttonlike" value="<%=articleList.get(i).getFeed_id()%>"></div>  
								</div>
							</li>
							<%
							}
						}
					%>
				</ul>
			</div>
	    </section>
	    <!-- 페이징 -->
	    <section id="pageList">
			<%if(nowPage<=1){ %>
				[이전]&nbsp;&nbsp;
			<%}else{ %>
				<a href="snsListAction.sns?page=<%=nowPage-1 %>">[이전]</a>&nbsp;
			<%} %>
	
			<%for(int a=startPage;a<=endPage;a++){
					if(a==nowPage){%>
				[<%=a%>]&nbsp;&nbsp;
			<%}else{ %>
				<a href="snsListAction.sns?page=<%=a%>">[<%=a%>]
				</a>&nbsp;
			<%} %>
			<%} %>
			<%if(nowPage>=maxPage){ %>
				[다음]
			<%}else{ %>
				<a href="snsListAction.sns?page=<%=nowPage+1 %>">[다음]</a>
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
<script>
$(function(){
	/* 좋아요 버튼 눌렀을 때 바로 DB작업하기*/
	$(".buttonlike").click(function(){  
		//버튼 div의 value값으로 feed_id를 넣어놨음
		var feed_id= $(this).attr("value");
		var cust_id= $("input:hidden[name=cust_id]").val();
		if(cust_id==undefined){
			alert("좋아요를 이용하시려면 로그인을 실행해주세요");
		}else{ //아직 좋아요버튼을 누르지 않은 상태일때
			$.ajax({
				url : "snsHeartAction.sns?feed_id="+feed_id+"&cust_id="+cust_id,  
				dataType : "html",
				//data : "post",
				success : function(check){
					alert("좋아요 완료");
				}
			});
			var src1 = $(this).attr("src");
			//alert(src1);
			if(src1=="img/sns/heart-fill.png"){
				$(this).attr("src","img/sns/heart-add-line.png");
			}else{
				$(this).attr("src","img/sns/heart-fill.png");
			}
		}
	});
});
</script>
<!-- footer -->
<footer>
	<jsp:include page="footer.jsp" />
</footer>
</body>
</html>