<%@page import="dto.PageInfo"%>
<%@page import="dto.Bachi_market"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:useBean id="market" class="dao.Gosu_mark">
<%
//페이징을 위한 jsp 페이지

int pages=1; 
int limit=9; //9개씩 노출

if(request.getParameter("page")!=null){ //가져온 page가 null이 아닐 경우
	pages=Integer.parseInt(request.getParameter("page")); //page값을 갱신함
}
int listcount = market.count_list(); //출력될 게시물의 수

ArrayList<Bachi_market> market_list = market.gosu_mark_sel(pages,limit); //db에서 list가져옴
/*페이징 공식*/
int maxpage = (int)((double)listcount/limit+0.95); 
int startpage = (((int) ((double)pages / 10 + 0.9)) - 1) * 10 + 1; 
int endpage = startpage+9;

if(endpage>maxpage) endpage = maxpage;

PageInfo pageInfo = new PageInfo(); //페이징 객체 생성
pageInfo.setEndPage(endpage); //각 객체에 담아주기
pageInfo.setListCount(listcount);
pageInfo.setMaxPage(maxpage);
pageInfo.setPage(pages);
pageInfo.setStartPage(startpage);
request.setAttribute("pageInfo",pageInfo); //마켓에서 사용하기 위함(getter)
request.setAttribute("market_list",market_list); //마켓에서 사용할 때 이것으로 불러올 수 있도록 함

request.getRequestDispatcher("bachi_market_cust.jsp").forward(request, response);


%>
</jsp:useBean>


</body>
</html>