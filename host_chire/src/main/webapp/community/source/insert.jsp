<%@ page language="java" contentType="text/html;charset=utf-8" pageEncoding="utf-8" %> 

<%@ page import = "java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>  </title>
</head> 
<body> <!-- 모든 조건을 만족한 회원가입이 완료되면 데이터베이스에 insert하는 역할 -->
	<%
		request.setCharacterEncoding("utf-8"); 

		String icon1 = request.getParameter("icon1");
		String icon2 = request.getParameter("icon2");
		String icon3 = request.getParameter("icon3");
		
		out.println(icon1);
		out.println(icon2);
		out.println(icon3);
		out.println();
		
// 		Connection conn = null;
// 		Statement stmt = null;

// 		try{
// 			Class.forName("com.mysql.jdbc.Driver");
// 			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/interior","root","1111");
// 			if(conn == null)
// 				throw new Exception("데이터베이스에 연결할 수 없습니다.");
// 			stmt = conn.createStatement();
// 			String inst = String.format("insert into cust_info (cust_id, cust_pw, cust_name, cust_birth, cust_adr, cust_phn, cust_email, cust_pic, cust_sex) values('%s', '%s', '%s', '%s','%s', '%s', '%s', '%s','%s');",cust_id,cust_pw2,cust_name,year+month+date,cust_adr2+cust_adr3,cust_phn_1+cust_phn_2,cust_email+"@"+emailadr+emailadr_input,cust_pic,cust_sex);
// 			stmt.executeUpdate(inst);
// 			//if(rowNum<1)
// 				//out.println("<script> alert('정상적으로 가입이 되지 않았습니다') </script>");
// 			//throw new Exception("데이터를 DB에 입력할 수 없습니다.");
// 			out.println("<script>  var cfm= confirm('가입이 완료되었습니다 로그인을 하시려면 확인버튼을 눌러주세요');"); 
// 				//confirm() 으로 해서 확인==> 로그인하러가기
// 			out.println(" if(cfm){ document.location.href = 'login.jsp';  }");
// 				//확인버튼 누르면 로그인페이지로 
// 			out.println("else{	document.location.href = 'index.jsp'; 	}</script>"); 		
// 				//취소버튼 누르면 회원가입페이지로
// 		} finally {
// 			try{
// 				stmt.close();
// 			}catch (Exception ignored) {

// 			}
// 			try{
// 				conn.close();
// 			}catch (Exception ignored){

// 			}
// 		}	
	%>

</body>
</html>