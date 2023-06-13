<%@page import="dto.PageInfo"%>
<%@page import="dto.Bachi_match_Been"%>
<%@page import="action.BachiMatchCateAction"%>
<%@ page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    ArrayList<Bachi_match_Been> article_match = (ArrayList<Bachi_match_Been>)request.getAttribute("match_been");
    PageInfo pageInfo = (PageInfo)request.getAttribute("pageInfo");
	int listCount=pageInfo.getListCount();
	int nowPage=pageInfo.getPage();
	int maxPage=pageInfo.getMaxPage();
	int startPage=pageInfo.getStartPage();
	int endPage=pageInfo.getEndPage();
	
	String gosu_menu1 = request.getParameter("gosu_menu1");
	String gosu_menu2 = request.getParameter("gosu_menu2");
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>견적답변</title>
</head>
<link rel="stylesheet" type="text/css" href="style/bachi_match_req.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<style>
.menu_section{
    display: flex;
    align-items: center;
    width: 1280px;
    margin: 0 auto;
}
#gosu_menu{
padding-top: 50px;
}

</style>

<body>
	
	   <!-- 헤더 -->
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
	
	<div class="menu_section">
	<!-- ajax select영역 -->
	<div id="gosu_menu"></div>
	</div>
	
	<div class= "list_section">
	
	
	
	<div class="list">
	<table>
	<tr><th style="
    width: 180px;
    height: 90px;
">아이디</th><th style="
    width: 160px;
">대분류 카테고리</th><th style="width: 190px;">중분류 카테고리</th><th style="width: 200px;">목적</th><th style="
    width: 200px;
">장소</th><th style="
    width: 200px;
">유형</th>
<th style="width: 200px;">답변여부</th>
</tr>
		<!-- 견적리스트, 선택하여 상세 안에서 답변을 줄 수 있음.  -->
		<!-- 구글맵으로 된다면 반경 내 설정으로 바꿀예정. -->
		<!-- 활동가능지역을 기준으로 삼음 -->

<% 
	
	if(article_match != null){
		for(int i=0;i<article_match.size();i++){
			%>
			<tr class="user"> 
			<%
			String serverImagePath = request.getContextPath() + "/cust/sm_" + article_match.get(i).getCust_pic();
			
			%>
			<td ><a href="bachi_match_req_s.bc?est_id=<%=article_match.get(i).getEst_id()%>"><div class="user-info"><img src=<%=serverImagePath%> style=""><h5><%=article_match.get(i).getCust_id()%></h5></div></a></td>
			<td><a href="bachi_match_req_s.bc?est_id=<%=article_match.get(i).getEst_id()%>"><%=article_match.get(i).getGosu_menu1() %></a></td>
			<td><a href="bachi_match_req_s.bc?est_id=<%=article_match.get(i).getEst_id()%>"><%=article_match.get(i).getGosu_menu2() %></a></td>
			<td><a href="bachi_match_req_s.bc?est_id=<%=article_match.get(i).getEst_id()%>"><%=article_match.get(i).getEst_q1()%></a></td>
			<td><a href="bachi_match_req_s.bc?est_id=<%=article_match.get(i).getEst_id()%>"><%=article_match.get(i).getEst_q2()%></a></td>
			<td><a href="bachi_match_req_s.bc?est_id=<%=article_match.get(i).getEst_id()%>"><%=article_match.get(i).getEst_q3() %></a></td>
			<td>
			<%
			if(article_match.get(i).getEst_id() == article_match.get(i).getAns_est_id()){
				out.print("<font style='color:#6464ad;'>답변완료</font>");
			}else{
				out.print("답변대기중");
			}
			%>
			</td>
			</tr>
			<%
			}
			if(article_match.size() == 0){
			%> <tr> <td colspan="7">결과값이 없습니다. 다시 검색을 시도해보세요.</td> </tr><%
			}
		}else{
		%>
		<tr>
		<td colspan="7"> 데이터가 존재하지 않습니다. </td>
		</tr>
		<%
		}
		%>


</table>
</div>

<!-- 페이징 수정요망 -->
	<section id="pageList">
		<%if(nowPage<=1){ %>
		◀
		<%}else{ %>
		<a href="bachi_match_req.bc?page=<%=nowPage-1 %>">◀</a>
		<%} %>

		<%for(int a=startPage;a<=endPage;a++){
				if(a==nowPage){%>
		<a href="bachi_match_req.bc?page=<%=a %>"><%=a %></a>
		<%}else{ %>
		<a href="bachi_match_req.bc?page=<%=a %>"><%=a %>
		</a>
		<%} %>
		<%} %>

		<%if(nowPage>=maxPage){ %>
		▶
		<%}else{ %>
		<a href="bachi_match_req.bc?page=<%=nowPage+1 %>">▶</a>
		<%} %>
	</section>
</div>


    <div style="margin-left: auto; margin-right: auto;">
<jsp:include page="footer.jsp" />
</div>
</body>
<script>
$(document).ready(function(){
	$.ajax({
		url : "bachi_match_cate.bc" ,
		dataType : "html",
		type : "post",
		// 이동하고있는게 눈에 보이는 것 뿐
		// 중요한 역할들을 가지고 있지는 않음(html 타입변환)
		success: function(re){ //매개변수
			$("#gosu_menu").html(re);
			
		} 
	});
	
	var cust_id = "<%=id%>"; 
	//로그인을 하지 않았을때 강제적으로 탈출시키는 스크립트
	if(cust_id === "null"){
		alert("해당 권한이 없습니다.");
		history.back(); //이전 화면으로 되돌아가게끔 구현
	}else{
        $.ajax({ // gosu_info에 등록되지 않은 아이디일 경우면 권한아예 없음
        	//원래 목록 화면에 보이지않지만 링크 직접 들어갈 경우 권한 처리
            url : "bachi_select_id.bc",
            data : {cust_id: "<%=id %>" },
            type : "post",
            success: function(result){    
                if(result === "true"){ //true => 바치 등록이 안된 것
                	alert("해당 권한이 없습니다.");
            		history.back(); //이전 화면으로 되돌아가게끔 구현
                }
            }
    });
}
	

});


</script>

</html>