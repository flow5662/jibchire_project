<%@ page language="java" contentType="text/html;charset=utf-8" pageEncoding="utf-8" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title></title>
</head>

<style>
	/*푸터 전체 폰트 적용*/
	@import url('https://cdn.rawgit.com/moonspam/NanumSquare/master/nanumsquare.css');
	html{
		font-family: 'NanumSquare';
	}
	/*푸터 전체 영역*/
	#footer {
		width: 1280px; height: 230px;
		margin: 0 auto;
	}
    #line {
      width: 100%;
      border-top: 1px solid #444444;
       margin: 30px 0px;
    }
	a {text-decoration: none; color: gray;}
	
	/*고객센터 영역*/
	#custom {
		width: 300px; height: 300px;
	}
	/*고객센터 글자*/
	#custom #custCenter {
		font-size: 25px; font-weight: bold;
		color: #550000;
		margin-left: 70px;
	}
	/*전화번호*/
	#custom #custCenterNum {
		font-size: 20px; font-weight: bold;
		margin-left: 90px;
	}
	/*운영시간*/
	#custom #custCenterNumDetail {
		color: gray;
		width: 150px; height: 60px;
		margin-left: 75px;
	}
	#custom #custCenterNumDetail li { display: inline; }
	
	/*회사소개 영역*/
	#company {
		width: 500px; height: 250px;
		margin-top: -300px; margin-left: 370px;
	}
	/*회사*/
	#company #comInfo {
		font-size: 20px; font-weight: bold;
		margin-left: 210px;
	}
	/*회사정보*/
	#company #comInfoDetail {
		color: gray;
		width: 500px; height: 60px;
	}
	#company #comInfoDetail #com1 { margin-left: 65px; }
	#company #comInfoDetail #com2 { margin-left: 100px; }
	#company #comInfoDetail #com3 { margin-left: 85px; }
	#company #comInfoDetail #com4 { margin-left: 95px; }
	#company #comInfoDetail #com5 { margin-left: 20px; }
	
	/*이용정보 영역*/
	#document1 {
		width: 530px; height: 300px;
		margin-top: -250px; margin-left: 750px;
	}
	/*고객안내*/
	#document1 #docCust {
		font-weight: bold;
		margin-top: -200px; margin-left: 250px;
	}
	#document1 #docCustDetail {
		width: 70px; height: 150px;
		margin-top: 10px; margin-left: 250px;
	}
	#document1 #docCustDetail #c1 { margin-bottom: 3px; }
	#document1 #docCustDetail #c2 { margin-bottom: 3px; }
	#document1 #docCustDetail #c3 { margin-bottom: 3px; }
	#document1 #docCustDetail #c4 { margin-bottom: 3px; }
	#document1 #docCustDetail #c5 { margin-bottom: 3px; }
	/*고객센터*/
	#document1 #docCustCenter {
		font-weight: bold;
		margin-top: -180px; margin-left: 370px;
	}
	#document1 #docCustCenterDetail {
		width: 100px; height: 150px;
		margin-top: 10px; margin-left: 350px;
	}
	#document1 #docCustCenterDetail #cc1 { margin-top: -5px; }
	#document1 #docCustCenterDetail #cc2 { margin-left: 20px; }
	#document1 #docCustCenterDetail #cc3 { margin-left: 10px; }
	
	/*약관 영역*/
   #document2 {
      width: 700px; height: 30px;
      margin-top: -130px; margin-left: 290px;
   }
   #document2 #docRegDetail {
      width: 650px; height: 30px;
   }
   #document2 #docRegDetail li {
      display: inline;
      margin-left: 10px;
   }
	
	/*sns 영역*/
	#sns {
		margin-top: -40px; margin-left: 1030px;
	}
	#sns img {
		width: 30px; height: 30px;
	}
</style>

<body>
	<!-- 푸터 구분선 -->
	<div id="line"></div>
	<!-- 푸터 전체 감싸는 영역 -->
	<div id="footer">
		
		<!-- 고객센터 영역 -->
		<div id="custom">
			<div id="custCenter">회원 고객센터</div>
			<div id="custCenterNum">1689-0210</div>
			<ul id="custCenterNumDetail">
				<li>평일:08:00~17:00</li>
				<li>점심:13:00~14:00</li>
				<li>주말/공휴일:휴무</li>
			</ul>
		</div>
		
		<!-- 회사소개 영역 -->
		<div id="company">
			<div id="comInfo">회사 정보</div>
			<div id="comInfoDetail">
				<div id="com1">상호명:(주)집치레 &nbsp;&nbsp;&nbsp; 사업자등록번호:513-22-78410</div>
				<div id="com2">통신판매업신고:제 2023-서울강남-73509 호</div>
				<div id="com3">직업정보제공사업 신고번호:서울청 제 2022-00호</div>
				<div id="com4">대표이사:원지민 &nbsp;&nbsp;&nbsp; 개인정보관리책임자:정민주</div>
				<div id="com5">주소:서울특별시 강남구 강남대로96길 16, 그린아이티아카데미학원</div>
			</div>
		</div>
		
		<!-- 이용정보 영역 -->
		<div id="document1">
			<div id="docCust">고객안내</div>
			<div id="docCustDetail">
				<div id="c1"><a href="#">회사소개</a></div>
				<div id="c2"><a href="#">채용안내</a></div>
				<div id="c3"><a href="#">이용안내</a></div>
				<div id="c4"><a href="#">안전정책</a></div>
				<div id="c5"><a href="#">공지사항</a></div>
			</div>
			<div id="docCustCenter">고객센터</div>
			<div id="docCustCenterDetail">
				<div id="cc1"><a href="#">자주 묻는 질문</a></div>
				<div id="cc2"><a href="#">1:1 문의</a></div>
				<div id="cc3"><a href="#">비회원 문의</a></div>
			</div>
		</div>
		<!-- 약관 영역 -->
		<div id="document2">
			<ul id="docRegDetail">
				<li id="reg1"><a href="#">이용약관 ㅣ </a></li>
				<li id="reg2"><a href="#">개인정보처리방침 ㅣ </a></li>
				<li id="reg3"><a href="#">위치기반 서비스 이용약관 ㅣ </a></li>
				<li id="reg4"><a href="#">사업자 정보확인</a></li>
			</ul>
		</div>
		
		<!-- sns 영역 -->
		<div id="sns">
			<img alt="facebook" src="img/footer/icon_fb.png" onclick="location.href='https://www.facebook.com/'" />
			<img alt="instagram" src="img/footer/icon_insta.png" onclick="location.href='https://www.instagram.com/'" />
			<img alt="naver_blog" src="img/footer/icon_naver.png" onclick="location.href='https://section.blog.naver.com/BlogHome.naver?directoryNo=0&currentPage=1&groupId=0'" />
			<img alt="youtube" src="img/footer/icon_youtube.png" onclick="location.href='https://www.youtube.com/'" />
		</div>
	</div>
</body>
</html>