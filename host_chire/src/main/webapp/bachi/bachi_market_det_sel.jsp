<%@page import="dto.Bachi_market_request"%>
<%@page import="dto.Bachi_market_review"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%request.setCharacterEncoding("utf-8");%>
   <%@page import="java.util.ArrayList"%>
    <%@page import="dto.Bachi_market"%>
     <%@page import="dto.Bachi_product"%>
         <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<%
String market_id = request.getParameter("market_id");
String cust_id = (String)session.getAttribute("ID");
String cust_pw = (String)session.getAttribute("cust_pw");
%>



<head>

<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<title>바치상점</title>
</head>
<link rel="stylesheet" type="text/css" href="style/bachi_market_det_sel.css">
<body>


<!-- 상세 페이지 -->

<!-- 헤더 -->
    <div class="wrap">
               <header>
    <% 
		request.setCharacterEncoding("utf-8"); 
		String id = (String) session.getAttribute("ID");  //session값에서 아이디 가져올 때 null이면 일반헤더, 아니면 로그인헤더
		if((id==null)){
	%>
		<jsp:include page="header.jsp" />
		<!-- 구매하는 화면으로 강제로 넘겨주기 -->
	<%
		}else{
	%>
		<jsp:include page="header_login.jsp" />
	<%
		}
	%>
	</header>
    <section>
    	<article style="width: 100%; display: inline-block;">
    	 <div class="market_section">
    		<jsp:useBean id="market" class="dao.Gosu_mark">
    		<form action="bachi_market_order" onsubmit="return selectId()" method="post">
    	
    		<div class="css-section-market-re">
    		<% 
    		int mark = Integer.parseInt(market_id);
    		ArrayList<Bachi_market> market_list_cust = market.gosu_mark_sel_det(mark);
    		ArrayList<Bachi_product> bachi_product = market.gosu_pro_det(mark);
    		%>
    		<div class="flex-aside-left">
    		<%
    		//out.println("<li id='market_id' name='market_id'>"+market_list_cust.get(0).getMarket_id()+"</li>");
	    	//out.println("<li name='cust_id'>"+market_list_cust.get(0).getCust_id()+"</li>");
	    	
	    		String serverImagePath = request.getContextPath() + "/bachi/bachi_market/sm_" + market_list_cust.get(0).getMarket_picture();
		%>
		
    <img src='<%=serverImagePath%>' style='width:750px;height: 500px; border-radius:8px;'>
		<%
	    	
	    	//out.println("<img src='../"+market_list_cust.get(0).getMarket_picture()+"' style='width:750px;height: 500px; border-radius:8px;'></li>");
	    	//out.println("<li name='gosu_id'>"+market_list_cust.get(0).getGosu_id()+"</li>");
	    	//out.println("<li name='market_text'>"+market_list_cust.get(0).getMarket_text()+"</li>");
	    	//out.println("<li name='title'>"+market_list_cust.get(0).getMarket_title()+"</li>");
	    	
	    	//out.println("<li name='gosu_price'>"+market_list_cust.get(0).getGosu_price()+"원"+"</li>");
	    		
    		
    		%>
    			<div class="css-section-bottom-area">
    		<div class="css-section-bottom">
    		<div class="css-text-name">
    			<div class="css-section-text"><span class="text-det">상세설명</span></div>
    			<div class="css-section-text"><span class="text-det">리뷰</span></div>
    			<div class="css-section-text"><span class="text-det">문의</span></div>
    		</div>
    		</div>
    		
    		<div class="css-market-sangse-text">
    		
    		<div class="gosu-user">
    		<%
    		
    		String user_img = market.cust_img(market_list_cust.get(0).getCust_id());
    		String serverImagePath_user = request.getContextPath() + "/cust/sm_" + user_img;
    		
    		
    		%>
    		
    		<div class="gosu-user-img" style="background-image: url('<%=serverImagePath_user%>'); background-size: cover;"></div>
    		<!-- div안에 회원 이미지 넣기, backgound-size:cover로 이미 맞춰진 사이즈에 이미지 크기 맞추기 -->
    		<div class="gosu-user-id">
    		
    		<span><%out.println(market_list_cust.get(0).getCust_id()); %></span>
    		<span><font color="#yyycc">★★★★★</font></span>
    		</div>
    	
    		</div>
    		
    			<div class="gosu-user-adrress">
    		<!--  <span class="ad">서비스 지역</span><span class="ad">지역</span>-->
    		</div>
    		
    		<div class="user-text-section-gosu">
    		<%out.println(market_list_cust.get(0).getMarket_text());%>
    		
    		</div>
    		
    	
    		<h4 class="section-title">리뷰</h4>
    		<%
    		ArrayList<Bachi_market_review> review_list = market.review_select(mark);
    		if(review_list.size()<1){
    			out.println("<div class='market-review-none'>리뷰가 등록되지 않았습니다.</div>");
    		}
    		
    		for(int i=0;i<review_list.size();i++){
    			
    		
    		
    		
    		String user_img_review = market.cust_img(review_list.get(i).getCust_id());
    		String serverImagePath_user_review = request.getContextPath() + "/cust/sm_" + user_img_review;
    		
    		
    		%>
    		<div class="market-review-section">
	    		<div class="market-review">
	    			<div class="review-user-img" style="background-image: url('<%=serverImagePath_user_review%>'); background-size: cover;"></div>
	    			<div class="gosu-user-id">
	    			<span><%=review_list.get(i).getCust_id() %></span>
	    			<span><font color="#yyycc"><%
	    			int review_star = market.review_star_count(review_list.get(i).getCust_id());
	    			switch(review_star){ //별점이 1~5개이면 특수문자 별로 보이게
	    			case 1 :
	    				out.println("★☆☆☆☆");
	    				break;
	    			case 2 :
	    				out.println("★★☆☆☆");
	    				break;
	    			case 3 :
	    				out.println("★★★☆☆");
	    				break;
	    			case 4:
	    				out.println("★★★★☆");
	    				break;
	    			case 5:
	    				out.println("★★★★★");
	    				break;
	    			}
	    			
	    			%></font></span>
	    			</div>
	    		</div>
	    		<%if(review_list.get(i).getReview_pic() != null){ %>
	    		<div class="market-review-img">
	    		<div class="slider-container">
	    		<div class="slider">
	    		<%
	    		String review_img = review_list.get(i).getReview_pic();
	    		 String[] review = review_img.split(",");
	    		for(int t=0;t<review.length;t++){
	    			String ImagePath_review = request.getContextPath() + "/bachi/bachi_market/review/sm_"+review[t];
	    		 %>
	    		<img src='<%=ImagePath_review%>' style='width:150px;height: 150px; border-radius:8px;'>
	    		
	    		<%} %>
	    		</div>
	    			<div class="prev-button" ><</div>
  					<div class="next-button" >></div>
	    		</div>
	    		 	
	    		</div>
	    		<%} %>
	    		<div class="market-review-text">
	    		<%=review_list.get(i).getReview() %>
	    		</div>
    		</div>
    		<% } %>
    		<h4 class="section-title">문의</h4>
    		
    		<% 
    		ArrayList<Bachi_market_request> request_list= market.market_request_select(mark); 
    		if(request_list.size()<1){
    			out.println("<div class='market-review-none'>문의가 등록되지 않았습니다.</div>");
    		}
    		for(Bachi_market_request re : request_list){
    			
    		
    		%>
    		<div class="market-request">
    		<div class="market-request-gosu_id">
			<% String gosu_text  = market.market_req_gosu_id(mark, re.getGosu_id());
			out.println(gosu_text);
			%>
			</div>
    		<div class="market-request-body"><%=re.getReq_text() %></div>
    		
    		</div>
    		<%} %>
    		
    		</div>
    		</div>
    		
    		
    		
    	</div>
    	
    	<div class="flex-aside-right">
    	<div class="flex-aside-right-list">
    	<div class="flex-controller">
    	<div class="no-space"> 
    	<% 
    	out.println("<ul class='css-gosu_menus css-bord-menu'>"+"<li>"+market_list_cust.get(0).getGosu_menu1()+"</li>"+"/<li>"+market_list_cust.get(0).getGosu_menu2()+"</li></ul>");
    	%>
    	<div class="product-title">
    	<%out.println("<h3>"+market_list_cust.get(0).getMarket_title()+"</h3>"); %>
    	</div>
    	</div>
    		<input type="hidden" name="market_id" value="<%=mark %>">
    	</div>
    	<div class="css-option-body">
    	<div class="css-option-group">
    	
    		
    		
    		
    		<!-- 옵션 -->
    		<% ArrayList<Bachi_product> options = market.option_select(Integer.parseInt(market_id)); 
    			for(Bachi_product pro : options){ //사용자가 선택한 옵션이 수정되게끔.
    		%>
    		<div class="product-option">
    		<div class="css-option-box">
    		<div class="custom-control custom-radio">
    	
    		<input type="radio" class="custom-control-input" name="gosu_id" value="<%=pro.getGosu_id()%>"><!-- gosu_id값이 정상적으로 넘어가야함 -->
    			
    			<label class="custom-control-label">
    				<div class="css-option-title"><%=pro.getGosu_title() %></div>
    			</label>
    			</div>
    			
    			<div class="css-option-price"><strong>
    			<fmt:formatNumber value="<%=pro.getGosu_price() %>" pattern="#,###"/>원</strong></div>
    			<div class="css-option-text">
    			
    			<p><%=pro.getGosu_text() %></p>
 				
    			</div>
    		</div>
    		</div>
    	
    		<% } %>
    		
    		
    		
    	</div>
    	</div>
    	<div class="css-button-submit">
    	<input type="submit" value="구매하기" class="css-button-sub">
    	</div>
    	<div class="css-button-history-delete">
    	<input type="button" value="이전" onclick="window.history.back()" class="css-button-his">
    	<input type="button" value="문의"  class="css-button-del">
    	</div>
    		</div>
    		</div>
    		</div>
    		
    		
    		
    		
    		
    		
    		
    	

    		
    		
    		 
    		
    		
    		
<script>
function deleteMarket() {
	  var marketId = '<%=market_list_cust.get(0).getMarket_id()%>';
	  
	  if("<%=id%>" == "null"){
			alert("로그인 후 문의해주세요.");
			return false; //id가 null값인 경우(비회원) 불가
		}else{
			
			alert("문의화면으로 이동!");
			
			
		}
	  
	
	}
var radio = document.querySelector('input[type="radio"]');
function selectId(){	
		if("<%=id%>" == "null"){
			alert("로그인 후 구매가능합니다.");
			return false;
		}else{
			if(!radio.checked){
				alert("옵션을 선택해주세요.");
				return false;
			}
		}
		
}





</script>    		
    		

    		
	

    		</form>
    		
    	
    		
    		</jsp:useBean>
    	
    	
    	</div>
    	
    	</article>
    
    
    
    </section>
    
    <div style="margin-left: auto; margin-right: auto;">
        <jsp:include page="footer.jsp" />
    </div>
    
    
    </div>
    
    
    
    
</body>
<script>
$(document).ready(function() {
	$('.prev-button').click(function() {
		  $('.slider').animate({ marginLeft: '+=150px' }, 500);
		});

		$('.next-button').click(function() {
		  $('.slider').animate({ marginLeft: '-=150px' }, 500);
		});
	
		
		
	});

</script>

</html>