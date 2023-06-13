
function send(){   //onsubmit에 대한 메소드. 빈칸이거나 중복확인 버튼 누르지 않으면 넘어가는 것 불가
		var id = $("input:button[name=cust_id_b]").attr("disabled"); //아이디사용버튼
		var name = $("input:text[name=cust_name]").val(); 
		var sb = $("input[type=radio]:checked").val();
		var vr2 = $("#verify_bt2").attr("disabled");
		var email = $("#email").val();
		var emailadr = $("#emailbox").prop("selected",true).val();

		if(typeof id == "undefined"){
			alert("아이디 사용을 눌러주세요");
			return false;
		}else if(name==""){
			alert("이름을 입력해주세요");
			return false;
		}else if(typeof sb == "undefined"){
			alert("성별을 선택해주세요");
			return false;
		}else if(typeof vr2 == "undefined"){
			alert("핸드폰 인증번호를 확인해주세요");
			return false;
		}else if(email == ""){
			alert("메일을 입력해주세요");
			return false;
		}else if(emailadr == "choose"){
			alert("이메일 주소를 선택해주세요 ");
			return false;
		}
		else{
			
		}

}

function sample4_execDaumPostcode() {
	new daum.Postcode({
		oncomplete: function(data) {
	    // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

	    // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
	    // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
	    var roadAddr = data.roadAddress; // 도로명 주소 변수
	    var extraRoadAddr = ''; // 참고 항목 변수

	    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
	    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
	    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
	        extraRoadAddr += data.bname;
	    }
	    // 건물명이 있고, 공동주택일 경우 추가한다.
	    if(data.buildingName !== '' && data.apartment === 'Y'){
	       extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
	    }
	    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
	    if(extraRoadAddr !== ''){
	        extraRoadAddr = ' (' + extraRoadAddr + ')';
	    }

	    // 우편번호와 주소 정보를 해당 필드에 넣는다.
	    document.getElementById('sample4_postcode').value = data.zonecode;
	    document.getElementById("sample4_roadAddress").value = roadAddr;
	    document.getElementById("sample4_roadAddress").value = data.jibunAddress; //지번, 도로명 주소 한 번에 넣기
	    
	    // 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
	    if(roadAddr !== ''){
	        document.getElementById("sample4_extraAddress").value = extraRoadAddr;
	    } else {
	        document.getElementById("sample4_extraAddress").value = '';
	    }

	    var guideTextBox = document.getElementById("guide");
	    // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
	    if(data.autoRoadAddress) {
	        var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
	        guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
	        guideTextBox.style.display = 'block';

	    } else if(data.autoJibunAddress) {
	        var expJibunAddr = data.autoJibunAddress;
	        guideTextBox.innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
	        guideTextBox.style.display = 'block';
	    } 
	}
	}).open();
}


$(function(){
	
	$("#success,#fail").hide();    //비밀번호 확인 메세지 띄워주기 위해서 일단 가려놓음. 

    // 생년월일 selectbox 만들기 위한 변수선언
	var now = new Date();
    var year = now.getFullYear();
    var mon = (now.getMonth() + 1) > 9 ? ''+(now.getMonth() + 1) : '0'+(now.getMonth() + 1); 
    var date = (now.getDate()) > 9 ? ''+(now.getDate()) : '0'+(now.getDate()); 

    //년도 selectbox만들기               
    for(var i = 1900 ; i <= year ; i++) {
        $('#year').append('<option value="' + i + '">' + i + '년</option>');    
    }
    // 월별 selectbox 만들기            
    for(var i=1; i <= 12; i++) {
        var mm = i > 9 ? i : "0"+i ;            
        $('#month').append('<option value="' + mm + '">' + mm + '월</option>');    
    }
    // 일별 selectbox 만들기
    for(var i=1; i <= 31; i++) {
        var dd = i > 9 ? i : "0"+i ;            
        $('#date').append('<option value="' + dd + '">' + dd+ '일</option>');    
    }
    // 오늘날짜로 select될 수 있게 하기
    $("#year  > option[value="+year+"]").attr("selected", "true");        
    $("#month  > option[value="+mon+"]").attr("selected", "true");    
    $("#date  > option[value="+date+"]").attr("selected", "true");  


    //아이디를 입력할 때 바로 중복확인! '사용가능, 사용불가능' 즉시 알려주기 
	$("#id").keyup(function(){   //length는 maxlength와 value로 조절 

		var input_id = $("#id").val();
		var exp = /[\{\}\[\]\/?.,;:|\)*~`!^\+┼<>@\#$%&\'\"\\\(\=]/gi; 
		if(exp.test(input_id)) {
			$("#idchecked").html("/,},?,^,%,$,#,@,*,&,~ 등의 특수문자는 사용불가합니다");
		}else{
			$.ajax({
				url : "check_id.jsp?cust_id="+input_id ,  
				dataType : "html",
				//data : "post",
				success : function(check){
					$("#idchecked").html(check);				
				}
			});
		}	
	});

	// '아이디 사용하기' 버튼을 눌러서 txt입력박스와 버튼 모두 비활성화시키기.
	$("input:button[name=cust_id_b]").click(function(){   

		var input_id = $("#id").val();
		var result = $("#idchecked").text();
		if(input_id ==""){
			alert("아이디를 입력해주세요 ");
		}else if(result.match("불가능")){         		// match : 특정문자가 들어가있는지 확인해주는 함수
			alert("사용가능한 아이디를 입력해주세요.");    // 데이터작업을 통해 사용불가능한 id는 넘어가지 못한다
		}else {
			var cnfm = confirm("아이디로 '" + input_id +"' 를 사용하시겠습니까?");
			if(cnfm){
				$("input:button[name=cust_id_b]").attr("disabled","disabled");  //아이디가 사용가능할 때 버튼 사용불가로 바꾸기
				$("#id").attr('readonly',true);        						    //아이디가 사용가능할 때 txt박스 수정 불가			
			}
		}	
	});
  	
  	// 처음 입력한 비밀번호와 두번째로 입력한 비밀번호가 일치하는지 점검하기
	$("#pw2").keyup(function(){
		var pw1 = $("#pw1").val();
		var pw2 = $("#pw2").val();
		if(pw1 !== "" || pw2 !== ""){
			if(pw1 == pw2){
				$("#success").show();
				$("#fail").hide();
			}
			else{
				$("#fail").show();
				$("#success").hide();
			}
		}		
	});

	// 인증번호 발송버튼을 눌러 인증번호 보내기. 
	$("#verify_bt1").click(function(){
		var phn1 = $("#cell").prop("selected",true).val();
		var phn2 = $("#cellphone").val();

		if(phn1 == "choose"){
			alert("통신사를 선택해주세요");
		}else if(phn2 ==""){
			alert("핸드폰 번호를 입력해주세요");
		}else{
			alert("인증번호 : 123123 을 입력해주세요");
			$(this).attr("disabled","disabled");
		}
	});

	// 인증번호 확인하기
	$("#verify_bt2").click(function(){
		//alert("");
		var num = $("#verify").val();
		if(num == "전송된 인증번호를 입력해주세요" || num == ""){
			alert("인증번호를 입력해주세요");
		}else if(num == "123123"){
			alert("인증번호가 일치합니다");
			$(this).attr("disabled","disabled");
		}else{
			alert("인증번호가 올바르지 않습니다");
		}
	});

	//이메일주소 select 중 '직접입력'을 선택했을 때 직접입력 text박스 readonly 풀어주기
	$("#emailbox").click(function(){
		if($("#emailbox").prop("selected",true).val()==""){
			$("#email_input").attr('readonly',false);
		}else{
			$("#email_input").attr('readonly',true);
		}
	});

/* onsubmit으로 제어하기 위해서 주석처리 
	$("#forward").click(function(){
		var id = $("input:button[name=cust_id_b]").attr("disabled");
		var name = $("input:text[name=cust_name]").val();
		var birth = $("input:text[name=cust_birth]").val();
		var sb = $("input[type=radio]:checked").val();
		var vr2 = $("#verify_bt2").attr("disabled");
		var email = $("#email").val();
		var emailadr = $("#emailbox").prop("selected",true).val();

		if(typeof id == "undefined"){
			alert("아이디 중복확인을 실행해주세요");
		}else if(name==""){
			alert("이름을 입력해주세요");
		}else if(birth=""){
			alert("생일을 입력해주세요")
		}else if(typeof sb == "undefined"){
			alert("성별을 선택해주세요");
		}else if(typeof vr2 == "undefined"){
			alert("핸드폰 인증번호를 확인해주세요");
		}else if(email == ""){
			alert("메일을 입력해주세요");
		}else if(emailadr == "choose"){
			alert("이메일 주소를 선택해주세요 ");
		}
		else{
			alert("가입이 완료되었습니다");
		}

	});
*/
});

