<%@page import="dto.PageInfo"%>
<%@page import="dto.Feed"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dto.Post_house"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head> <!--문서정보-->
	<meta charset="utf-8">
	<title>  </title>
	<link rel="stylesheet" type="text/css" href="style/community.css">
</head> 
<style>
/*전체구조*/
#title{text-align: center;     margin-top: 30px;    height: 30px;}
#snsthunbnail ul{width : 1280px; margin : 10px auto; font-family: 'NanumSquare';}
#snsthunbnail li{display: inline-block; width: 370px; height: 500px;  border: 1px solid white; margin: 25px; overflow: hidden; 
			 box-shadow: 0 1px 3px rgba(0,0,0,0.12), 0 1px 2px rgba(0,0,0,0.24);
 			 transition: all 0.3s cubic-bezier(.25,.8,.25,1); border-radius: 10px;}
			/*height를 650을 주면 사진크기가 370*450정도롤 들어갈 수 있긴 한데 전체적으로 너무 길어보여서..*/
#snsthunbnail li:hover{ box-shadow: 0 14px 18px rgba(29, 31, 25, 0.23), 0 10px 10px rgba(29, 31, 25, 0.23);}
#topmiddle{position:relative; top:-80px;}	
#writing{position: relative; top: -100px;  left: 583px;width: 100px;height: 40px; background-color:#C0C0C0; border-radius: 5px;}
		
/*박스 안의 세부구조*/
.snstitle{width: 95%; height: 10%; border: 1px solid white; margin: 10px auto 0 auto; }
.thumbnail{width: 350px; height: 70%;  border: 1px solid white; margin: 10px auto 0 auto; overflow: hidden;}
			/* 사진이 잘리는 크기와 일치하기 때문에, 이 css와 WriteAction의 BufferdImage()내의 값은 동일할 것 */
.thumbnail>img{object-fit:cover; border-radius: 5px;}
.txt{width: 95%; height: 10%; border: 1px solid white; margin: 10px auto 0 auto; }

/*회원사진,아이디*/
.snstitle .custpic{float: left; width: 50px; height: 100%; overflow:hidden; background-color:#C0C0C0; border-radius: 50%;}
.snstitle span{position: relative; top:29%; left: 3%;}

/*해시테그, 조회수, 좋아요*/
.txt .read{height: 85%; overflow: hidden;}
.txt .buttonlike{z-index:10; float: right; width: 25px; height: 25px; /*background-color:#C0C0C0; border-radius: 50%;*/}
.txt .buttonfollow{float: right; width: 25px; height: 25px;}

</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script src="js/community.js"></script>
<%
	/* SnsListAction 에서 setAttribute 설정해둔 것 가져오기 */
	Post_house po = (Post_house) request.getAttribute("post_house");
	ArrayList<Feed> articleList = (ArrayList<Feed>) request.getAttribute("articleList");

%>
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
	<div id="backwrap">
	    <div class="wrap">	
		    <section>
		    	<a href="../community/select_read.jsp?post_id=<%=po.getPost_id()%>">
		    	<div id="main">
		    		<ul>
		    			<li ><div id="main_overflow"><img src="../community/postPics/<%=po.getPost_pics()%>" class="main_pic"></div></li>
		    			<li>
		    				<div id="slider">
								<a href="#" class="control_next">>></a>
								<a href="#" class="control_prev"><<</a>
								<ul>
								    <li><img src="../community/postPics/<%=po.getPost_pics()%>" class="main_banner_pic"></li>
								    <li><img src="../community/postPics/<%=po.getPost_pic2()%>" class="main_banner_pic"></li>
								    <li><img src="../community/postPics/<%=po.getPost_pic3()%>" class="main_banner_pic"></li>
								    <li><img src="../community/postPics/<%=po.getPost_pic4()%>" class="main_banner_pic"></li>
								 </ul>  
							</div> 
		    			</li>
		    		</ul>
		    		<ul id="main_pic_id">
		    			<li><img src="img/community/pics/901.png" class="main_cust_pic"> </li>
		    			<li class="main_cust_id"><a href="#"><%=po.getCust_id()%></a></li>
		    		</ul>
		    		<div id="main_title"><%=po.getPost_title()%> </div>
			    </div>
			    </a>
		    </section>
		    <section>
	    		<div id="midtitle">
	    			이번주의 가장 인기있는 피드
	    		</div>
<!-- 		    		<div class="wrap"> -->
<!-- 						<div class="tabs"> -->
<!-- 							<input type="radio" id="radio-1"  name="tabs" checked /> -->
<!-- 							<label class="tab" for="radio-1"> -->
<!-- 								<img src="../community/img/community/png/fullscreen-fill.png"> 모든분위기</label> -->
<!-- 							<input type="radio" id="radio-2" name="tabs"/> -->
<!-- 							<label class="tab" for="radio-2"> -->
<!-- 								<img src="../community/img/community/png/stop-line.png">미니멀&심플</label> -->
<!-- 							<input type="radio" id="radio-3"  name="tabs"/> -->
<!-- 							<label class="tab" for="radio-3"> -->
<!-- 								<img src="../community/img/community/png/plant-line.png">내추럴</label> -->
<!-- 							<input type="radio" id="radio-4" name="tabs" /> -->
<!-- 							<label class="tab" for="radio-4"> -->
<!-- 								<img src="../community/img/community/png/global-line.png">북유럽</label> -->
<!-- 							<input type="radio" id="radio-5"  name="tabs"/> -->
<!-- 							<label class="tab" for="radio-5"> -->
<!-- 								<img src="../community/img/community/png/seedling-line.png">빈티지</label> -->
<!-- 							<input type="radio" id="radio-6" name="tabs" /> -->
<!-- 							<label class="tab" for="radio-6"> -->
<!-- 								<img src="../community/img/community/png/rainbow-line.png">유니크</label> -->
<!-- 							<input type="radio" id="radio-7" name="tabs" /> -->
<!-- 							<label class="tab" for="radio-7"> -->
<!-- 								<img src="../community/img/community/png/sun-line.png">프렌치</label> -->
<!-- 							<input type="radio" id="radio-8" name="tabs" /> -->
<!-- 							<label class="tab" for="radio-8"> -->
<!-- 								<img src="../community/img/community/png/mist-fill.png">믹스매치</label> -->
<!-- 							<input type="radio" id="radio-9" name="tabs" /> -->
<!-- 							<label class="tab" for="radio-9"> -->
<!-- 								<img src="../community/img/community/png/ancient-pavilion-line.png">한옥</label> -->
<!-- 							<span class="glider"></span> -->
<!-- 						</div> -->
<!-- 					</div>   -->
		    </section>
		    <div id="snsthunbnail">				
				<ul>
					<%
						for(int i=0;i<articleList.size();i++){
							if(i==0){
							%>
							<!-- 1열1행 -->
							<li style="font-family: 'NanumSquare';">
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
	    </div>
<!-- 	    <aside> -->
<!-- 	    	<div><a href="#logo"><img src="img/community/png/arrow-up-circle-line.png"><br>&nbsp&nbsp맨위로</a></div> -->
<!-- 	    </aside> -->
   	</div>
    <!-- footer -->
	<footer>
		<jsp:include page="footer.jsp" />
	</footer>	 

</body>
</html>