<%@page import="dto.Bachi_product"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>
<%
	request.setCharacterEncoding("utf-8"); 
	String id = request.getParameter("cust_id");


	Connection conn = null;
	Statement stmt = null;

	try {
		Class.forName("com.mysql.cj.jdbc.Driver");
		conn = DriverManager.getConnection("jdbc:mysql://43.201.98.55:3306/interior", "minji", "1234");
		if(conn == null) {
			throw new Exception("데이터베이스에 연결할 수 없습니다.");
		}
		stmt = conn.createStatement();
		ResultSet rs = stmt.executeQuery("select * from gosu_product where cust_id =  '"+ id +"';");
		
		
		
		while(rs.next()) {
			
			out.println("<option value='"+rs.getInt("gosu_id")+"'>"+rs.getString("gosu_title")+"</option>");
			
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
<%
	



%>

</body>
</html>