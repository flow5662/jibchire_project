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
			<input type="hidden" name="cust_id" value="<%=id%>">
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
							<li>
								<a href="snsReadAction.sns?feed_id=<%=articleList.get(i).getFeed_id()%>&cust_id=<%=id%>&feed_writer=<%=articleList.get(i).getCust_id()%>">	
								  	<!-- 타이틀. 회원사진과 아이디 -->
								  	<div class='snstitle'>
								  		<div class="custpic"><img src="feedPics/<%=articleList.get(i).getCust_pic()%>"  onerror="this.src='../sns/img/sns/profile04.jpg'" style="width: 50px; height: 50px;"> </div>
								  		<span>작성자 <%=articleList.get(i).getCust_id() %></span></div>
									<div class='thumbnail'><img src='feedPics/sm_<%=articleList.get(i).getFeed_pics() %>' onerror="this.src='feedPics/<%=articleList.get(i).getFeed_pics() %>'"   style="width: 350px; height: 350px;"> </div>
								</a>
								<!-- 내용공간. hashtag, 조회수 -->
								<div class='txt'>
									<!-- 팔로우 버튼. 이미 팔로우 누른 피드는 초록색 아이콘, 안누른 피드는 검은라인 아이콘 -->
									<%
										String follow = articleList.get(i).getFollow_time();
										if(follow==null){
											%><img src="img/sns/user-unfollow-line.png" class="buttonfollow" value="<%=articleList.get(i).getCust_id()%>"><%
										}else{
											%><img src="img/sns/user-follow-fill.png" class="buttonfollow" value="<%=articleList.get(i).getCust_id()%>"><%
										}
									%>
									<!-- 좋아요 버튼. 이미 좋아요 누른 피드는 빨간색 하트, 좋아요 안누른 피드는 검은라인 하트 -->
									<% 
										String like= articleList.get(i).getLike_time();
										if(like==null){
											%><img src="img/sns/heart-add-line.png" class="buttonlike" value="<%=articleList.get(i).getFeed_id()%>"><%
										}else{
											%><img src="img/sns/heart-fill.png" class="buttonlike" value="<%=articleList.get(i).getFeed_id()%>"><%
										}
									%>
									<!-- <img src="img/sns/heart-add-line.png" class="buttonlike" value="<%=articleList.get(i).getFeed_id()%>"> -->
									<div class="read"><%=articleList.get(i).getFeed_hashtag()%>
										<br><pre><%=articleList.get(i).getFeed_txt() %></pre>
									</div>

								</div>
							</li>
							<!-- 검색창 및 메뉴가 들어갈 1행2열 여기서 집어넣기 -->
							<li style="width: 370px; height: 420px;" id="topmiddle">
								<form action="snsSearchAction.sns">
									<div id="search">
										<div id="search-box">
											<input type="text" id="search-txt" name="snsSearchWord" placeholder="#hashtag">
								     		<a class="search-btn" href="snsSearchAction.sns">
									        	<input type="submit" id="search-btn" value="GO">
									        	<!-- form/submit태그로 값을 넘겨보자<i class="fas fa-search"></i> -->
								     		</a>
							     		</div>
						     		</div>
					     		</form>
					     		<div id ="dungdung">
						     		<a href="snsSearchAction.sns?snsSearchWord=레시피" id="dung">#레시피</a>
								    <a href="snsSearchAction.sns?snsSearchWord=인테리어" id="dung1">#인테리어</a>
								    <a href="snsSearchAction.sns?snsSearchWord=바치후기" id="dung2">#바치후기</a>
								    <a href="snsSearchAction.sns?snsSearchWord=일상" id="dung3">#일상</a>
								    <a href="snsSearchAction.sns?snsSearchWord=DIY" id="dung4">#DIY</a>
							    </div>
							</li> 
							<%	
							}else if(i==3 || i==6){
							%>
							<!-- 2행2열, 3행2열 중앙에 위치 다름 -->
							<li style="position: relative; top: -80px;">
								<a href="snsReadAction.sns?feed_id=<%=articleList.get(i).getFeed_id()%>&cust_id=<%=id%>&feed_writer=<%=articleList.get(i).getCust_id()%>">	
								  	<!-- 타이틀. 회원사진과 아이디 -->
								  	<div class='snstitle'>
								  		<div class="custpic"><img src="feedPics/<%=articleList.get(i).getCust_pic()%>"  onerror="this.src='../sns/img/sns/profile04.jpg'" style="width: 50px; height: 50px;"> </div>
								  		<span>작성자 <%=articleList.get(i).getCust_id() %></span></div>
									<div class='thumbnail'><img src='feedPics/sm_<%=articleList.get(i).getFeed_pics() %>'  onerror="this.src='feedPics/<%=articleList.get(i).getFeed_pics() %>'"   style="width: 350px; height: 350px;"> </div>
								</a>	
								<!-- 내용공간. hashtag, 조회수 -->
								<div class='txt'>
									<!-- 팔로우 버튼. 이미 팔로우 누른 피드는 초록색 아이콘, 안누른 피드는 검은라인 아이콘 -->
									<%
										String follow = articleList.get(i).getFollow_time();
										if(follow==null){
											%><img src="img/sns/user-unfollow-line.png" class="buttonfollow" value="<%=articleList.get(i).getCust_id()%>"><%
										}else{
											%><img src="img/sns/user-follow-fill.png" class="buttonfollow" value="<%=articleList.get(i).getCust_id()%>"><%
										}
									%>
									<!-- 좋아요 버튼 -->
									<% 
										String like= articleList.get(i).getLike_time();
										if(like==null){
											%><img src="img/sns/heart-add-line.png" class="buttonlike" value="<%=articleList.get(i).getFeed_id()%>"><%
										}else{
											%><img src="img/sns/heart-fill.png" class="buttonlike" value="<%=articleList.get(i).getFeed_id()%>"><%
										}
									%>
									<div class="read"><%=articleList.get(i).getFeed_hashtag()%>
										<br><%=articleList.get(i).getFeed_txt() %>
									</div>
								</div>
							</li> 
							<% 	
							}else{
							%>
							<!-- 나머지 칸 -->
							<li>
								<a href="snsReadAction.sns?feed_id=<%=articleList.get(i).getFeed_id()%>&cust_id=<%=id%>&feed_writer=<%=articleList.get(i).getCust_id()%>">	
								  	<!-- 타이틀. 회원사진과 아이디 -->
								  	<div class='snstitle'>
								  		<div class="custpic"><img src="feedPics/<%=articleList.get(i).getCust_pic()%>"   onerror="this.src='../sns/img/sns/profile04.jpg'" style="width: 50px; height: 50px;"></div>
								  		<span>작성자 <%=articleList.get(i).getCust_id() %></span></div>
									<div class='thumbnail'><img src='feedPics/sm_<%=articleList.get(i).getFeed_pics() %>' onerror="this.src='feedPics/<%=articleList.get(i).getFeed_pics() %>'"   style="width: 350px; height: 350px;"> </div>
								</a>	
								<!-- 내용공간. hashtag, 조회수 -->
								<div class='txt'>
									<!-- 팔로우 버튼. 이미 팔로우 누른 피드는 초록색 아이콘, 안누른 피드는 검은라인 아이콘 -->
									<%
										String follow = articleList.get(i).getFollow_time();
										if(follow==null){
											%><img src="img/sns/user-unfollow-line.png" class="buttonfollow" value="<%=articleList.get(i).getCust_id()%>"><%
										}else{
											%><img src="img/sns/user-follow-fill.png" class="buttonfollow" value="<%=articleList.get(i).getCust_id()%>"><%
										}
									%>
									<!-- 좋아요 -->
									<% 
										String like= articleList.get(i).getLike_time();
										if(like==null){
											%><img src="img/sns/heart-add-line.png" class="buttonlike" value="<%=articleList.get(i).getFeed_id()%>"><%
										}else{
											%><img src="img/sns/heart-fill.png" class="buttonlike" value="<%=articleList.get(i).getFeed_id()%>"><%
										}
									%>
									<div class="read"><%=articleList.get(i).getFeed_hashtag()%>
										<br><%=articleList.get(i).getFeed_txt() %>
									</div>
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
			<section id="emptyArea"><br><br>등록된 글이 없습니다.</section>
			<%
			}
			%>
		<!-- 글쓰기버튼 -->
<!-- 		<section>  -->
<%-- 			<% //로그인한 상태면 글쓰기 버튼 보이게 할 것 --%>
<!-- // 				String id2 = (String) session.getAttribute("ID"); -->
<!-- // 				if(!(id2==null)){ -->
<%-- 			%> --%>
<!-- 			    <input type="button" value="글쓰기" onclick="location.href='snsWrite.jsp'" id="writing"> -->
<%-- 		    <%  } 	 --%>
<%-- 		    %>  --%>
<!-- 		</section> -->
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
					//alert("");
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

	/* 팔로우 버튼 눌렀을 때 바로 DB작업하기*/
	$(".buttonfollow").click(function(){  
		//버튼 div의 value값으로 feed_id를 넣어놨음
		var cust_following= $(this).attr("value");   //로그인 한 사람이 팔로잉하는 아이디
		var cust_id= $("input:hidden[name=cust_id]").val();  //로그인 한 사람의 아이디
		if(cust_id==undefined){
			alert("팔로우를 이용하시려면 로그인을 실행해주세요");
		}else{ //아직 좋아요버튼을 누르지 않은 상태일때
			$.ajax({
				url : "snsFollowAction.sns?cust_following="+cust_following+"&cust_id="+cust_id,  
				dataType : "html",
				//data : "post",
				success : function(check){
					//alert("");
				}
			});
		//내가 누른 버튼의 아이콘 변경. 그리고 같은 글쓴이를 공유하고 있는 다른 버튼들도 팔로우 버튼 자동적으로 변경 
		var src1 = $(this).attr("src");
		if(src1=="img/sns/user-unfollow-line.png"){
			$(this).attr("src","img/sns/user-follow-fill.png");
			$(".buttonfollow[value="+cust_following+"]").attr("src","img/sns/user-follow-fill.png");
		}else{
			$(this).attr("src","img/sns/user-unfollow-line.png");
			$(".buttonfollow[value="+cust_following+"]").attr("src","img/sns/user-unfollow-line.png");
		}
		}
	});
	
	/*마우스 올렸을 때 이미지 살짝 커지게 하기*/
	$("img").mouseenter(function(){
		$(this).css("scale","1.05");
		$(this).css("transition","all 0.3s cubic-bezier(.25,.8,.25,1)");
		$(this).css("cursor","pointer");
	});
	$("img").mouseleave(function(){
		$(this).css("scale","1.0");
	});
	

});
</script>
<!-- footer -->
<footer>
	<jsp:include page="footer.jsp" />
</footer>
</body>
</html>