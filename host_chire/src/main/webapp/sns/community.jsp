<%@page import="dto.Post_house"%>
<%@page import="dto.PageInfo"%>
<%@page import="dto.Feed"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head> <!--문서정보-->
	<meta charset="utf-8">
	<title>  </title>
	<link rel="stylesheet" type="text/css" href="style/community.css">
</head> 
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script src="js/community.js"></script>
<%
	/* SnsListAction 에서 setAttribute 설정해둔 것 가져오기 */
	Post_house post_house = (Post_house) request.getAttribute("post_house");
	ArrayList<Feed> articleList = (ArrayList<Feed>) request.getAttribute("articleList");
    PageInfo pageInfo = (PageInfo)request.getAttribute("pageInfo");
	// "pageInfo"라는 key값에 pageInfo라는 객체를 value값으로 넣었기 때문에 getAttribute할때도 객체로의 형변환이 필요한 것. 
	int listCount=pageInfo.getListCount();
	int nowPage=pageInfo.getPage();
	int maxPage=pageInfo.getMaxPage();
	int startPage=pageInfo.getStartPage();
	int endPage=pageInfo.getEndPage();
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
		    	<div id="main">
		    		<ul>
		    			<li ><div id="main_overflow"><img src="img/community/pics/501.jpg" class="main_pic"></div></li>
		    			<li>
		    				<div id="slider">
								<a href="#" class="control_next">>></a>
								<a href="#" class="control_prev"><<</a>
								<ul>
								    <li><img src="img/community/pics/301.jpg" class="main_banner_pic"></li>
								    <li><img src="img/community/pics/302.jpg" class="main_banner_pic"></li>
								    <li><img src="img/community/pics/303.jpg" class="main_banner_pic"></li>
								    <li><img src="img/community/pics/304.jpg" class="main_banner_pic"></li>
								 </ul>  
							</div> 
		    			</li>
		    		</ul>
		    		<ul id="main_pic_id">
		    			<li><img src="img/community/pics/901.png" class="main_cust_pic"> </li>
		    			<li class="main_cust_id"><a href="#">계정_아이디</a></li>
		    		</ul>
		    		<div id="main_title"> 보라색으로 포인트를 준 거실 </div>
			    </div>
		    </section>
		    <section>
		    	<article id="mid">
		    		<div id="midtitle">
		    			공간 분위기 더 확인하기 asdasd
		    		</div>
		    		<div class="wrap">
						<div class="tabs">
							<input type="radio" id="radio-1"  name="tabs" checked />
							<label class="tab" for="radio-1">
								<img src="img/community/png/fullscreen-fill.png"> 모든분위기</label>
							<input type="radio" id="radio-2" name="tabs"/>
							<label class="tab" for="radio-2">
								<img src="img/community/png/stop-line.png">미니멀&심플</label>
							<input type="radio" id="radio-3"  name="tabs"/>
							<label class="tab" for="radio-3">
								<img src="img/community/png/plant-line.png">내추럴</label>
							<input type="radio" id="radio-4" name="tabs" />
							<label class="tab" for="radio-4">
								<img src="img/community/png/global-line.png">북유럽</label>
							<input type="radio" id="radio-5"  name="tabs"/>
							<label class="tab" for="radio-5">
								<img src="img/community/png/seedling-line.png">빈티지</label>
							<input type="radio" id="radio-6" name="tabs" />
							<label class="tab" for="radio-6">
								<img src="img/community/png/rainbow-line.png">유니크</label>
							<input type="radio" id="radio-7" name="tabs" />
							<label class="tab" for="radio-7">
								<img src="img/community/png/sun-line.png">프렌치</label>
							<input type="radio" id="radio-8" name="tabs" />
							<label class="tab" for="radio-8">
								<img src="img/community/png/mist-fill.png">믹스매치</label>
							<input type="radio" id="radio-9" name="tabs" />
							<label class="tab" for="radio-9">
								<img src="img/community/png/ancient-pavilion-line.png">한옥</label>
							<span class="glider"></span>
						</div>
					</div>  
		        </article>	
		    </section>
		    <section>
			    <div id="row1">
			    	<ul>
		    			<li><div class="pic_overflow"><img src="img/community/pics/112.jpg" class="pic"> 
			    			<ul class="pic_id">
				    			<li><img src="img/community/pics/901.png" class="cust_pic"> </li>
				    			<li class="cust_id"> 계정아이디 </li>
				    		</ul>
				    		<div>
					    		<div id="pro1-1_icon"><img src="img/community/png/green-button.png"></div>
					    		<div id="pro1-1_box"> 
					    			<div id="box_item"><img src="img/community/pics/701.jpg"></div>
					    			<ul>
					    				<li class="box_brand">포홈</li>
					    				<li class="box_name">포레스트그린 소파</li>
					    				<li class="box_price">199,000</li>
					    			</ul>
					    			<div id="box_arrow"><img src="img/community/png/arrow-right-line.png"> </div>
					    		</div>
					    	</div>
					    	</div>		    	
				    	</li>
		    			<li><div class="f_midpic_overflow"><img src="img/community/pics/113.jpg" class="f_midpic"> 
		    				<ul class="pic_id">
				    			<li><img src="img/community/pics/901.png" class="cust_pic"> </li>
				    			<li class="cust_id"> 계정아이디 </li>
				    		</ul>
				    		<div>
					    		<div id="pro1-2_icon"><img src="img/community/png/green-button.png"></div>
					    		<div id="pro1-2_box"> 
					    			<div id="box_item"><img src="img/community/pics/702.jpg"></div>
					    			<ul>
					    				<li class="box_brand">까사미아</li>
					    				<li class="box_name">로즈골드 액자 프레임</li>
					    				<li class="box_price">19,800</li>
					    			</ul>
					    			<div id="box_arrow"><img src="img/community/png/arrow-right-line.png"> </div>
					    		</div>
					    	</div>
					    </div>
		    			</li>
		    			<li><div class="pic_overflow"><img src="img/community/pics/125.jpg" class="pic"> 
		    				<ul class="pic_id">
				    			<li><img src="img/community/pics/901.png" class="cust_pic"> </li>
				    			<li class="cust_id"> 계정아이디 </li>
				    		</ul>
				    		<div>
					    		<div id="pro1-3_icon"><img src="img/community/png/green-button.png"></div>
					    		<div id="pro1-3_box"> 
					    			<div id="box_item"><img src="img/community/pics/703.jpg"></div>
					    			<ul>
					    				<li class="box_brand">LG생활건강</li>
					    				<li class="box_name">인테리어필름</li>
					    				<li class="box_price">5,900~</li>
					    			</ul>
					    			<div id="box_arrow"><img src="img/community/png/arrow-right-line.png"> </div>
					    		</div>
					    	</div>
					    </div>
		    			</li>
		    		</ul>
		    	</div>
		    </section>
	    	<section>
		    	<div id="row2">
		    		<ul>
		    			<li><div class="pic_overflow"><img src="img/community/pics/115.jpg" class="pic"> 
		    				<ul class="pic_id">
				    			<li><img src="img/community/pics/901.png" class="cust_pic"> </li>
				    			<li class="cust_id"> 계정아이디 </li>
				    		</ul>
				    		<div>
					    		<div id="pro2-1_icon"><img src="img/community/png/green-button.png"></div>
					    		<div id="pro2-1_box"> 
					    			<div id="box_item"><img src="img/community/pics/704.jpg"></div>
					    			<ul>
					    				<li class="box_brand">까사미아</li>
					    				<li class="box_name">브루노 원형거울</li>
					    				<li class="box_price">98,000~</li>
					    			</ul>
					    			<div id="box_arrow"><img src="img/community/png/arrow-right-line.png"> </div>
					    		</div>
					    	</div>
					    </div>
		    			</li>
		    			<li><div class="midpic_overflow"><img src="img/community/pics/116.jpg" class="midpic">
		    				<ul class="mid_pic_id">
				    			<li><img src="img/community/pics/901.png" class="cust_pic"> </li>
				    			<li class="cust_id"> 계정아이디 </li>
				    		</ul>
				    		<div>
					    		<div id="pro2-2_icon"><img src="img/community/png/green-button.png"></div>
					    		<div id="pro2-2_box"> 
					    			<div id="box_item"><img src="img/community/pics/705.jpg"></div>
					    			<ul>
					    				<li class="box_brand">한스전자</li>
					    				<li class="box_name">전기벽난로</li>
					    				<li class="box_price">1,180,000</li>
					    			</ul>
					    			<div id="box_arrow"><img src="img/community/png/arrow-right-line.png"> </div>
					    		</div>
					    	</div>
				    	</div> 
		    			</li>
		    			<li><div class="pic_overflow"><img src="img/community/pics/117.jpg" class="pic">
		    				<ul class="pic_id">
				    			<li><img src="img/community/pics/901.png" class="cust_pic"> </li>
				    			<li class="cust_id"> 계정아이디 </li>
				    		</ul>
				    		<div>
					    		<div id="pro2-3_icon"><img src="img/community/png/green-button.png"></div>
					    		<div id="pro2-3_box"> 
					    			<div id="box_item"><img src="img/community/pics/706.jpg"></div>
					    			<ul>
					    				<li class="box_brand">까사미아</li>
					    				<li class="box_name">공간분리형 가벽</li>
					    				<li class="box_price">11,200</li>
					    			</ul>
					    			<div id="box_arrow"><img src="img/community/png/arrow-right-line.png"> </div>
					    		</div>
					    	</div>
					    </div>
		    			</li>
		    		</ul>
			    </div>
		    </section>
		    <section>
			    <div id="row3">
			    	<ul>
		    			<li><div class="pic_overflow"><img src="img/community/pics/124.jpg" class="pic">
		    				<ul class="pic_id">
				    			<li><img src="img/community/pics/901.png" class="cust_pic"> </li>
				    			<li class="cust_id"> 계정아이디 </li>
				    		</ul>
				    		<div>
					    		<div id="pro3-1_icon"><img src="img/community/png/green-button.png"></div>
					    		<div id="pro3-1_box"> 
					    			<div id="box_item"><img src="img/community/pics/707.jpg"></div>
					    			<ul>
					    				<li class="box_brand">이태리토분(블랙)</li>
					    				<li class="box_name">무광블랙 화분</li>
					    				<li class="box_price">48,500원~</li>
					    			</ul>
					    			<div id="box_arrow"><img src="img/community/png/arrow-right-line.png"> </div>
					    		</div>
					    	</div>
					    </div>
		    			</li>
		    			<li><div class="midpic_overflow"><img src="img/community/pics/119.jpg" class="midpic"> 
		    				<ul class="mid_pic_id">
				    			<li><img src="img/community/pics/901.png" class="cust_pic"> </li>
				    			<li class="cust_id"> 계정아이디 </li>
				    		</ul>
				    		<div>
					    		<div id="pro3-2_icon"><img src="img/community/png/green-button.png"></div>
					    		<div id="pro3-2_box"> 
					    			<div id="box_item"><img src="img/community/pics/708.jpg"></div>
					    			<ul>
					    				<li class="box_brand">리바트</li>
					    				<li class="box_name">원형식탁세트</li>
					    				<li class="box_price">422,000</li>
					    			</ul>
					    			<div id="box_arrow"><img src="img/community/png/arrow-right-line.png"> </div>
					    		</div>
					    	</div>
					    </div>
		    			</li>
		    			<li><div class="pic_overflow"><img src="img/community/pics/120.jpg" class="pic"> 
		    				<ul class="pic_id">
				    			<li><img src="img/community/pics/901.png" class="cust_pic"> </li>
				    			<li class="cust_id"> 계정아이디 </li>
				    		</ul>
				    		<div>
					    		<div id="pro3-3_icon"><img src="img/community/png/green-button.png"></div>
					    		<div id="pro3-3_box"> 
					    			<div id="box_item"><img src="img/community/pics/709.jpg"></div>
					    			<ul>
					    				<li class="box_brand">메종</li>
					    				<li class="box_name">대형 인테리어 화분커버</li>
					    				<li class="box_price">155,000</li>
					    			</ul>
					    			<div id="box_arrow"><img src="img/community/png/arrow-right-line.png"> </div>
					    		</div>
					    	</div>
					    </div>
		    			</li>
		    		</ul>
		    	</div>
	    	</section>
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