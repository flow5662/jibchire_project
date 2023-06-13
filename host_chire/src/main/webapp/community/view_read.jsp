<%@ page import="dao.CmtHousewarming" %>
<%@ page import="dto.Post_house" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.net.URLEncoder"%>
<%@ page import="java.io.File"%>
<%@ page import="java.io.*"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>게시글 읽기</title>
	<link rel="stylesheet" type="text/css" href="style/view_read.css">
</head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script src="js/view_read.js"> </script>
<%
 request.setCharacterEncoding("utf-8");
%>
<%
	Post_house po = (Post_house)request.getAttribute("post");
%>
<body>
 	<!-- header -->
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
		<%  String color =  po.getPost_color();
			String [] colors = null;
			String bgcolor = null;
			if(!(color == null || color.isEmpty())){
				colors = color.split(",");
			}
			if(colors[0].equals("black")){
				bgcolor = "000000";
			}else if(colors[0].equals("white")){
				bgcolor = "#FFFFFF";
			}else if(colors[0].equals("yellow")){
				bgcolor = "#FFFF66";
			}else if(colors[0].equals("beige")){
				bgcolor = "#d1c9be";
			}else if(colors[0].equals("brown")){
				bgcolor = "#FFB266";
			}else if(colors[0].equals("red")){
				bgcolor = "#FF6666";
			}else if(colors[0].equals("green")){
				bgcolor = "#4C9900";
			}else if(colors[0].equals("blue")){
				bgcolor = "#004C99";
			}else if(colors[0].equals("purple")){
				bgcolor = "#4C0099";
			}
		%>
		<section id="section01">
			<section class="skewdBox" style="background-color:<%=bgcolor%>">
				<div id="background" style="background-image: url(postPics/<%=po.getPost_pics()%>);">
					<!-- 바탕사진 들어감 -->
				</div>
			</section>
			<section class="skewdBox2">
				<div style="width: 800px; margin: 0 auto;">
					<div id="halfround">
						<img src="postPics/<%=po.getPost_pics()%>" style="width: inherit; height: inherit;">
					</div>
					<div id="explain01">
						<h1>
							<%=po.getPost_title() %>
						</h1>
						<div class="content">
					   		<pre>
					   			<%=po.getPost_txt()%>
					   		</pre>
				   		</div>
					</div>
				</div>
			</section>
		</section>
	<div id="wrap">
<!-- 		<div id="mainpic"> -->
<%-- 			<img src="postPics/<%=po.getPost_pics()%>" id="mainpicimg"> --%>
<!-- 		</div> -->
	    <!-- 세부내용박스(집특징, 평수 등등) -->	   	
	   	<div id="info">
	   		<table>
	   			<tr><td>주거형태</td>
	   				<td><%=po.getPost_house()%> </td>
	   				<td>방개수</td>
	   				<td><%=po.getPost_rooms()%>개</td>
	   				<td>집 평수</td>
	   				<td><%=po.getPost_m2()%>평</td>
	   			</tr>
	   			<tr>	
	   				<td>집 연식</td>
	   				<td><%=po.getPost_houseold()%>년 이상</td>
	   				<td>가족 인원</td>
	   				<td><%=po.getPost_fam()%>명</td>
	   				<td>가족 형태</td>
	   				<td><%=po.getPost_family()%></td>
	   			</tr>
	   		</table>
		</div >
<!-- 	   	<div id="title">  -->
<%-- 	   		<h1><%=po.getPost_title() %></h1> --%>
	   		<!-- //현재 session에서 저장된 ID값과 db에서 가져온 id 값이 일치한다면 버튼생성 -->
	   		<%
// 	   		//글의 데이터에서 작성자의 아이디와, 현제 로그인한 사람의 아이디가 동일하면 삭제, 수정버튼 생성
// 		   	String id2 = po.getCust_id();
// 			if(!(id==null) && id.equals(id2)){ 
// 				out.println("<input type='button' value='삭제' onclick="+"location.href='delete_write.jsp?post_id="+po.getPost_id()+"'>"); //삭제버튼 누르면 그 글을 바로 삭제
// 				out.println("<input type='button' value='수정' onclick="+"location.href='view_update.jsp?post_id="+po.getPost_id()+"'>"); //수정버튼 누르면 그 글의 수정페이지로
// 				out.println("<input type = 'hidden' name ='post_id' id='post_id' value = "+po.getPost_id()+">");
// 			}	
			%>   	
<!-- 	   	</div>	 -->
		<!-- 내용 -->
<!-- 		<div class="content"> -->
<!-- 	   		<pre> -->
<%-- 	   			<%=po.getPost_txt()%> --%>
<!-- 	   		</pre> -->
<!--    		</div> -->
<!-- 
UPDATE `interior`.`post_house` SET `post_position` = 
'1,50px,120px,2,150px,120px,3,250px,220px,4,50px,720px,5,250px,620px,6,150px,690px,7,150px,420px,8,250px,520px,9,150px,690px,10,150px,220px,/
11,130px,560px,12,130px,260px,13,230px,360px,14,230px,560px,15,130px,760px,16,230px,460px,17,130px,360px,18,160px,180px,19,120px,460px,20,180px,360px,/
21,80px,130px,22,280px,330px,23,180px,460px,24,180px,230px,25,180px,730px,26,280px,330px,27,280px,630px,28,280px,530px,29,180px,730px,30,180px,430px,/
31,140px,700px,32,140px,470px,33,240px,230px,34,340px,70px,35,240px,670px,36,140px,440px,37,140px,490px,38,120px,370px,39,140px,270px,40,120px,570px,/';
 -->
		<div id="position">
			<%  String pstn =  po.getPost_position();
				String [] position = null;
				String [] position2 = null;
				String [] position3 = null;
				String [] position4 = null;
				if(!(pstn == null || pstn.isEmpty())){
					String [] post_pic = pstn.split("/");     // 값이 있으면 리스트를 만들 것 
					%>
					<ul> 
					<% 
					for(int i = 0 ; i<post_pic.length; i++){
						if(i==0){
							position = post_pic[i].split(",");
						%>
							<li>
						<%
								for(int j =0 ; j<position.length ; j=j+3){ //1:pro_id, 2:x축, 3:y축
						%>
								<img src="img/community/png/green-button.png" class="draggable" id="<%=position[j]%>" style="position:relative; left:<%=position[j+1]%>; top:<%=position[j+2]%>;">
						<%		}
								for(int j =0 ; j<position.length ; j=j+3){ //포지션은 x,y이니까 2칸씩 점프
									String item_div = "item_div"+position[j];
						%>
								<div class="iteminfo" id="<%=item_div%>" style="position:relative; left:<%=position[j+1]%>; top:<%=position[j+2]%>;"> </div>
						<%		}
								
						%>
							</li>
						<% 
						}else if(i==1){
							position2 = post_pic[i].split(",");
							%>
								<li>
							<%
									for(int j =0 ; j<position2.length ; j=j+3){ //1:pro_id, 2:x축, 3:y축
							%>
									<img src="img/community/png/green-button.png" class="draggable" id="<%=position2[j]%>" style="position:relative; left:<%=position2[j+1]%>; top:<%=position2[j+2]%>;">
							<%		}
									for(int j =0 ; j<position2.length ; j=j+3){ //포지션은 x,y이니까 2칸씩 점프
										String distinctitem = "item_div"+position2[j];
							%>
									<div class="iteminfo" id="<%=distinctitem%>" style="position:relative; left:<%=position2[j+1]%>; top:<%=position2[j+2]%>;"> </div>
							<%		}
									
							%>
								</li>
							<% 
						}else if(i==2){
							position3 = post_pic[i].split(",");
							%>
								<li>
							<%
									for(int j =0 ; j<position3.length ; j=j+3){ //1:pro_id, 2:x축, 3:y축
							%>
									<img src="img/community/png/green-button.png" class="draggable" id="<%=position3[j]%>" style="position:relative; left:<%=position3[j+1]%>; top:<%=position3[j+2]%>;">
							<%		}
									for(int j =0 ; j<position3.length ; j=j+3){ //포지션은 x,y이니까 2칸씩 점프
										String distinctitem = "item_div"+position3[j];
							%>
									<div class="iteminfo" id="<%=distinctitem%>" style="position:relative; left:<%=position3[j+1]%>; top:<%=position3[j+2]%>;"> </div>
							<%		}
									
							%>
								</li>
							<% 
						}else if(i==3){
							position4 = post_pic[i].split(",");
							%>
								<li>
							<%
									for(int j =0 ; j<position4.length ; j=j+3){ //1:pro_id, 2:x축, 3:y축
							%>
									<img src="img/community/png/green-button.png" class="draggable" id="<%=position4[j]%>" style="position:relative; left:<%=position4[j+1]%>; top:<%=position4[j+2]%>;">
							<%		}
									for(int j =0 ; j<position4.length ; j=j+3){ //포지션은 x,y이니까 2칸씩 점프
										String distinctitem = "item_div"+position4[j];
							%>
									<div class="iteminfo" id="<%=distinctitem%>" style="position:relative; left:<%=position4[j+1]%>; top:<%=position4[j+2]%>;"> </div>
							<%		}
									
							%>
								</li>
							<% 
						}
					}
				%>
					</ul>
				<%
				}
				%>
		</div>
   		<div class="postPics">
			 <div class="pics">
			 	<img src="postPics/<%=po.getPost_pic2() %>" id="insertedbigpicture" style="width:630px; height: 780px;">
			 	<!-- 상품(슬라이드) 에 대한 세부정보 들어가는 공간 -->
			 	<div class="itemthumbnailinfo">
<!-- 				 		<li> <div id="iteminfo11" class="postIteminfos">123 </div> </li> -->
			 	</div>
			 </div>
			 <div class="postItem">
			 	<!-- 큰 사진에 대한 상품 사진 넣는 공간 -->
			 	<ul class="insertedpicture">
			 		<li><img src="postPics/<%=po.getPost_pics()%>" style="width:140px; height: 190px;"> 
			 			<input type="hidden" value="postPics/<%=po.getPost_pics()%>"></li>
			 		<li><img src="postPics/<%=po.getPost_pic2()%>" style="width:140px; height: 190px;"> 
			 			<input type="hidden" value="postPics/<%=po.getPost_pic2()%>"></li>
			 		<li><img src="postPics/<%=po.getPost_pic3()%>" style="width:140px; height: 190px;"> 
			 			<input type="hidden" value="postPics/<%=po.getPost_pic3()%>"></li>
			 		<li><img src="postPics/<%=po.getPost_pic4()%>" style="width:140px; height: 193px;"> 
			 			<input type="hidden" value="postPics/<%=po.getPost_pic4()%>"></li>
			 	</ul>
			 </div> 
 		</div>
		<!-- 상품 슬라이드 -->
		<div id="slider" >
			<a class="control_next">>></a>
			<a class="control_prev"><<</a>
			<ul class="itemthumbnail" id="positionlist1">
			<%
// 				if(!(position.length==0)){
// 					for(int i = 0; i<position.length;i=i+3){
// 						String itemid = "item1"+i;
			%>
<%-- 					<li id="<%=itemid%>"><img src="postPics/<%=position[i]%>"style="width:130px; height: 130px;"> --%>
<%-- 			    	<input type="hidden" value="<%=position[i]%>"></li> --%>
			<%
// 					}
// 				}
			%>
			<%  
				String item = po.getPost_item();
				String [] items = null;
				if(!(item == null || item.isEmpty())){
					items = item.split(",");
					for(int j =0 ; j<items.length ; j++){ //포지션은 x,y이니까 2칸씩 점프
						String itemid = "item1"+j;
			%>				
<%-- 			    <li id="<%=itemid%>"><img src="postPics/<%=items[j]%>"style="width:130px; height: 130px;"> --%>
<%-- 			    	<input type="hidden" value="<%=items[j]%>"></li> --%>
			<% 
					} 
			    }
			%>

		    </ul>
		</div>	
		<pre>
   			<%=po.getPost_txt2()%>
   		</pre>
	</div>
<!-- footer -->
<footer>
	<jsp:include page="footer.jsp" />
</footer>
</body>
</html>