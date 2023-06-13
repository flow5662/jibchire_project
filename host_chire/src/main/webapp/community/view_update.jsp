<%@ page import="dao.CmtHousewarming" %>
<%@ page import="dto.Post_house" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>글쓰기 수정</title>
	<link rel="stylesheet" type="text/css" href="style/view_write.css">
</head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script src="js/view_update.js"> </script> <!-- insert랑 동일한 스크립트 파일 -->
<body>
	<!-- name은 db에 들어있는 table의 변수 이름과 동일하게 작성 -->
	<%
	request.setCharacterEncoding("utf-8");
			CmtHousewarming sl = new CmtHousewarming();
			int pid= Integer.parseInt(request.getParameter("post_id")); //수정버튼 누르면 url로 바로 값 가져왔음
			Post_house po = sl.select_one(pid);
	%>
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
    <!-- 수정할때, 글 작성시 입력한 값이 바로 들어갈 수 있도록. js로 값을 바로 selected, checked해놓았음 -->

    <input type="hidden" id="hidden_house" value="<%=po.getPost_house()%>">
    <input type="hidden" id="hidden_rooms" value="<%=po.getPost_rooms()%>">
    <input type="hidden" id="hidden_m2" value="<%=po.getPost_m2()%>">
    <input type="hidden" id="hidden_fam" value="<%=po.getPost_fam()%>">
    <input type="hidden" id="hidden_houseold" value="<%=po.getPost_houseold()%>">
    <input type="hidden" id="hidden_budget" value="<%=po.getPost_budget()%>">
    <input type="hidden" id="hidden_family" value="<%=po.getPost_family()%>">
    <input type="hidden" id="hidden_pet" value="<%=po.getPost_pet()%>">
  	<input type="hidden" id="hidden_direc" value="<%=po.getPost_direc()%>">
    
	<form action = "update_write.jsp">
	    <input type="hidden" name="post_id" value="<%=pid%>">
		<div id="wrap">
			<div id="info">    <h1> 글 수정하기 </h1> 	</div>
		<table id="getinfo">
			<thead><tr><td colspan=2><h4> 글 작성 전에 거주환경에 대해 체크해주세요 </h4></td></tr></thead>
			<tbody>
				<tr><td> 주거형태 </td>
					<td>
					<input type="radio" name="post_house" value="apart" id="ho1"> 
						<label for="ho1">아파트</label>
					<input type="radio" name="post_house" value="officetel" id="ho2"> 
						<label for="ho2">오피스텔</label>
					<input type="radio" name="post_house" value="house" id="ho3"> 
						<label for="ho3">주택</label>
					<input type="radio" name="post_house" value="villa" id="ho4"> 
						<label for="ho4">빌라</label>
					<input type="radio" name="post_house" value="dorm" id="ho5"> 
						<label for="ho5">기숙사</label>
					</td>
				</tr>
				<tr><td> 방 개수 </td> 
					<td>  <select id="rooms" name="post_rooms" > </select> </td>
				</tr>
				<tr><td> 집 평수 </td>
					<td>  <select id="m2" name="post_m2" > </select> </td>
				</tr>

				<tr><td> 집 연식 </td>
					<td> <select id="houseold" name="post_houseold"></select> </td>
				</tr>
				<tr><td> 집 방향 </td>
					<td><input type="radio" name="post_direc" value="남향">남향
					<input type="radio" name="post_direc" value="남동향">남동향
					<input type="radio" name="post_direc" value="남서향">남서향
					<input type="radio" name="post_direc" value="북향">북향
					<input type="radio" name="post_direc" value="북동향">북동향
					<input type="radio" name="post_direc" value="북서향">북서향
					<input type="radio" name="post_direc" value="동향">동향 
					<input type="radio" name="post_direc" value="서향">서향
					<input type="radio" name="post_direc" value="dontknow">잘모르겠음 
					</td>
				</tr>
				<tr><td> 스타일 </td>
					<td> <input type="checkbox" name="post_style" value="미니멀/심플">미니멀/심플
						<input type="checkbox" name="post_style" value="내추럴">내추럴
						<input type="checkbox" name="post_style" value="북유럽">북유럽
						<input type="checkbox" name="post_style" value="빈티지">빈티지
						<input type="checkbox" name="post_style" value="유니크">유니크
						<input type="checkbox" name="post_style" value="프렌치/플로럴">프렌치/플로럴
						<input type="checkbox" name="post_style" value="믹스매치">믹스매치
						<input type="checkbox" name="post_style" value="한옥">한옥
						<input type="checkbox" name="post_style" value="오피스겸용">오피스겸용
					</td>
				</tr>
				<tr><td> 색상 톤 </td>
					<td> <!-- 체크박스 자체에 스타일을 주기 위해서 각각의 라벨추가 -->
						<input type="checkbox" name="post_color" id="cb1" value="black"> 
						 	<label for="cb1"></label>
						<input type="checkbox" name="post_color" id="cb2" value="white"> 
						 	<label for="cb2"></label>
				 		<input type="checkbox" name="post_color" id="cb3" value="red"> 
						 	<label for="cb3"></label>
				 		<input type="checkbox" name="post_color" id="cb4" value="orange"> 
						 	<label for="cb4"></label>
					 	<input type="checkbox" name="post_color" id="cb5" value="yellow"> 
						 	<label for="cb5"></label>
					 	<input type="checkbox" name="post_color" id="cb6" value="green"> 
						 	<label for="cb6"></label>
					 	<input type="checkbox" name="post_color" id="cb7" value="blue"> 
						 	<label for="cb7"></label>
					 	<input type="checkbox" name="post_color" id="cb8" value="purple"> 
						 	<label for="cb8"></label>
					 	<input type="checkbox" name="post_color" id="cb9" value="brown"> 
						 	<label for="cb9"></label>
					 	<input type="checkbox" name="post_color" id="cb10" value="pink"> 
						 	<label for="cb10"></label>
					</td>
				</tr>
			</tbody>
		</table>
		<table id="getinfo2">
			<thead><tr><td colspan=2><h4>가족구성원, 인테리어 정보를 입력해주세요</h4></td></tr></thead>
			<tbody>
			<tr><td> 가족 인원 </td>
				<td> <select id="fam" name="post_fam"></select> </td>
			</tr>
			<tr><td> 가족형태 </td>
				<td> <input type="checkbox" name="post_family" value="1인가구">1인가구
					<input type="checkbox" name="post_family" value="신혼부부">신혼부부
					<input type="checkbox" name="post_family" value="부모님과 함께사는">부모님과 함께
					<input type="checkbox" name="post_family" value="룸메이트">룸메이트
					<input type="checkbox" name="post_family" value="자녀와 함께">어린 자녀와 함께
				</td>
			</tr>
			<tr><td> 반려동물<br>유무 </td>
				<td> <input type="radio" id="pet1" name="post_pet" value="y">  
						<label for="pet1">있음</label> 
					<input type="radio" id="pet2" name="post_pet"  value="n">  
						<label for="pet2">없음</label> 
				</td>
			</tr>
			<tr><td> 지역 </td>
				<td><select id="region" name="post_region">
					<option value="서울특별시">서울특별시</option>
					<option value="부산광역시">부산광역시</option>
					<option value="대구광역시">대구광역시</option>
					<option value="인천광역시">인천광역시</option>
					<option value="광주광역시">광주광역시</option>
					<option value="대전광역시">대전광역시</option>
					<option value="울산광역시">울산광역시</option>
					<option value="세종특별자치시">세종특별자치시</option>
					<option value="경기도">경기도</option>
					<option value="강원도">강원도</option>
					<option value="충청북도">충청북도</option>
					<option value="충청남도">충청남도</option>
					<option value="전라북도">전라북도</option>
					<option value="전라남도">전라남도</option>
					<option value="경상북도">경상북도</option>
					<option value="경상남도">경상남도</option>
					<option value="제주특별자치도">제주특별자치도</option>
				</select>
				<input type="text" name="post_region2" placeholder="시/도" id="regiontxt">
				</td>
			</tr>
			<tr><td> 예산 </td>
				<td> (이사 혹은 리모델링을 했다면 선택해주세요)<br> 
					<input type="text" name="post_budget" placeholder="만원단위로 입력해주세요" id="budgettxt" value="<%=po.getPost_budget()%>"> 만원 </td>
			</tr>
			<tr><td> 공사시작일 </td>
				<td> <select id="startdate_year" name="post_startdate_year"></select>
					<select id="startdate_month" name="post_startdate_month"></select>
					<select id="startdate_date" name="post_startdate_date"></select> </td>
				</tr>
			<tr><td> 공사마감일 </td>
				<td> <select id="enddate_year" name="post_enddate_year"></select> 
					<select id="enddate_month" name="post_enddate_month"></select>
					<select id="enddate_date" name="post_enddate_date"></select></td>
			</tr>
			</tbody>		
		</table>
		<table id="writing">
			<thead><tr><td><h4> 글 작성 </h4></td></tr></thead>
			<tbody>
				<tr><td id="title"> <input type="text" name="post_title" placeholder="글제목" value="<%=po.getPost_title()%>"> </td></tr>
				<tr><td><div id="preview"><img id="previewImg" ></div> </td></tr>
				<tr><td><h5>가장 메인이 되는 사진을 올려주세요</h5> 
						 <input type="file" onchange="readImage(this);" name="post_pic"> 
					</td>
				</tr>
				<tr><td id="text"> <textarea name="post_txt" id="textarea" placeholder="글내용을 입력해주세요"><%=po.getPost_txt() %></textarea> </td></tr>
			</tbody>
			<tfoot>	<tr><td> <input type="submit" value="작성완료"> </td></tr>	</tfoot>
		</table>
		</div>
	</form>
	<script>
	//첨부파일 삽입하면 이미지 미리보기
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