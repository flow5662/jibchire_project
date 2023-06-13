<%@ page language="java" contentType="text/html;charset=utf-8" pageEncoding="utf-8" %> 
<!DOCTYPE html>
<html>
<head> <!--문서정보-->
	<meta charset="utf-8">
	<link rel="stylesheet" type="text/css" href="style/join.css">
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.1/css/all.css">
	<title>  </title>
</head> <!--문서내용-->

<% request.setCharacterEncoding("utf-8"); %>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script src="js/join.js"> </script>
<body>
	<!-- header -->
	<jsp:include page="header.jsp" /> <!-- 회원가입화면은 일반헤더 -->
 	<div class="naccs">
		<div class="grid">
			<!-- 좌측메뉴 -->
			<div class="gc gc--1-of-3">
			    <div class="menu">
			    	<!-- span light는 네모 -->
				    <div class="active"><span class="light"></span><span> 약관동의 </span></div>
				    <div><span class="light"></span><span> 회원가입 </span></div>
				    <!-- <div><span class="light"></span><span> 추가정보 </span></div>  --> 
			    </div>
			</div>

			<!-- 우측메뉴 --> <!-- 높이 주지 않으면 footer 올라옴 -->
			<div class="gc gc--2-of-3"> 
			    <ul class="nacc">
				    <li class="active">
					    <div id="agree"> <!-- 약관동의 내용 -->
					    	<input type="checkbox" id="all" > &nbsp전체동의 <br>
					    	 	<div class="agree_explain"> 전체 동의는 필수 및 선택정보에 대한 동의도 포함되어 있으며, 
					    	 		개별적으로도 동의를 선택하실 수 있습니다.<br>
									선택항목에 대한 동의를 거부하시는 경우에도 회원가입은 가능합니다.
								</div><br>
					    	<input type="checkbox" id="mustall" > &nbsp필수항목 전체동의 <br><br>
					    	<details open>
					    		<summary>
					    			<span> <input type="checkbox" class="must" name="must"> [필수] 만 14세 이상입니다.  </span>
					    		</summary>
					    		<div class="explain"> 다만, 회사는 아래 각 호의 경우에는 그 사유가 해소될 때까지 승낙을 유보하거나 승낙하지 않을 수 있습니다. 특히, 여러분이 만 14세 미만인 경우에는 부모님 등 법정대리인의 동의가 있는 경우에만 집치레계정을 생성할 수 있습니다.<br>
								1.회사가 본 약관 또는 세부지침에 의해 여러분의 집치레계정을 삭제하였던 경우<br>
								2.여러분이 다른 사람의 명의나 이메일 주소 등 개인정보를 이용하여 집치레계정을 생성하려 한 경우
								</div>	
					    	</details>
					    	<details open>
					    		<summary>
					    			<span> <input type="checkbox" class="must" name="must"> [필수] 집치레 회원가입 약관 </span>
					    		</summary>
					    		<div class="explain">여러분이 집치레계정 서비스를 이용할 때 아래 각 호의 행위는 하여서는 안 됩니다.<br>
								1.이용 신청 또는 변경 시 허위 사실을 기재하거나, 다른 회원의 집치레계정 및 비밀번호를 도용, 부정하게 사용하거나, 다른 사람의 명의를 사용하거나 명의자의 허락 없이 문자메시지(SMS) 인증 등을 수행하는 행위<br>
								2.타인의 명예를 손상시키거나 불이익을 주는 행위<br> 			
					    		</div>
					    	</details>
					    	<details open>
					    		<summary>
					    			<span> <input type="checkbox" class="choice" name="must"> [선택] 집치레 집치레톡 알림채널 추가 및 광고메세지 수신 </span>
					    		</summary>
					    		<div class="explain">여러분은 집치레계정 웹사이트 또는 개별 서비스 내 집치레계정 설정 화면을 통하여 여러분의 집치레계정 정보를 열람하고 수정할 수 있습니다. 다만, 집치레계정 서비스의 제공 및 관리를 위해 필요한 집치레계정, 전화번호, 단말기 식별번호, 기타 본인확인정보 등 일부 정보는 수정이 불가능할 수 있으며, 수정하는 경우에는 추가적인 본인 확인 절차가 필요할 수 있습니다. 여러분이 이용 신청 시 알려주신 내용에 변동이 있을 때, 직접 수정하시거나 이메일, 고객센터를 통하여 회사에 알려 주시기 바랍니다.    			
					    		</div>
					    	</details>
					    	<details open>
					    		<summary>
					    			<span> <input type="checkbox" class="must" name="must"> [필수] 개인정보 수집 및 이용동의</span>
					    		</summary>
					    		<div class="explain">여러분의 개인정보의 안전한 처리는 회사에게 있어 가장 중요한 일 중 하나입니다. 여러분의 개인정보는 서비스의 원활한 제공을 위하여 여러분이 동의한 목적과 범위 내에서만 이용됩니다. 법령에 의하거나 여러분이 별도로 동의하지 아니하는 한 회사가 여러분의 개인정보를 제3자에게 제공하는 일은 결코 없으므로, 안심하셔도 좋습니다. 회사가 여러분의 개인정보를 안전하게 처리하기 위하여 기울이는 노력이나 기타 자세한 사항은 개인정보처리방침을 참고하여 주십시오.
					    		</div>
					    	</details>
					    	<details open>
					    		<summary>
					    			<span> <input type="checkbox" class="choice" name="must"> [선택] 위치정보 수집 및 이용동의</span>
					    		</summary>
					    		<div class="explain">회사는 여러분과의 의견 교환을 소중하게 생각합니다. 여러분은 언제든지 고객센터(https://cs.kakao.com/)에 방문하여 의견을 개진할 수 있습니다. 서비스 이용자 전체에 대한 공지는 칠(7)일 이상 서비스 공지사항(https://www.kakao.com/notices)란에 게시함으로써 효력이 발생합니다. 여러분에게 중대한 영향을 미치는 사항의 경우에는 집치레계정에 등록된 이메일 주소로 이메일(이메일주소가 없는 경우 서비스 내 전자쪽지 발송, 서비스 내 알림 메시지를 띄우는 등의 별도의 전자적 수단) 발송 또는 여러분이 등록한 휴대폰번호로 집치레톡 메시지 또는 문자메시지 발송하는 방법 등으로 개별적으로 알려 드리겠습니다.					    			
					    		</div>
					    	</details>
					    	<details open>
					    		<summary>
					    			<span> <input type="checkbox" class="choice" name="must"> [선택] 프로필정보 추가 및 수집 동의</span>
					    		</summary>
					    		<div class="explain">회사는 법령상 허용되는 한도 내에서 서비스와 관련하여 본 약관에 명시되지 않은 어떠한 구체적인 사항에 대한 약정이나 보증을 하지 않습니다. 또한, 회사는 CP(Contents Provider)가 제공하거나 회원이 작성하는 등의 방법으로 서비스에 게재된 정보, 자료, 사실의 신뢰도, 정확성 등에 대해서는 보증을 하지 않으며, 회사의 과실 없이 발생된 여러분의 손해에 대하여는 책임을 부담하지 아니합니다.					    			
					    		</div>
					    	</details>
					    </div>
				    </li>
				    <li>
					    <!--  회원가입 내용 -->
			    	 	<jsp:include page="join_info.jsp" />
				    </li>
			    </ul>
			</div>
		</div>
	</div>
	<!-- footer -->
    <jsp:include page="footer.jsp" />

</body>
</html>