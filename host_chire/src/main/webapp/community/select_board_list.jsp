<%@page import="dto.PageInfo"%>
<%@page import="dto.Post_house"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.CmtHousewarming"%>
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
	String menuword = request.getParameter("menuword");
	CmtHousewarming sl = new CmtHousewarming();
	
	ArrayList<Post_house> alist=new ArrayList<Post_house>();
	
	/*페이지 기본 값 세팅하기*/
	int pages= 1;  //jsp 특성상 page라는 변수가 duplicate하여 사용할 수 없음
 	int limit=9;		
	if(request.getParameter("page")!=null){ 
		pages=Integer.parseInt(request.getParameter("page"));
		//page가 1일경우의 설정이지만, page가 2,3 등등으로 넘어갈때는 page의 값을 앞장에서 넘겨받은 "page"의 값으로 설정한다
		//snsList.jsp에서 2페이지, 3페이지를 각각 클릭할때 a href = ~~.bo?page= ~~ 이런식으로 넘겨줄 것
	}
	
	/*필요 기능에 따라 메소드 호출*/
	CmtHousewarming house = new CmtHousewarming();
	int listCount = house.selectListCount();				 // listCount = feed테이블의 행 수
	
	/*로그인 되어있으면 북마크 정보까지 가져오기, 로그인 안되어있으면 전체정보만 가져오기*/
	String cust_id= request.getParameter("cust_id");
	if(cust_id==null){
		alist = house.selectSearchList(pages,limit,menuword);    // articleList = feed테이블에 저장되어 있는 모든 값
	}else {
		alist = house.selectLoginSearchList(pages,limit,menuword,cust_id); //로그인되어있으면 좋아요정보까지 가져오는 메소드 연결
	}
	
	/* 페이징을 하는 거의 공식과 같은 문장들 */
	int maxPage=(int)((double)listCount/limit+0.95); // 15/10+0.95=2.45, maxPage=2
	int startPage = (((int) ((double)pages / 10 + 0.9)) - 1) * 10 + 1;
    int endPage = startPage+10-1;
    
   /*페이징*/
	if (endPage> maxPage) endPage= maxPage;
	
	PageInfo pageInfo = new PageInfo();
	pageInfo.setEndPage(endPage);
	pageInfo.setListCount(listCount);
	pageInfo.setMaxPage(maxPage);
	pageInfo.setPage(pages);
	pageInfo.setStartPage(startPage);	
	
	/*snsList.jsp 에서 이 값들을 사용하기 위해서 setAttribute로 객체를 세팅*/
	request.setAttribute("pageInfo", pageInfo);  // "pageInfo"라는 key값에 pageInfo라는 객체를 value값으로 넣음
	request.setAttribute("articleList", alist);
	request.setAttribute("color",menuword);
	
	
	/*path를 세팅하기 위해 ActionForward class의 객체 생성*/
	//response.sendRedirect("view_board.jsp");
	RequestDispatcher dispatcher=request.getRequestDispatcher("view_board.jsp");
	dispatcher.forward(request, response);
%>
</body>
</html>