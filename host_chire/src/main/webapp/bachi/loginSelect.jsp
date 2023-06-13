<%@ page language="java" contentType="text/html;charset=utf-8" pageEncoding="utf-8" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title></title>
</head>
<body>
	<%
	   	request.setCharacterEncoding("utf-8"); 
		String id = request.getParameter("cust_id");
		String pw = request.getParameter("cust_pw");
		
		/* null값은 아예 넘어오지 않기 때문에 주석처리했어요
		if(id == null || pw == null) {
			response.sendRedirect("login.jsp");
		}*/

		Connection conn = null;
		Statement stmt = null;

		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn = DriverManager.getConnection("jdbc:mysql://43.201.98.55:3306/interior", "minji", "1234");
			if(conn == null) {
				throw new Exception("데이터베이스에 연결할 수 없습니다.");
			}
			stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery("select cust_pw from cust_info where cust_id = '"+ id +"';");

			String pw2 = "";

			while(rs.next()) {
				pw2 = rs.getString("cust_pw");
			}

			if(pw.equals(pw2)) {
				//로그인 되었을 때 alert 하도록 수정
				out.println("<script> alert('로그인 되었습니다')"); 
				session.setAttribute("ID",id); 
				out.println("document.location.href = 'snsIndexList.sns' </script>");
			}else {
		%>
			<script type="text/javascript">
				alert("가입되지 않은 아이디이거나, 잘못된 비밀번호입니다.");
				history.go(-1);
			</script>
		<%
			}
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			try{
	            if(stmt != null){
	                stmt.close();
	            }
	         }catch (Exception ignored){}
	         try{
	            if(conn != null){
	                conn.close();
	            }
	         }catch (Exception ignored){}
	    }
	%>
</body>
</html>