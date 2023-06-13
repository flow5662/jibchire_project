<%@page import="dto.PageInfo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
            <%request.setCharacterEncoding("utf-8");%>
   <%@page import="java.util.ArrayList"%>
    <%@page import="dto.Bachi_market"%>
     <%@page import="dto.Bachi_product"%>
     <%@page import="java.lang.*" %>
          <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
     <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
      <%request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<title>Insert title here</title>
</head>
<link rel="stylesheet" type="text/css" href="style/bachi_market_search.css">

<body>
<div class="wrap">
        <header>
    <% 
		request.setCharacterEncoding("utf-8"); 
		String id = (String) session.getAttribute("ID");  //session값에서 아이디 가져올 때 null이면 일반헤더, 아니면 로그인헤더
		if((id==null)){
	%>
		<jsp:include page="header.jsp" />
	<%
		}else{
	%>
		<jsp:include page="header_login.jsp" />
	<%
		}
	%>
	</header>
    <div class="market_section">
<jsp:useBean id="market" class="dao.Gosu_mark">

  <div class="css-page-head">
                <div class="page-title"><h1>바치 상점</h1></div>
          </div> 
           <form action="bachi_market_list_search.jsp">
           <div class="search_mark">
           
        <div class="input-group select-input css-select-box2">
		<select name="market_tag" class="css-select-box">
		<option value="all">전체</option> <!-- 아이디,게시글제목,게시글내용에 모두 포함하는 검색어 -->
		<option value="cust_id">아이디</option>
		<option value="market_title">게시글 제목</option>
		<option value="market_text">게시글 내용</option>
		</select>
		
		<span class="select-input__icon"><svg class="icon" width="10" height="10" preserveAspectRatio="xMidYMid meet" style="fill: currentcolor;"><path fill-rule="evenodd" d="M0 3l5 5 5-5z"></path></svg></span>
	</div>   	
		<input type="text" name="serch" class="css-search-text" placeholder="검색어를 입력하세요.">
		<input type="submit" value="검색" class="css-search-button">
		<div class="market_re">
		 <input type="button" onclick="location.href='bachi_market_re.jsp'" value="등록하기" class="css-search-button"></div>
		</div>

<div class="css-whide">

 
<%
String search = request.getParameter("serch"); //검색창
String value = request.getParameter("market_tag"); //전체/아이디 등 옵션


PageInfo pageInfo = (PageInfo)request.getAttribute("pageInfo");
int listCount=pageInfo.getListCount();
int nowPage = pageInfo.getPage();
int maxPage=pageInfo.getMaxPage();
int startPage=pageInfo.getStartPage();
int endPage=pageInfo.getEndPage();



ArrayList<Bachi_market> market_list = (ArrayList<Bachi_market>)request.getAttribute("market_list");


if(market_list.size() > 0) {
for(int i= 0;i < market_list.size();i++){
	
	//out.println("<tr><a href='bachi_market_det.jsp?market_id="+market_list.get(i).getMarket_id()+"'>");
	
			//out.println("<td id='cust_id'>"+"<a href='bachi_market_det.jsp?market_id="+market_list.get(i).getMarket_id()+"'>"+market_list.get(i).getCust_id()+"</td>");
			out.println("<div class='market'>");
			String serverImagePath = request.getContextPath() + "/bachi/bachi_market/sm_" + market_list.get(i).getMarket_picture();
			%>
			<a href='bachi_market_det_sel.jsp?market_id=<%=market_list.get(i).getMarket_id()%>'>
	    <img src='<%=serverImagePath%>' style='width:416px;height: 280px; border-radius:8px;'></a>
			<%
		 
			//out.println("<a href='bachi_market_det.jsp?market_id="+market_list.get(i).getMarket_id()+"'>"+"<img src='../"+market_list.get(i).getMarket_picture()+"' style='width:416px;height: 280px; border-radius:8px;'></a>");
			out.println("<div class='css-cate-gosu'>");
			out.println("<div class='css-category'><a href='bachi_market_det_sel.jsp?market_id="+market_list.get(i).getMarket_id()+"'>"+market_list.get(i).getGosu_menu1()+"/"+market_list.get(i).getGosu_menu2()+"</a></div>");
			out.println("<div class='css-gosu-id'><a href='bachi_market_det_sel.jsp?market_id="+market_list.get(i).getMarket_id()+"'>"+market_list.get(i).getCust_id()+"</a></div>");
			out.println("</div>");
			out.println("<h3>"+"<a href='bachi_market_det_sel.jsp?market_id="+market_list.get(i).getMarket_id()+"'>"+market_list.get(i).getMarket_title()+"</a></h3>");
			
			
			
			//out.println("<div class='css-price'><strong><font size='5pt'><a href='bachi_market_det.jsp?market_id="+market_list.get(i).getMarket_id()+"'>"+market_list.get(i).getGosu_price()+"원~</a></strong></font></div>");
			%>
		<div class='css-price'>
		<strong><font size='5pt'>
		<a href="bachi_market_det.jsp?market_id='<%=market_list.get(i).getMarket_id()%>'">
		<fmt:formatNumber value="<%=market_list.get(i).getGosu_price() %>" pattern="#,###"/>원~
		</a></strong></font></div>
		<%

			out.println("</div>");
				}
		}else{
			out.println("<div class='css-search-null'>");
			out.println("결과값이 없습니다.");
			out.println("</div>");
		}
out.println("</div>");


%>

<!-- 페이징 수정요망 -->
	<section id="pageList">
		<%if(nowPage<=1){ %>
		◀
		<%}else{ %>
		<a href="bachi_market_cust_search.jsp?market_tag=<%=value %>&serch=<%=search %>&page=<%=nowPage-1 %>">◀</a>
		<%} %>

		<%for(int a=startPage;a<=endPage;a++){
				if(a==nowPage){%>
		<a href="bachi_market_cust_search.jsp?market_tag=<%=value %>&serch=<%=search %>&page=<%=a %>"><%=a %></a>
		<%}else{ %>
		<a href="bachi_market_cust_search.jsp?market_tag=<%=value %>&serch=<%=search %>&page=<%=a %>"><%=a %>
		</a>
		<%} %>
		<%} %>

		<%if(nowPage>=maxPage){ %>
		▶
		<%}else{ %>
		<a href="bachi_market_cust_search.jsp?market_tag=<%=value %>&serch=<%=search %>&page=<%=nowPage+1 %>">▶</a>
		<%} %>
	</section>


		</form>
		</div>
		</jsp:useBean>

        </article>

        </section>

    

</div>
    <div style="margin-left: auto; margin-right: auto;">
<jsp:include page="footer.jsp" />
</div>
</body>
</html>