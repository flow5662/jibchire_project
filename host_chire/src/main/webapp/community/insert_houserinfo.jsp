<%@page import="dao.CmtHousewarming"%>
<%@ page import="dto.Cust_houseinfo" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<!-- 회원가입이나 다른창에서 고객이 자신에 맞는 정보를 얻기 위해 집에대한 정보를 입력한 데이터를 insert하기위한 공간 -->
<body>
	<%
	request.setCharacterEncoding("utf-8");
	%>
	<%
	CmtHousewarming com = new CmtHousewarming();  
	//dao 호출
	Cust_houseinfo cust = new Cust_houseinfo();
	//값을 담을 객체 생성
	
	String id= (String) session.getAttribute("ID"); 
	//로그인되어있는 세션아이디값 가져오기
	cust.setCust_id(id);	
	cust.setCust_house(request.getParameter("post_house"));
	
	int room = Integer.parseInt(request.getParameter("post_rooms"));
	int m2 = Integer.parseInt(request.getParameter("post_m2"));
	int fam = Integer.parseInt(request.getParameter("post_fam"));
	int houseold = Integer.parseInt(request.getParameter("post_houseold"));
	/*int형 변환해서 데이터 넣기*/
	cust.setCust_room(room);
	cust.setCust_m2(m2);
	cust.setCust_fam(fam);
	cust.setCust_houseold(houseold);
	
	cust.setCust_family(request.getParameter("post_house"));
	cust.setCust_direc(request.getParameter("post_house"));
	cust.setCust_pet(request.getParameter("post_house"));
	String region1 = request.getParameter("post_region");
	String region2 = request.getParameter("post_region2");
	cust.setCust_region(region1+region2);
	
	com.insert_houseinfo(cust);
	//게시글 내용을 insert하는 method 호출 
	response.sendRedirect("view_board.jsp");
	//완료 완료하면 메인화면으로 넘어감
	%>

</body>
</html>