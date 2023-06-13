<%@page import="java.util.ArrayList"%>
<%@page import="dto.Bachi_match_Been"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>답변하기</title>
</head>
<link rel="stylesheet" type="text/css" href="style/bachi_match_req_s.css">
<style>
.cust-text{
    background-color: lightgray;
    height: 100%;
   width: 100px;
    /* text-align: center; */
    display: flex;
    align-items: center;
    justify-content: center;
}


</style>

<body>
<%
ArrayList<Bachi_match_Been> article_match = (ArrayList<Bachi_match_Been>)request.getAttribute("been");
String est_id = request.getParameter("est_id");

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
<div class="cust_Resection">
<div class="cust_section">
<div class="list">
<div class="article_section">

<% 
	if(article_match != null){
		for(int i=0;i<article_match.size();i++){
			%>	
			 
			<div class="cust"><div class="cust-text"><h4>요청고객</h4></div> <%=article_match.get(i).getCust_id()%></div>
			
			<div class="cust"><div class="cust-text"><h4>카테고리</h4></div><%=article_match.get(i).getGosu_menu1() %>/<%=article_match.get(i).getGosu_menu2() %></div>
			<div class="list"><h3>-- 질문항목 --</h3></div>
			
			<div class="cust"><div class="cust-text"><h4>목적</h4></div>
			<%=article_match.get(i).getEst_q1()%>
			</div>
			<div class="cust"><div class="cust-text"><h4>장소</h4></div>
			<%=article_match.get(i).getEst_q2()%>
			</div>
			<div class="cust"><div class="cust-text"><h4>유형</h4></div>
			<%=article_match.get(i).getEst_q3() %>
				</div>
			<div class="cust"><div class="cust-text"><h4>요청일자</h4></div>
			<%=article_match.get(i).getEst_q_date()%>
			</div>
			<div class="cust"><div class="cust-text"><h4>지역</h4></div>
			<%=article_match.get(i).getCust_adr()%>
			</div>
			
			<%
			}
		}
	%>
	</div>
	
	
<div class="ans">

<div class="list"><h3>-- 답변하기 --</h3></div>
<div class="article_section">
<form action="bachi_match_ans.bc">
<input type="hidden" name="est_id" value="<%=est_id%>">
<input type="hidden" name="cust_id" value="<%=id%>">
<div class="cust"><div class="cust-text"><h4>목적</h4></div> <input type="text" name="est_a1"></div>
<div class="cust"><div class="cust-text"><h4>장소</h4></div> <input type="text" name="est_a2"></div>
<div class="cust"><div class="cust-text"><h4>유형</h4></div><input type="text" name="est_a3"></div>
<!-- const_date, payment는 답변 이후에 같이 db에 (update)입력되도록 -->
<div class="list btn"><input type="submit" value="답변하기"></div>

</form>
</div>
</div>
</div>
 </div>
</div>
</div>
   <div style="margin-left: auto; margin-right: auto;">
<jsp:include page="footer.jsp" />
</div>

</body>
</html>