<%@ page language="java" contentType="text/html;charset=utf-8" pageEncoding="utf-8" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>로그인</title>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
</head>

<style>
/*reset css*/
* { margin : 0 ; padding : 0 ;  font-family: 'NanumSquare'; } 
a { text-decoration : none; }
	section {
		margin: 0 auto;
		padding-top: 60px;
    	padding-bottom: 60px;
	}
	#login{
		width: 500px;
		margin: 0 auto;
		background-color: white;
	}
	#title {
		width: 100%; height: 50px;
		text-align: center;
		font-weight: bold;
		/*background-color: #FF6666;*/
	}
	#mainTitle {
		text-align: center;
		font-size: 30px; font-weight: bold;
		margin-bottom: 30px;
	}
	#subTitle {
		text-align: center;
		margin-bottom: 70px;
	}
	/*#subTitle strong {
		background-color: #FFC6C6;
	}*/
	.input-box{
	    position:relative;
	    margin:10px 0;
	}
	.input-box > input{
	    background:transparent;
	    border:none;
	    border-bottom: solid 1px #ccc;
	    padding:20px 0px 5px 0px;
	    font-size:14pt;
	    width:100%;
	}
	input::placeholder{
	    color:transparent;
	}
	input:placeholder-shown + label{
	    color:#aaa;
	    font-size:14pt;
	    top:15px;
	
	}
	input:focus + label, label{
	    color:#8aa1a1;
	    font-size:10pt;
	    pointer-events: none;
	    position: absolute;
	    left:0px;
	    top:0px;
	    transition: all 0.2s ease ;
	    -webkit-transition: all 0.2s ease;
	    -moz-transition: all 0.2s ease;
	    -o-transition: all 0.2s ease;
	}
	
	input:focus, input:not(:placeholder-shown){
	    border-bottom: solid 1px #8aa1a1;
	    outline:none;
	}
	input[type=submit]{
	    background-color: #789849;
	    border:none;
	    color:white;
	    border-radius: 5px;
	    width:100%;
	    height: 60px;
	    font-size: 14pt;
	   margin-top: 70px;
	}
	#forgot{
		margin-top: -20px;
	    text-align: right;
	    font-size:12pt;
	    color:rgb(164, 164, 164);
	}
	#wrap{
	width:1280px;
	margin:0 auto;
	}
.sns-login{
	display: flex;
    padding-top: 20px;
    flex-direction: row;
    justify-content: space-between;
	}
</style>

<%
	String id = (String)session.getAttribute("id");
	String pw = (String)session.getAttribute("pw");
%>

<script type="text/javascript">
	function loginChk() {
    	var id = document.getElementById("id").value;
   		var pw = document.getElementById("pw").value;
		
		if((id.length == 0 || id == null) && (pw.length == 0 || pw == null)) {
			document.getElementById("nullId").innerHTML = "<div style='color: red'>아이디를 입력해주세요.</div>";
			document.getElementById("nullPw").innerHTML = "<div style='color: red'>비밀번호를 입력해주세요.</div>";
    		return false;
		}
    	if(id.length == 0 || id == null) {
    		document.getElementById("nullId").innerHTML = "<div style='color: red'>아이디를 입력해주세요.</div>";
    		document.getElementById("nullPw").innerHTML = "<div style='color: red'></div>";
    		return false;
    	}
    	if(pw.length == 0 || pw == null) {
    		document.getElementById("nullId").innerHTML = "<div style='color: red'></div>";
    		document.getElementById("nullPw").innerHTML = "<div style='color: red'>비밀번호를 입력해주세요.</div>";
    		return false;
    	}
    	if(!engNum.test(id)) {
    		alert("아이디는 영어, 숫자만 입력 가능합니다.");
    		return false;
    	}
    	document.form.submit();
    };
    
</script>

<body>
<header>
	<jsp:include page="header.jsp" />
</header>
	<div id="wrap">
		<form method="post" action="loginSelect.jsp" onsubmit="return loginChk()">

			<section>
				<div id="login">
					<div id="mainTitle">
						로그인
					</div>
					<div id="subTitle">
						<strong>로그인</strong>이 필요한 서비스입니다.
					</div>
					<div class="input-box">
		                <input id="id" type="text" name="cust_id" placeholder="아이디">
		                <label for="id">아이디</label>
		                <div id="nullId"></div>
		            </div>
		
		            <div class="input-box">
		                <input id="pw" type="password" name="cust_pw" placeholder="비밀번호">
		                <label for="pw">비밀번호</label>
		                <div id="nullPw"></div>
		            </div>
		            <div id="custCenter">
		            	<a href="#고객센터">로그인에 문제가 있으신가요?</a>
		            </div>
		            <div id="forgot">
		            	<a href="#아이디찾기">아이디 찾기 ㅣ </a>
		            	<a href="#비번찾기">비밀번호 찾기</a>
		            </div>
		            <input type="submit" value="로그인">
		            
		            <div class="sns-login">
		            <a href="#카카오 로그인" onclick="kakaoLogin()"><img src="img/login/kakao_login_medium_narrow.png"/></a>
		            <a href="#네이버로그인"><img src="img/login/naver_login.png" style="width:180px;height:45px;"/></a>
		            </div>
		        </div>
			</section>
		</form>
	</div>
<footer>
	<jsp:include page="footer.jsp" />
</footer>
</body>
<!-- 카카오 스크립트 -->
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<script>
Kakao.init('e9950da42ea3f40b10d8bafe103caf7f'); //발급받은 키 중 javascript키를 사용해준다.
console.log(Kakao.isInitialized()); // sdk초기화여부판단
//카카오로그인
function kakaoLogin() {
    Kakao.Auth.login({
      success: function (response) {
        Kakao.API.request({
          url: '/v2/user/me', //url은 고정
          success: function (response) {
        	  console.log(response);
        	   var kakao = JSON.stringify(response);
        	   
        	   var cust_id = kakao["id"];
        	   var cust_name = kakao["nickname"];
        	   var cust_pic = kakao["thumbnail_image_url"];
        	   $.ajax({
        		  url: 'check_id.jsp',
        		  method: 'POST',
        		  data : cust_id,
        		  success: function(resp){
        			 //성공했으면 이중 ajax로 data 넣기
        			 $.ajax({
        				 url : 'insert_info.jsp',
        				 method: 'POST',
        				 data : {cust_id : cust_id,
        					cust_pw2: cust_id,
        					cust_name : cust_name,
        					cust_pic : cust_pic
        				 },
        			 success: function(su){
        				 console.log("성공!");
        				 //kakao api 자체가 제공하는 게 많지 않아서 형식 상 로그인만 되고 실제 db에 저장하기는 현재 힘듦.
        			 	}
        			 
        			 });
        			 
        			 
        		  },
        		  error: function(xhr,status,err){
        			 //중복되는 아이디가 있을 경우 로그인 처리 완료
        			$.ajax({
        				url: 'loginSelect.jsp',
        				method : cust_id,
        				success:function(re){ //그냥 이동시켜서 로그인 후 세션에 저장시켜버리고 강제로 index이동
        					location.href="snsIndexList.sns";
        				}
        			});
        		  }
        	   });
        	   
        	   
        	  //location.href='snsIndexList.sns';
          },
          fail: function (error) {
            console.log(error)
          },
        })
      },
      fail: function (error) {
        console.log(error)
      },
    })
  }
  </script>
</html>

<% session.invalidate(); %>