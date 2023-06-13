<%@page import="dto.Post_house"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dto.PageInfo"%>
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
	String cust_id= request.getParameter("cust_id");
	alist = house.selectBookmarkList(pages,limit,cust_id); //로그인되어있으면 좋아요정보까지 가져오는 메소드 연결
	int listCount = alist.size();				 // listCount = 내가 북마크를 누른 북마크 글 수
	
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
	
	/*path를 세팅하기 위해 ActionForward class의 객체 생성*/
	//response.sendRedirect("view_board.jsp");
	RequestDispatcher dispatcher=request.getRequestDispatcher("view_board.jsp");
	dispatcher.forward(request, response);
%>
</body>
</html>