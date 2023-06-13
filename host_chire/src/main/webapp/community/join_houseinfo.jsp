<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<link rel="stylesheet" type="text/css" href="style/join_houseinfo.css">
</head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script src="js/join_houseinfo.js"> </script>
<body>
<!-- 회원가입이나 다른창에서 고객이 자신에 맞는 정보를 얻기 위해 집에대한 정보를 입력하는 창 -->
<form action = "insert_houseinfo.jsp">
	<table id="getinfo">
		<tbody>
			<tr><td colspan=2><h4> 나와 비슷한 집 정보 찾기 </h4></td></tr>
			<tr><td> 주거형태를 입력하세요 <img src="img/community/png/chat-check-fill.png"></td>  </td>
				<td> <input type="radio" name="post_house" value="apart"> 아파트
					<input type="radio" name="post_house" value="officetel"> 오피스텔
					<input type="radio" name="post_house" value="house"> 주택
					<input type="radio" name="post_house" value="villa"> 빌라
					<input type="radio" name="post_house" value="dorm"> 기숙사
				</td>
			</tr>
			<tr><td> 방 개수를 입력하세요 <img src="img/community/png/chat-check-fill.png"></td>  </td> 
				<td>  <select id="rooms" name="post_rooms" > </select> </td>
			</tr>
			<tr><td> 집 평수를 입력하세요 <img src="img/community/png/chat-check-fill.png"></td>  </td>
				<td>  <select id="m2" name="post_m2" > </select> </td>
			</tr>
			<tr><td> 가족 인원수를 입력하세요 <img src="img/community/png/chat-check-fill.png"></td>  </td>
				<td> <select id="fam" name="post_fam"></select> </td>
			</tr>
			<tr><td> 집 연식을 입력하세요 <img src="img/community/png/chat-check-fill.png"></td>  </td>
				<td> <select id=houseold name="post_houseold"></select> </td>
			</tr>
			<tr><td> 가족형태를 선택하세요 <img src="img/community/png/chat-check-fill.png"></td>   </td>
				<td> <input type="checkbox" name="post_family" value="1인가구">1인가구
					<input type="checkbox" name="post_family" value="반려동물">반려동물
					<input type="checkbox" name="post_family" value="부모님과 함께사는">부모님과 함께
					<input type="checkbox" name="post_family" value="룸메이트">룸메이트
					<input type="checkbox" name="post_family" value="자녀와 함께">자녀와 함께
				</td>
			</tr>
			<tr><td> 집 방향을 선택하세요 <img src="img/community/png/chat-check-fill.png"></td>   </td>
				<td>
					<input type="radio" name="post_direc" value="남향">남향
					<input type="radio" name="post_direc" value="남동향">남동향
					<input type="radio" name="post_direc" value="남서향">남서향
					<input type="radio" name="post_direc" value="북향">북향
					<input type="radio" name="post_direc" value="북동향">북동향
					<input type="radio" name="post_direc" value="북서향">북서향
					<input type="radio" name="post_direc" value="동향">동향 
					<input type="radio" name="post_direc" value="서향">서향 <br>
					<input type="radio" name="post_direc" value="dontknow">잘모르겠음  
				</td>
			</tr>
			<tr><td> 지역을 입력하세요 <img src="img/community/png/chat-check-fill.png"></td>  </td>
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
					<input type="text" name="post_region2" placeholder="시/도">

				</td>
			</tr>
			<tr><td> 반려동물 유무를 입력하세요 <img src="img/community/png/chat-check-fill.png"></td>  </td>
				<td> <input type="radio" id="pet" name="post_pet" value="y"> 있음  
					<input type="radio" id="pet" name="post_pet"  value="n"> 없음 </td>
			</tr>
		</tbody>
		<tfoot>
			<tr><td colspan=2> <input type="submit" value="제출"> </td></tr>
		</tfoot>
	</table>
</form>
</body>
</html>