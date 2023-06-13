<%@page import="dao.CmtHousewarming"%>
<%@ page import="dto.Post_house" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
	request.setCharacterEncoding("utf-8");
	%>
	<%
	CmtHousewarming com = new CmtHousewarming();  
	Post_house post = new Post_house();
	//값을 담을 객체 생성
	//out.println(request.getParameter("post_title")+" 잘넘어감?"); 값이 잘 넘어왔는지 확인
	int post_id = Integer.parseInt(request.getParameter("post_id"));
	post.setPost_id(post_id);
	//게시글 번호를 바탕으로 글을 수정해야 하기 때문에 반드시 들어가야 함

	post.setPost_title(request.getParameter("post_title"));
	post.setPost_txt(request.getParameter("post_txt"));
	post.setPost_house(request.getParameter("post_house"));
	post.setPost_family(request.getParameter("post_family"));
	post.setPost_direc(request.getParameter("post_direc"));
	post.setPost_region(request.getParameter("post_region"));
	post.setPost_pet(request.getParameter("post_pet"));
// 	post.setPost_style(request.getParameter("post_style"));
	post.setPost_color(request.getParameter("post_color"));
	//post.setPost_pics(request.getParameter("post_pics")); 사진등록은 나중에 더 배울 것
	
	String syear = request.getParameter("post_startdate_year");
	String smonth = request.getParameter("post_startdate_month");
	String sdate = request.getParameter("post_startdate_date");
	String eyear = request.getParameter("post_enddate_year");
	String emonth = request.getParameter("post_enddate_month");
	String edate = request.getParameter("post_enddate_date");
	//날짜 값 깔끔하게 합치려고 변수에 넣음
	post.setPost_startdate(syear+smonth+sdate);
	post.setPost_enddate(eyear+emonth+edate);
	//변수 값 합쳐서 메소드에 보내기
	int rooms = Integer.parseInt(request.getParameter("post_rooms"));
	int m2 = Integer.parseInt(request.getParameter("post_m2"));
	int fam = Integer.parseInt(request.getParameter("post_fam"));
	int houseold = Integer.parseInt(request.getParameter("post_houseold"));
	int budget = Integer.parseInt(request.getParameter("post_budget"));
	//int값인 변수 변환	
	post.setPost_rooms(rooms);
	post.setPost_m2(m2);
	post.setPost_fam(fam);
	post.setPost_houseold(houseold);
	post.setPost_budget(budget);
	
	com.update_board(post);
	//게시글 내용을 insert하는 method 호출 
	response.sendRedirect("view_board.jsp");
	//글쓰기 완료하면 메인화면으로 넘어감
	%>

</body>
</html>