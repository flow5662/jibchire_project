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
.req{margin:0 auto;}
.cust_Resection{
width: 1280px;
margin: 10px auto;
}
.cust_section{
padding-top:20px;
padding-bottom:20px;
width:700px;
margin:0 auto;
}
.list{
  display: flex;
  align-items: center;
  flex-direction: column;
}
.article_section{
	    display: grid;
    grid-template-columns: repeat(1, 1fr);
    padding-bottom: 50px;
        width: 800px;
}
.cust{
display: flex;
align-items: center;
gap: 10pt;
height: 62.5px;
border: 1px solid lightgray;
}
.cust-text{
    background-color: lightgray;
    height: 100%;
   width: 100px;
    /* text-align: center; */
    display: flex;
    align-items: center;
    justify-content: center;
}
.not-found{
display: flex;
    height: 150px;
    flex-direction: column;
    justify-content: center;
}
.duplication{padding: 30px 0px;}
</style>
<body>
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
	<div class="list"><h3>-- 질문항목 --</h3></div>
	<c:forEach items="${bachi_req_det}" var="i">
<div class="cust"><div class="cust-text"><h4>카테고리</h4></div>${i.gosu_menu1} / ${i.gosu_menu2}</div>
<div class="cust"><div class="cust-text"><h4>목적</h4></div>${i.est_q1}</div>
<div class="cust"><div class="cust-text"><h4>장소</h4></div>${i.est_q2}</div>
<div class="cust"><div class="cust-text"><h4>유형</h4></div>${i.est_q3}</div>
	</c:forEach>
	</div>
	
	<div class="list"><h3>-- 답변완료 --</h3></div>
	
	<c:if test="${empty bachi_ans_det == null}"><div class="not-found">답변이 아직 없습니다.</div></c:if>
<div class="article_section">
<c:forEach items="${bachi_req_ans}" var="i">
<div class="duplication">
<div class="cust"><div class="cust-text"><h4>답변자 아이디</h4></div>${i.cust_id}</div>
<div class="cust"><div class="cust-text"><h4>목적</h4></div>${i.est_a1}</div>
<div class="cust"><div class="cust-text"><h4>장소</h4></div>${i.est_a2}</div>
<div class="cust"><div class="cust-text"><h4>유형</h4></div>${i.est_a3}</div>
<div class="cust"><div class="cust-text"><h4>답변일자</h4></div>${i.const_date}</div>
</div>
</c:forEach>

</div>
	
	
</div>
</div>
	
 </div>
   <div style="margin-left: auto; margin-right: auto;">
<jsp:include page="footer.jsp" />
</div>
</div>

</body>

</html>