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
		<link rel="stylesheet" type="text/css" href="style/myRecommend.css">
		<!-- 데이터 처리 기능인 Create(생성), Read(읽기), Update(갱신), Delete(삭제)를 묶어서 일컫는 말이다. -->
	</head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>

<!-- 게시판 메인화면을 위한 전체 데이터 셀렉-->
<%
	ArrayList<Post_house> alist = (ArrayList<Post_house>) request.getAttribute("houselist");
	ArrayList<Post_house> flist = (ArrayList<Post_house>) request.getAttribute("familylist");
	ArrayList<Post_house> clist = (ArrayList<Post_house>) request.getAttribute("custfamilylist");
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
   	<%
	if(alist != null){
	%>
	     <div class="list">
<%-- 	     	<h2> <%=alist.get(0).getCust_id()%>님과 동일하게 주거형태:'<%=alist.get(0).getPost_family()%>',  집평수: '<%=alist.get(0).getPost_m2()%>', 방개수: '<%=alist.get(0).getPost_rooms()%>' 인 공간 </h2> --%>
	    	<ul>
	    		<%  
    			for(int i=0; i<alist.size(); i++){   //한 줄에 세 칸을 넣을	
    			%>
	    		<li>
	    			<a href = "../community/select_read.jsp?post_id=<%=alist.get(i).getPost_id() %>">
		    			<!-- data 직접 집어넣어서 따로 썸네일 만들지 않고있음, postPics/sm_ 라는 루트가 다름
	    				<div class="thumbnail"> <img src="postPics/sm_%=alist.get(i).getPost_pics() %>"></div> -->
		    			<div class="thumbnail"> <img src="../community/postPics/sm_<%=alist.get(i).getPost_pics()%>" onerror="this.src='../community/postPics/<%=alist.get(i).getPost_pics()%>'" ></div>
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
		<%
		}
		else
		{
		%>
		<section class="emptyArea">주거형태 집평수 방개수가 정확히 일치하는 글이 없습니다.</section>
		<%
		}
		%>
		
	<%
	if(flist != null){
	%>
	     <div class="list">
	     	<h2> ii) 가족인원수 가족형태  </h2>
	    	<ul>
	    		<%  
    			for(int i=0; i<flist.size(); i++){   //한 줄에 세 칸을 넣을	
    			%>
	    		<li>
	    			<a href = "../community/select_read.jsp?post_id=<%=flist.get(i).getPost_id() %>">
		    			<!-- data 직접 집어넣어서 따로 썸네일 만들지 않고있음, postPics/sm_ 라는 루트가 다름
	    				<div class="thumbnail"> <img src="postPics/sm_%=flist.get(i).getPost_pics() %>"></div> -->
		    			<div class="thumbnail"> <img src="../community/postPics/sm_<%=flist.get(i).getPost_pics()%>" onerror="this.src='../community/postPics/<%=flist.get(i).getPost_pics()%>'" ></div>
		    			<div class="title"><%=flist.get(i).getPost_title() %>  </div>
	    			</a>
	    				<!-- 북마크 버튼 -->
	    				<% 
							String bookmark= flist.get(i).getBookmark_time();
							if(bookmark==null){
								%><img src="img/community/png/bookmark-line.png" class="bookmark" value="<%=flist.get(i).getPost_id()%>"><%
							}else{
								%><img src="img/community/png/bookmark-2-fill.png" class="bookmark" value="<%=flist.get(i).getPost_id()%>"><%
							}
						%>
		    			<!-- <img src="img/community/png/book-mark-fill.png" class="bookmark" value=""> -->
		    			<div class="writer"><%=flist.get(i).getCust_id() %> </div>
	    			<div class="view">조회수<%=flist.get(i).getPost_read() %></div>
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
		<section class="emptyArea">가족인원수 가족형태 가 정확히 일치하는 글이 없습니다.</section>
		<%
		}
		%>
	<%
	if(clist != null){
	%>
	     <div class="list">
	     	<h2> iii)성별 가족형태</h2>
	    	<ul>
	    		<%  
    			for(int i=0; i<clist.size(); i++){   //한 줄에 세 칸을 넣을	
    			%>
	    		<li>
	    			<a href = "../community/select_read.jsp?post_id=<%=clist.get(i).getPost_id() %>">
		    			<!-- data 직접 집어넣어서 따로 썸네일 만들지 않고있음, postPics/sm_ 라는 루트가 다름
	    				<div class="thumbnail"> <img src="postPics/sm_%=clist.get(i).getPost_pics() %>"></div> -->
		    			<div class="thumbnail"> <img src="../community/postPics/sm_<%=clist.get(i).getPost_pics()%>" onerror="this.src='../community/postPics/<%=clist.get(i).getPost_pics()%>'" ></div>
		    			<div class="title"><%=clist.get(i).getPost_title() %>  </div>
	    			</a>
	    				<!-- 북마크 버튼 -->
	    				<% 
							String bookmark= clist.get(i).getBookmark_time();
							if(bookmark==null){
								%><img src="img/community/png/bookmark-line.png" class="bookmark" value="<%=clist.get(i).getPost_id()%>"><%
							}else{
								%><img src="img/community/png/bookmark-2-fill.png" class="bookmark" value="<%=clist.get(i).getPost_id()%>"><%
							}
						%>
		    			<!-- <img src="img/community/png/book-mark-fill.png" class="bookmark" value=""> -->
		    			<div class="writer"><%=clist.get(i).getCust_id() %> </div>
	    			<div class="view">조회수<%=clist.get(i).getPost_read() %></div>
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
		<section class="emptyArea">주거형태 집평수 방개수가 정확히 일치하는 글이 없습니다.</section>
		<%
		}
		%>		
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
	
});
</script>
	<!-- footer -->
	<footer>
		<jsp:include page="footer.jsp" />
	</footer>
</body>
</html>