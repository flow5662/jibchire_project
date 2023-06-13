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
   response.setCharacterEncoding("utf-8");
   response.setContentType("text/html;charset=utf-8");

   String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	//request.setAttribute("ID",id);                    
	//request.setAttribute("PW",pw);

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
			ResultSet rs = stmt.executeQuery("select*from cust_info where cust_id='"+id+"';");
			if(!rs.next()){
				out.println("<script> alert('해당하는 아이디가 없습니다')");
				out.println("document.location.href = 'login.jsp' </script>");
				//response.sendRedirect("cust_info4.jsp"); 이렇게 페이지 이동시키려고 했는데 위의 방법이 더 확실 !
				//throw new Exception("아이디("+id+")에 해당하는 데이터가 없습니다.");

			}
			else{
				String cust_id = rs.getString("cust_id");
				String cust_pw = rs.getString("cust_pw");
				if(id.equals(cust_id) && pw.equals(cust_pw)){							
						out.println("<script> alert('로그인 되었습니다')"); 
						session.setAttribute("ID",id); // 아이디와 비밀번호가 일치한 순간 session에 값을 넣어주고, 글수정/글삭제가 가능하도록 한다
						out.println("document.location.href = 'snsIndexList.sns' </script>"); //로그인하면 이동할 페이지 넣기
				}else if(id.equals(cust_id) && !pw.equals(cust_pw)){
					out.println("<script> alert('아이디와 비밀번호가 일치하지 않습니다')");
					out.println("document.location.href = 'login.jsp' </script>");
					// 아이디와 비밀번호가 일치하지 않는 기능은 좀 더 손봐야 할 것 같다.
				}
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