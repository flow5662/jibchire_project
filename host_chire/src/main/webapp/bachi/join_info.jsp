<%@ page language="java" contentType="text/html;charset=utf-8" pageEncoding="utf-8" %> 
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title> cust_info4 </title>
	<link rel="stylesheet" type="text/css" href="style/join_info.css?ver=1">
	<link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&family=Hahmlet&family=Noto+Sans+KR:wght@100&display=swap" rel="stylesheet">
</head> 

<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript" src="./CryptoJS/rollups/hmac-sha256.js"></script>
<script type="text/javascript" src="./CryptoJS/components/enc-base64.js"></script>
<script src="js/join_info.js"> </script>
<script type="text/javascript">

</script>
<% request.setCharacterEncoding("utf-8");  %>
<body>
	<section>     
		<form name="information" method="post"  onsubmit="return send()" action="insert_info.jsp">
			<table>
				<thead><tr> <td colspan="6">회원가입</td></tr>	</thead>				
				<tr>
					<td colspan="2" class="menu"> 아이디를 입력하세요 
						<img src="img/join/chat-check-fill.png"></td> 
					<td colspan="3">
						<input type="text" name="cust_id" id="id" maxlength="12" 
						placeholder="12자 까지 가능합니다"></td>
					<td> 
						<input type="button" value = "아이디 사용하기" name="cust_id_b" class="button" ></td>
	
				</tr>
				<tr class="idcheck">
					<td colspan="2" class="idcheck"></td>
					<td colspan="4" class="idcheck">
						<i id="idchecked"></i>
					</td>
				</tr>
				<tr> 
					<td colspan="2" class="menu"> 비밀번호를 입력하세요  
						<img src="img/join/chat-check-fill.png"></td> 
					<td colspan="4"> 
						<input type="password" class="txtfield" id="pw1" name="cust_pw" maxlength="18">  
					</td>				
				</tr>		
				<tr>
					<td colspan="2" class="menu"> 비밀번호를 한번 더 입럭하세요  
						<img src="img/join/chat-check-fill.png">
					</td> 
					<td colspan="4"> 
						<input type="password" class="txtfield" id="pw2" name="cust_pw2" maxlength="18"> 
					</td>		    
				</tr>
				<tr class="pwcheck">
					<td colspan="2" class="pwcheck"></td>
					<td colspan="4" class="pwcheck">
						<i id="success"> 비밀번호가 일치합니다 </i>
						<i id="fail"> 비밀번호가 일치하지 않습니다 </i>
					</td>
				</tr>
				<tr>
					<td colspan="2" class="menu"> 이름을 입럭하세요  
						<img src="img/join/chat-check-fill.png">
					</td>
					<td colspan="4"> 
						<input class="txtfield" type="text" name="cust_name" maxlength="20"> 
					</td> 
				</tr>
				<tr>
					<td colspan="2" class="menu"> 생년월일을 입럭하세요 
						<img src="img/join/chat-check-fill.png">
					</td>
					<td class="cell">
						<select name="yy" id="year"></select> 
					</td>
					<td class="cell">
						<select name="mm" id="month"></select>
					</td>
					<td class="cell">
						<select name="dd" id="date"></select>
					</td>
					<td></td>
				</tr>
				<tr>
					<td colspan="2" class="menu"> 성별을 선택하세요 
						<img src="img/join/chat-check-fill.png">
					</td> 
					<td colspan="1"> 
						<input type="radio" name="cust_sex" value="m" >남 <br> 
					</td>
					<td colspan="1"> 
						<input type="radio" name="cust_sex" value="f" >여 <br>
					</td>
					<td colspan="2"></td>
				</tr>
				<tr>
					<td colspan="2" class="menu"> 핸드폰 번호를 입럭하세요 
						<img src="img/join/chat-check-fill.png"> 
					</td> 
			    	<td> 
			    		<select name="cust_phn_1" class="cell">
			    			<option value="choose" > 선택 </option>
			    			<option value="skt" > skt </option>
				      	    <option value="uplus" >u+ </option>
				       		<option value="kt">kt </option>
				        	<option value="aatt">알뜰폰	</option>	    		
			    	    </select> 
			    	</td>
			    	<td  colspan="2" > 
			    		<input type="text" name="cust_phn_2" id="cellphone" size="11">  
			    	</td>
			    	<td>
			    	    <input type="button" value = "인증번호 발송" id="verify_bt1" name="verify" class="button"> 
			    	</td>
			    </tr>
			    <tr>
			    	<td colspan="2"> </td>
			    	<td class="submenu"> 인증번호 입력 </td>
			    	<td colspan="2"> 
			    		<input id="verify" type="text" name="verify_num" size="6" placeholder="전송된 인증번호를 입력해주세요"> 
			    	</td>
			    	<td> 
			    		<input type="button" value = "인증번호 확인"  id="verify_bt2"name="verify_button" class="button">
			    	</td>
			    </tr>
			    <tr>
			    	<td colspan="2" class="menu"> 주소를 입럭하세요 
						<img src="img/join/chat-check-fill.png"></td> 
			    	<td>
			    	    <input type="button" onclick="sample4_execDaumPostcode()" value= "우편번호 찾기"  class="button" >
			    	</td>
			    	<td colspan="2"> <input type="text" id="sample4_roadAddress" placeholder="도로명주소" name="cust_adr2"  maxlength="80">  </td>
				    <td> <input type="text" id="sample4_extraAddress" placeholder="참고주소"> </td>
			    </tr>
				<tr>
					<td colspan="2"></td> 
					<td colspan="1"> 
				    	<input type="text" id="sample4_postcode" placeholder="우편번호">
				    </td>
	
					<td colspan="2"> 
						<input type="text"  id="sample4_detailAddress" name="cust_adr3" placeholder="상세주소">
				    </td> 
				    <td></td>
	
	
			    </tr>
			
			    <tr>
			    	<td colspan="2" class="menu"> 이메일 주소를 입럭하세요 
			    		<img src="img/join/chat-check-fill.png">
			    	</td> 
			    	<td colspan="2"> 
			    		<input type="text" id="email" name="cust_email" maxlength="30" size="39">  @ 
			    	</td>
			    	<td> 
			    		<select name="emailadr" id="emailbox">
			    			<option value="choose"> 주소 선택</option>
					    	<option value="naver.com"> naver.com</option>
				        	<option value="gmail.com"> gmail.com</option>
				        	<option value="kakao.com"> kakao.com</option>
				      	    <option value="hanmail.net"> hanmail.net</option>
				       	    <option value=""> 직접입력</option>
			    	    </select> 
			    	</td>
			    	<td> <input type="text" name="emailadr_input" id="email_input" placeholder="직접입력" readonly="true"> </td>
			    </tr>
<!-- 			    <tr> -->
<!-- 			    	<td colspan="2" class="menu"> 계정을 소개할 사진을 올려주세요  </td>  -->
<!-- 			    	<td colspan="4"> -->
<!-- 			    		<input type="file" name="cust_pic"  > -->
<!-- 			    	</td> -->
<!-- 			    </tr> -->
			    <tfoot>
			    	<tr>
				    	<td colspan="6" align="center"> 
				    		<input type="button" value = "이전" id="backward"name="backward" class="button">
				    		<input type="submit" value = "완료" id="forward" name="forward" class="button">
				    	</td>
			    	</tr>
			    </tfoot>
			</table>
		</form>
	</section>

</body>
</html>