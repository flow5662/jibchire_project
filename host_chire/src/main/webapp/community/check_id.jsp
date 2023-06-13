<%@ page language="java" contentType="text/html;charset=utf-8" pageEncoding="utf-8" %> 
<%@ page import = "java.sql.*" %>
<!DOCTYPE html>
<html>
<head> <!--문서정보-->
	<meta charset="utf-8">
	<title>  </title>
</head> <!--문서내용-->
<% 
	request.setCharacterEncoding("utf-8"); 
	String id =  request.getParameter("cust_id"); 
%>
<body> <!-- 회원가입페이지에서 입력한 아이디를 바탕으로 중복확인 하는 페이지-->
	<%
		
		Connection conn = null;
		Statement stmt = null;
		try{
			Class.forName("com.mysql.cj.jdbc.Driver");    
			conn = DriverManager.getConnection("jdbc:mysql://43.201.98.55:3306/interior","minji","1234"); 
			if(conn==null)
				throw new Exception("데이터베이스에 접근할 수 없습니다.");
			stmt = conn.createStatement();	
			//out.println(id); 값 제대로 들어갔는지 확인
			ResultSet rs = stmt.executeQuery("select * from cust_info where cust_id='"+id+"';");
			if(!rs.next()){
				//out.println("<script> alert('사용능한 아이디입니다') </script>");
				out.println("사용 가능한 아이디입니다.");
			}else{
				//out.println("<script> alert('이미 존재하는 아이디입니다') </script>");
				out.println("사용 불가능한 아이디입니다.");
			}
		} finally {
			try{
				stmt.close();
			}catch (Exception ignored) {

			}
			try{
				conn.close();
			}catch (Exception ignored){

			}
		}
	%>
</body>
</html>