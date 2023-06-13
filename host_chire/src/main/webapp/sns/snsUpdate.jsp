<%@page import="dto.Feed"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>일상공유 메인</title>
	<link rel="stylesheet" type="text/css" href="style/snsUpdate.css">
</head>
<%  //데이터 작업으로 얻은 객체 가져오기
	Feed feed = (Feed)request.getAttribute("Feed");
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
<div id="wrap">
	<!-- 사진올리고 글쓰는 공간 -->
	<section>
		<form action="snsUpdateAction.sns" method="post" enctype="multipart/form-data">
			<input type="hidden" name="cust_id" value="<%=id%>"><!-- cust_id값에 로그인한 아이디 값넣기 -->
			<input type="hidden" name="feed_id" value="<%=feed.getFeed_id()%>">
			<table id="work">
<!-- 				<thead><tr><td colspan=2> <h2>일상공유 글쓰기</h2> </td></tr> </thead> -->
				<tbody>
					<tr>
						<td> 
							<div>
								<div id="preview" contenteditable="true"><img id="previewImg" />
									<div>썸네일 확인</div> 
								</div>
								<div id="inputfile">썸네일로 고를 사진을 올려주세요 <br><input type="file" onchange="readImage(this);" name="feed_pics"></div>
							</div>
						</td>
						<td>
							<div>
								<textarea placeholder="내용을 입력해주세요" name="feed_txt"><%=feed.getFeed_txt()%></textarea>
								<input type="text" placeholder="#ootd" name="feed_hashtag" id="hashtag" value="<%=feed.getFeed_hashtag() %>">
								<div id="threepics">
									<input type="file" name="feed_pic1">
									<input type="file" name="feed_pic2">
									<input type="file" name="feed_pic3">
								</div>
							</div>
								
						</td>
					</tr>
				</tbody>
				<tfoot> <tr><td colspan=2><input type="submit" value="제출"> </td></tr></tfoot>					
			</table>
		</form>
	</section>
</div>
<script>
	function readImage(input) { 
		
	  if (input.files && input.files[0]) { // 인풋 태그에 파일이 있는 경우
	    var reader = new FileReader();  // FileReader 인스턴스 생성
	    reader.onload = function(e) {
	      document.getElementById('previewImg').src = e.target.result;
	    };
	    reader.readAsDataURL(input.files[0]);
	  } 
	  else {
	    document.getElementById('previewImg').src = "";
	  }
	}

</script>
<!-- footer -->
<footer>
	<jsp:include page="footer.jsp" />
</footer>
</body>
</html>