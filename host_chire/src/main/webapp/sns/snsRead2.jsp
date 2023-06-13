<%@page import="dto.Feed_comment"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dto.Feed"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>일상공유 읽기</title>
	<link rel="stylesheet" type="text/css" href="style/snsRead.css">
</head>
<%  //데이터 작업으로 얻은 객체 가져오기
	ArrayList<Feed> articleList = (ArrayList<Feed>)request.getAttribute("articleList");
	ArrayList<Feed_comment> commentlist = (ArrayList<Feed_comment>)request.getAttribute("commentlist");
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
		<input type="hidden" name="cust_id" value="<%=id%>">
	<%
		}
	%>
</header>
<div id="wrap">
	<div id="wraper">
	<!-- 사진, 내용, 댓글 -->
	<!-- 리스트, 썸네일목록 -->
		<section>
			<div id="title"> <h2 value="<%=articleList.get(0).getCust_id()%>"><%=articleList.get(0).getCust_id()%></h2></div>
			<div id="snsthunbnail">				
				<ul>
				<%	for(int i=0;i<articleList.size();i++){	%>
					<li class="feed">
					  	<!-- 타이틀. 회원사진과 아이디 -->
					  	<div class='snstitle'>
					  		<div class="custpic"><img src="feedPics/<%=articleList.get(i).getCust_pic()%>" onerror="this.src='../sns/img/sns/profile04.jpg'" style="width: 50px; height: 50px;"> 
					  			<span><%=articleList.get(i).getCust_id()%></span>
					  			<div class="updatemenu" value="<%=articleList.get(i).getFeed_id()%>"><img src="img/sns/threedots.png" style="width: 50px;">  </div>
					  			<ul class="updatelist" id="update<%=articleList.get(i).getFeed_id()%>">
					  				<li class="btn_update">수정</li>
					  				<li class="btn_delete">삭제</li>
					  			</ul>
					  		</div>
				  		</div>
						<div class='slider' id='slider<%=articleList.get(i).getFeed_id()%>'>
							<a class="control_next" value='<%=articleList.get(i).getFeed_id()%>'>>> </a>
							<a class="control_prev" value='<%=articleList.get(i).getFeed_id()%>'><< </a>
							<ul>
							    <li><div class="pics"><img src="feedPics/<%=articleList.get(i).getFeed_pics() %>" style="width: 450px; height: 450px;"></div></li>
							    <li><div class="pics"><img src="feedPics/<%=articleList.get(i).getFeed_pic1() %>" style="width: 450px; height: 450px;"></div></li>
							    <li><div class="pics"><img src="feedPics/<%=articleList.get(i).getFeed_pic2() %>" style="width: 450px; height: 450px;"></div></li>
							    <li><div class="pics"><img src="feedPics/<%=articleList.get(i).getFeed_pic3() %>" style="width: 450px; height: 450px;"></div></li>
						    </ul>
						</div>
						<!-- 내용공간. hashtag, 조회수 -->
						<div class='txt'>
							<!-- 댓글 버튼 -->
							<img src="img/sns/chat-1-line.png" class="buttoncomment" value="<%=articleList.get(i).getFeed_id()%>">
							<!-- 팔로우 버튼. 이미 팔로우 누른 피드는 초록색 아이콘, 안누른 피드는 검은라인 아이콘 -->
							<%
								String follow = articleList.get(i).getFollow_time();
								if(follow==null){
									%><img src="img/sns/user-unfollow-line.png" class="buttonfollow" value="<%=articleList.get(i).getCust_id()%>"><%
								}else{
									%><img src="img/sns/user-follow-fill.png" class="buttonfollow" value="<%=articleList.get(i).getCust_id()%>"><%
								}
							%>
							<!-- 좋아요 버튼. 이미 좋아요 누른 피드는 빨간색 하트, 좋아요 안누른 피드는 검은라인 하트 -->
							<% 
								String like= articleList.get(i).getLike_time();
								if(like==null){
									%><img src="img/sns/heart-add-line.png" class="buttonlike" value="<%=articleList.get(i).getFeed_id()%>"><%
								}else{
									%><img src="img/sns/heart-fill.png" class="buttonlike" value="<%=articleList.get(i).getFeed_id()%>"><%
								}
							%>
							<div class="read"><%=articleList.get(i).getFeed_hashtag()%>
								<br><pre><%=articleList.get(i).getFeed_txt() %></pre>
							</div>
						</div>
						<!-- 댓글 -->
						<div class="comment" id="<%=articleList.get(i).getFeed_id()%>">
							<%
								int feedid = articleList.get(i).getFeed_id();
								for(int j =0; j<commentlist.size(); j++){
									if(commentlist.get(j).getFeed_id()==feedid){
										%>
										<ul>
											<li class="commentimg"><img src="feedPics/<%=commentlist.get(j).getCust_pic()%>" onerror="this.src='img/sns/reddit-round-line-icon.png'" style="width:24px; height: 24px;"> </li>
											<li class="commentid"><%=commentlist.get(j).getCust_id()%> </li>
											<li class="comnenttxt"><%=commentlist.get(j).getCmt_txt()%> </li>
											<li class="commenttime"><%=commentlist.get(j).getCmt_time()%> </li>
										</ul>
										<% 
									}
								}
							%>
							<ul class="inputcomment">
								<% if(!(id==null)){%>
								<li><%=id%></li>
								<%	
								}
								%> 
								<li><input type="text" name="feed_comment" class="commentwrite"></li>
								<li><button class="commentsubmit" id="<%=articleList.get(i).getFeed_id()%>"> 입력 </button> </li>
							</ul>
						</div>
					</li>
				<% } %>
				</ul>
			</div>
		</section>	
	</div>
</div>	
<script>
	/*slider 관련 기능*/
// 	setInterval(function () {   moveRight();	}, 3000); // 자동슬라이드 해제
	var slideCount = $('.slider ul li div').width();
	var slideWidth = $('.slider ul li').width();
	var slideHeight = $('.slider ul li').height();
	var sliderUlWidth = slideCount * 5;
	
	$('.slider').css({ width: slideWidth });
	
	$('.slider ul').css({ width: sliderUlWidth, marginLeft: - slideWidth });
	
	$('a.control_prev').click(function () {
		var feedid = $(this).attr("value");
		var id = "#slider"+feedid;
		var ul = id+" ul";
		var li = ul+" li:last-child" ;
		//alert(ul);
		$(ul).animate({
		       left: + slideWidth
		   }, 200, function () {
		       $(li).prependTo(ul);
		       $(ul).css('left', '');
		       $(ul).css('transition',' all 0.4s cubic-bezier(.25,.8,.25,1)');
	   });
	});
	
	$('a.control_next').click(function () {
		var feedid = $(this).attr("value");
		var id = "#slider"+feedid;
		var ul = id+" ul";
		var li = ul+" li:last-child" ;
		//alert(ul);
		$(ul).animate({
		       left: - slideWidth
		   }, 200, function () {
		       $(li).prependTo(ul);
		       $(ul).css('left', '');
		       $(ul).css('transition',' all 0.4s cubic-bezier(.25,.8,.25,1)');
	   });
	});
	
	$(function(){
		/* 좋아요 버튼 눌렀을 때 바로 DB작업하기*/
		$(".buttonlike").click(function(){  
			//버튼 div의 value값으로 feed_id를 넣어놨음
			var feed_id= $(this).attr("value");
			var cust_id= $("input:hidden[name=cust_id]").val();
			if(cust_id==undefined){
				alert("좋아요를 이용하시려면 로그인을 실행해주세요");
			}else{ //아직 좋아요버튼을 누르지 않은 상태일때
				$.ajax({
					url : "snsHeartAction.sns?feed_id="+feed_id+"&cust_id="+cust_id,  
					dataType : "html",
					//data : "post",
					success : function(check){
						//alert("");
					}
				});
				var src1 = $(this).attr("src");
				//alert(src1);
				if(src1=="img/sns/heart-fill.png"){
					$(this).attr("src","img/sns/heart-add-line.png");
				}else{
					$(this).attr("src","img/sns/heart-fill.png");
				}
		
			}
		});

		/* 팔로우 버튼 눌렀을 때 바로 DB작업하기*/
		$(".buttonfollow").click(function(){  
			//버튼 div의 value값으로 feed_id를 넣어놨음
			var cust_following= $(this).attr("value");   //로그인 한 사람이 팔로잉하는 아이디
			var cust_id= $("input:hidden[name=cust_id]").val();  //로그인 한 사람의 아이디
			if(cust_id==undefined){
				alert("팔로우를 이용하시려면 로그인을 실행해주세요");
			}else{ //아직 좋아요버튼을 누르지 않은 상태일때
				$.ajax({
					url : "snsFollowAction.sns?cust_following="+cust_following+"&cust_id="+cust_id,  
					dataType : "html",
					//data : "post",
					success : function(check){
						//alert("");
					}
				});
			//내가 누른 버튼의 아이콘 변경. 그리고 같은 글쓴이를 공유하고 있는 다른 버튼들도 팔로우 버튼 자동적으로 변경 
			var src1 = $(this).attr("src");
			if(src1=="img/sns/user-unfollow-line.png"){
				$(this).attr("src","img/sns/user-follow-fill.png");
				$(".buttonfollow[value="+cust_following+"]").attr("src","img/sns/user-follow-fill.png");
			}else{
				$(this).attr("src","img/sns/user-unfollow-line.png");
				$(".buttonfollow[value="+cust_following+"]").attr("src","img/sns/user-unfollow-line.png");
			}
			}
		});
		
		$(".comment").hide(); //댓글창 숨기기
		/* 댓글 아이콘 눌렀을 때 댓글 창 */
		$(".buttoncomment").click(function(){
			var value = $(this).attr("value");   //로그인 한 사람이 팔로잉하는 아이디
			var dd = "div#"+value;
			$(dd).show(200,'swing');
		});
		
		/*로그인 안했을 때 댓글 남길 수 없음*/
		var cust_id= $("input:hidden[name=cust_id]").val();  
		if(cust_id==null){
			$("input:text[name=feed_comment]").attr("readonly","readonly");
			$("input:text[name=feed_comment]").attr("placeholder","로그인을 실행해주세요");
		}else{
			$("input:text[name=feed_comment]").attr("placeholder","50자까지 가능합니다");
		}
		
		/*댓글 submit후 바로 보이기*/
		$(".commentsubmit").click(function(){
			var cmt_txt = $(".commentwrite").val();
			var feed_id = $(".commentsubmit").attr("id");
			var cust_id = $("input:hidden[name=cust_id]").val();
			var feed_writer =$("span").html(); 
			//alert(feed_writer);
			$.ajax({
				url : "snsInsertComment.sns?cust_id="+cust_id+"&feed_id="+feed_id+"&cmt_txt="+cmt_txt+"&feed_writer="+feed_writer,  
				dataType : "html",
				//data : "post",
				success : function(check){
					location.reload();//새로고침
				}
			});
		});		
		
		/*로그인 한 사람이 쓴 글일때 보이기 점3개 메뉴 보이기*/
		var writer_id = $("h2").attr("value");
		var login_id = $("input:hidden[name=cust_id]").val();
		if(writer_id==login_id){
			$(".updatemenu").show();
		}
		$(".updatelist").hide();
		$(".updatemenu").click(function(){
			var feed_id = $(this).attr("value");
			var updatelist_id = "ul#update"+feed_id;
			//alert(updatelist_id);
			$(updatelist_id).show(200,'swing');
			$(".btn_update").click(function(){
				updateConfirm();
			});
			$(".btn_delete").click(function(){
				deleteConfirm();
			});
			
		 	function deleteConfirm(){
		 		var cnfm = confirm("삭제 하시겠습니까?");
		 		if(cnfm){
		 			document.location.href = "snsDeleteAction.sns?feed_id="+feed_id;
		 		}else{
		 			return false;
		 		}
		 	}
		 	function updateConfirm(){
		 		var cnfm = confirm("수정 하시겠습니까?");
		 		if(cnfm){
		 			document.location.href = "snsUpdateDataAction.sns?feed_id="+feed_id;
		 		}else{
		 			return false;
		 		}
		 	}
		});
		


	});
</script>	
<!-- footer -->
<footer>
	<jsp:include page="footer.jsp" />
</footer>
</body>
</html>