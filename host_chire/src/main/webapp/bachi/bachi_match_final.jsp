<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
.matching{
width:1280px;
margin: 0 auto;
padding-top:20px;
}
.match_text{
    display: flex;
    flex-direction: column;
    align-items: center;
}
.final-btn{
display: flex;
gap:10px;
    justify-content: center;
  align-items: center;
      padding-top: 50px;
}
.matching input[type="button"]{
width:100px;
height: 40px;
background-color: #789849;
color: white;
border: none;
border-radius: 8px;
} 
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
	<section>
	<div class="matching">
	<div class="match_text">

	<h2>정상적으로 요청되었습니다!<br>
	바치들과의 빠른 매칭을 기원합니다!</h2>
	</div>
		<div class="final-btn">
	<input type="button" onclick="location.href='bachi_main.jsp'" value="메인화면">
	<input type="button" onclick="location.href='bachi_match-home.bc'" value="받은 답변보기">
	</div>
	</div>
	</section>
	
	
	    <div style="margin-left: auto; margin-right: auto;">
<jsp:include page="footer.jsp" />
</div>
	
	
	
	</div>

</body>
</html>