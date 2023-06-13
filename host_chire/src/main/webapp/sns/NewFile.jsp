<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>

#dung{color:skyblue; position:relative; top:150px; left:300px; animation:dungdung1 1s infinite alternate; }
#dung1{color:skyblue; position:relative; top:130px; left:280px; animation:dungdung1 2s infinite alternate; }
#dung2{color:skyblue; position:relative; top:140px; left:340px; animation:dungdung1 1s infinite alternate; }
#dung3{color:skyblue; position:relative; top:135px; left:380px; animation:dungdung2 2s infinite alternate; }
#dung4{color:skyblue; position:relative; top:156px; left:260px; animation:dungdung2 3s infinite alternate; }
@keyframes dungdung1{
   0%{transform:translate(0,0);}
   100%{transform:translate(0,100px);}
}
@keyframes dungdung2{
   0%{transform:translate(0,0);}
   100%{transform:translate(0,80px);}
}    
 
</style> 

<body>
<%
	Date nowDate = new Date();
	SimpleDateFormat ss = new SimpleDateFormat("MMM d, aaa hh:mm ");
	ss.format(nowDate);
	out.println(ss.format(nowDate));
	//'11', '2', '2023-04-10 10:40:25'

%>

 <a href="index.jsp" id="dung">#레시피</a>
  <a href="index.jsp" id="dung1">#인테리어</a>
   <a href="index.jsp" id="dung2">#바치후기</a>
    <a href="index.jsp" id="dung3">#일상</a>
     <a href="index.jsp" id="dung4">#DIY</a>

</body>
</html>