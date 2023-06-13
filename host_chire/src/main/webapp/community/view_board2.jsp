<%@page import="dto.PageInfo"%>
<%@ page import="dao.CmtHousewarming" %>
<%@ page import="dto.Post_house" %>
<%@ page import="java.util.ArrayList" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>게시판 메인화면</title>
		<link rel="stylesheet" type="text/css" href="style/view_board.css">
		<!-- 데이터 처리 기능인 Create(생성), Read(읽기), Update(갱신), Delete(삭제)를 묶어서 일컫는 말이다. -->
	</head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>

<!-- 게시판 메인화면을 위한 전체 데이터 셀렉-->
<%

	ArrayList<Post_house> alist = (ArrayList<Post_house>) request.getAttribute("articleList");
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
		<input type="hidden" name="cust_id" value="<%=id%>">
	<%
		}
	%>
	</header>
    <div id="wrap">
    <div class="subtitle">이번주 가장 북마크가 많이 눌린 집들이</div>
   	<%
	if(alist != null && listCount > 0){
	%>
	    <div id="list">
	    	<ul>
	    		<%  
    			for(int i=0; i<3; i++){   //한 줄에 세 칸을 넣을	
    			%>
	    		<li>
	    			<a href = "view_read.jsp?post_id=<%=alist.get(i).getPost_id() %>">
	    				<!-- data 직접 집어넣어서 따로 썸네일 만들지 않고있음, postPics/sm_ 라는 루트가 다름
	    				<div class="thumbnail"> <img src="postPics/sm_%=alist.get(i).getPost_pics() %>"></div> -->
		    			<div class="thumbnail"> <img src="postPics/<%=alist.get(i).getPost_pics() %>"></div>
		    			<div class="title"><%=alist.get(i).getPost_title() %>  </div>
	    			</a>
	    				<!-- 북마크 버튼 -->
	    				<% 
							String bookmark= alist.get(i).getBookmark_time();
							if(bookmark==null){
								%><img src="img/community/png/bookmark-line.png" class="bookmark" value="<%=alist.get(i).getPost_id()%>"><%
							}else{
								%><img src="img/community/png/bookmark-2-fill.png" class="bookmark" value="<%=alist.get(i).getPost_id()%>"><%
							}
						%>
		    			<!-- <img src="img/community/png/book-mark-fill.png" class="bookmark" value=""> -->
		    			<div class="writer"><%=alist.get(i).getCust_id() %> </div>
	    			<div class="view">조회수<%=alist.get(i).getPost_read() %> </div>
	    		</li>
    			<%		
    			
    			}
	    		%>
	    	</ul>
	    </div>
	
			<%
			}
			else
			{
			%>
			<section id="emptyArea">등록된 글이 없습니다.</section>
			<%
			}
			%>
					
	   
	       	<%
	if(alist != null && listCount > 0){
	%>
	    <!-- 참고) section style 분류 탭 : jsp:include page="tap_style.jsp" -->    	
    	<!-- 메뉴 분류 탭 주거형태 방 개수, 집 평수, 가족인원수, 집 연식-->
		<div class="subtitle">최근 집들이</div>
			<!-- section style 분류 탭-->
			<section>
		    	<article id="mid">
		    		<div class="wrap">
						<div class="tabs">
							<input type="radio" id="radio-1"  name="tabs" checked />
							<label class="tab" for="radio-1">
								<img src="img/community/png/fullscreen-fill.png"> black </label>
							<input type="radio" id="radio-2" name="tabs"/>
							<label class="tab" for="radio-2">
								<img src="img/community/png/stop-line.png"> white</label>
							<input type="radio" id="radio-3"  name="tabs"/>
							<label class="tab" for="radio-3">
								<img src="img/community/png/plant-line.png">beige</label>
							<input type="radio" id="radio-4" name="tabs" />
							<label class="tab" for="radio-4">
								<img src="img/community/png/global-line.png">yellow</label>
							<input type="radio" id="radio-5"  name="tabs"/>
							<label class="tab" for="radio-5">
								<img src="img/community/png/seedling-line.png">brown</label>
							<input type="radio" id="radio-6" name="tabs" />
							<label class="tab" for="radio-6">
								<img src="img/community/png/rainbow-line.png">red</label>
							<input type="radio" id="radio-7" name="tabs" />
							<label class="tab" for="radio-7">
								<img src="img/community/png/sun-line.png">green</label>
							<input type="radio" id="radio-8" name="tabs" />
							<label class="tab" for="radio-8">
								<img src="img/community/png/mist-fill.png">blue</label>
							<input type="radio" id="radio-9" name="tabs" />
							<label class="tab" for="radio-9">
								<img src="img/community/png/ancient-pavilion-line.png">purple</label>
							<span class="glider"></span>
						</div>
					</div>  
		        </article>	
		    </section>
	    
	    <div id="list">
	    	<ul>
	    		<%  
    			for(int i=0; i<alist.size(); i++){   //한 줄에 세 칸을 넣을	
    			%>
	    		<li>
	    			<a href = "view_read.jsp?post_id=<%=alist.get(i).getPost_id() %>">
		    			<!-- data 직접 집어넣어서 따로 썸네일 만들지 않고있음, postPics/sm_ 라는 루트가 다름
	    				<div class="thumbnail"> <img src="postPics/sm_%=alist.get(i).getPost_pics() %>"></div> -->
		    			<div class="thumbnail"> <img src="postPics/<%=alist.get(i).getPost_pics() %>"></div>
		    			<div class="title"><%=alist.get(i).getPost_title() %>  </div>
	    			</a>
	    				<!-- 북마크 버튼 -->
	    				<% 
							String bookmark= alist.get(i).getBookmark_time();
							if(bookmark==null){
								%><img src="img/community/png/bookmark-line.png" class="bookmark" value="<%=alist.get(i).getPost_id()%>"><%
							}else{
								%><img src="img/community/png/bookmark-2-fill.png" class="bookmark" value="<%=alist.get(i).getPost_id()%>"><%
							}
						%>
		    			<!-- <img src="img/community/png/book-mark-fill.png" class="bookmark" value=""> -->
		    			<div class="writer"><%=alist.get(i).getCust_id() %> </div>
	    			<div class="view">조회수<%=alist.get(i).getPost_read() %></div>
	    		</li>
    			<%		
    			
    			}
	    		%>
	    	</ul>
	    </div>
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
	 </div>
	 </div>				
<script type="text/javascript">
$(function(){
	/* 북마크 버튼 눌렀을 때 바로 DB작업하기*/
	$(".bookmark").click(function(){  
		//버튼 div의 value값으로 feed_id를 넣어놨음
		var post_id= $(this).attr("value");
		//alert(post_id);
		var cust_id= $("input:hidden[name=cust_id]").val();
		if(cust_id==undefined){
			alert("북마크를 이용하시려면 로그인을 실행해주세요");
		}else{ 
			$.ajax({
				url : "insert_bookmark.jsp?post_id="+post_id+"&cust_id="+cust_id,  
				dataType : "html",
				//data : "post",
				success : function(check){
					//alert("북마크 완료");
				}
			});
			var src1 = $(this).attr("src");
			//alert(src1);
			if(src1=="img/community/png/bookmark-line.png"){
				$(this).attr("src","img/community/png/bookmark-2-fill.png");
			}else{
				$(this).attr("src","img/community/png/bookmark-line.png");
			}
		}
	});
	
	/*select 메뉴*/
	const label = document.querySelectorAll('.label');

	label.forEach(function(lb){
	    lb.addEventListener('click', e => {
	        let optionList = lb.nextElementSibling;
	        let optionItems = optionList.querySelectorAll('.optionItem');
	        clickLabel(lb, optionItems);
	    })
	});
	const clickLabel = (lb, optionItems) => {
	    if(lb.parentNode.classList.contains('active')) {
	        lb.parentNode.classList.remove('active');
	        optionItems.forEach((opt) => {
	            opt.removeEventListener('click', () => {
	                handleSelect(lb, opt)
	            })
	        })
	    } else {
	        lb.parentNode.classList.add('active');
	        optionItems.forEach((opt) => {
	            opt.addEventListener('click', () => {
	                handleSelect(lb, opt)
	            })
	        })
	    }
	}
	const handleSelect = (label, item) => {
	    label.innerHTML = item.textContent;
	    label.parentNode.classList.remove('active');
	}

	$("img").mouseenter(function(){
		$(this).css("scale","1.05");
		$(this).css("cursor","pointer");
	});
	$("img").mouseleave(function(){
		$(this).css("scale","1.0");
	});
	$(".optionList1 .optionItem").click(function(){
		var record = $(this).attr("value");
		var field = $(".optionList1").attr("value");
		var cust_id= $("input:hidden[name=cust_id]").val();
		alert(field);
		location.href= "select_board_list.jsp?field="+field+"&menuword="+record+"&cust_id="+cust_id;
	});
	$(".optionList2 .optionItem").click(function(){
		var record = $(this).attr("value");
		var field = $(".optionList2").attr("value");
		var cust_id= $("input:hidden[name=cust_id]").val();
		alert(field);
		location.href= "select_board_list.jsp?field="+field+"&menuword="+record+"&cust_id="+cust_id;
	});
	$(".optionList3 .optionItem").click(function(){
		var record = $(this).attr("value");
		var field = $(".optionList3").attr("value");
		var cust_id= $("input:hidden[name=cust_id]").val();
		alert(field);
		location.href= "select_board_list.jsp?field="+field+"&menuword="+record+"&cust_id="+cust_id;
	});
	$(".optionList4 .optionItem").click(function(){
		var record = $(this).attr("value");
		var field = $(".optionList4").attr("value");
		var cust_id= $("input:hidden[name=cust_id]").val();
		alert(field);
		location.href= "select_board_list.jsp?field="+field+"&menuword="+record+"&cust_id="+cust_id;
	});
	$(".optionList5 .optionItem").click(function(){
		var record = $(this).attr("value");
		var field = $(".optionList5").attr("value");
		var cust_id= $("input:hidden[name=cust_id]").val();
		alert(field);
		location.href= "select_board_list.jsp?field="+field+"&menuword="+record+"&cust_id="+cust_id;
	});
	$(".optionList6 .optionItem").click(function(){
		var record = $(this).attr("value");
		var field = $(".optionList6").attr("value");
		var cust_id= $("input:hidden[name=cust_id]").val();
		alert(field);
		location.href= "select_board_list.jsp?field="+field+"&menuword="+record+"&cust_id="+cust_id;
	});
	$(".optionList7 .optionItem").click(function(){
		var record = $(this).attr("value");
		var field = $(".optionList7").attr("value");
		var cust_id= $("input:hidden[name=cust_id]").val();
		alert(field);
		location.href= "select_board_list.jsp?field="+field+"&menuword="+record+"&cust_id="+cust_id;
	});
	
});
</script>
	<!-- footer -->
	<footer>
		<jsp:include page="footer.jsp" />
	</footer>
</body>
</html>