<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>바치등록</title>
</head>
<style>
.warp{
margin:0 auto;
}
textarea{
font-family: 'NanumSquare';
padding: 10px 0 0 10px; 
}
.menu_all{
display: flex;
    flex-direction: column;
    align-items: center;
    width: 1280px;
    margin: 0 auto;
    padding-top: 60px;
    padding-bottom: 20px;
}
.intro{
max-width: 378px;
max-height: 378px;
}

.menu_all .menu_section{
display: flex;
    align-items: center;
    gap: 10px;
}
.menu_all .input_area .intro{
width:300px;
height: 90px;
}
.input_time{
    display: flex;
    padding-top: 20px;
    align-items: center;
    gap: 10px;

}
select{
width:150px;
height: 50px;

  padding: 5px 30px 5px 10px;
  border-radius: 4px;
  outline: 0 none;
}
.input-text-button{
display:flex;
gap:5px; 
}
#sample5_address{
width: 300px;
height: 50px;
padding: 5px 10px 5px 10px;
}
#adr-btn{
background-color: #789849;
width:90px;
color: white;
border: none;
    border-radius: 8px;
}
#adr-btn:hover{
background-color: #7e8377;
color: white;

}
#compony{
width:350px;
height: 50px;
padding: 5px 10px 5px 10px;
}
.menu_all input[type="time"]{
width:200px;
height: 50px;
border: 1px solid lightgray;
}
.menu_all input[type="text"]{
border: 1px solid lightgray;
}
select{
border: 1px solid lightgray;
}
textarea{
border: 1px solid lightgray;
}
#idcheck{
background-color: #789849;
width:120px;
height: 50px;
color: white;
border: none;
    border-radius: 8px;
}
#idcheck:hover{
background-color: #7e8377;
color: white;

}
.input_area{
margin-top: 30px;
margin-bottom: 30px;

}
.submit-id{
padding-top: 60px;
}
h4{padding-top: 20px;padding-bottom: 20px;}
.menu_text{
padding-bottom: 50px;
}
.menu{
padding-top: 20px;
}
</style>
<body>
    <!-- 헤더 -->
    <div class="wrap">
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
<form method="post" action="bachi_info.bc"> 
<input type="hidden" name="cust_id" value="<%=id%>" id="cust_id">

<div class="menu_all">
<div class="menu_text">
<h2>바치등록</h2>

</div>
<span style="border-bottom: 4px solid lightgray; width: 600px;"></span>
<div class="menu">
<div class="menu_section">
<h4>카테고리</h4>
<select name="gosu_menu1" id="gosu_menu1">
	<option value="취미">취미</option>
	<option value="자기계발">자기계발</option>
	<option value="레슨">레슨</option>
	
</select>

<select name="gosu_menu2" id="gosu_menu2">
	<option value="요리">요리</option>
	<option value="컨설팅">컨설팅</option>
	<option value="수학레슨">수학레슨</option>
	<option value="음악레슨">음악레슨</option>
</select>
</div>

<div class="input_area">
<h4>소개글</h4>
<textarea name="gosu_intro" class="intro"></textarea></div>
<div class="input_area">
<h4>경력</h4>
<!--  <input type="text" name="gosu_car" placeholder="숫자만 입력해주세요." oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');">-->
<select name="gosu_car" >
	<option value="0">경력없음</option>
	<%
		for(int i=1;i<50;i++){
			out.println("<option value='"+i+"'>"+i+"년"+"</option>");
			
		}
	%>
	
</select>




</div>
<div class="input_area">
<h4>활동가능지역</h4>
<div class="input-text-button">
<input type="text" name="gosu_reg" id="sample5_address" placeholder="주소"><input type="button" id="adr-btn" onclick="sample5_execDaumPostcode()" value="주소 검색">
</div>
</div>
<div class="input_area">
<div id="map" style="width:500px;height:500px;margin-top:10px;display:none"></div>
</div>
<div class="input_area">
<h4>사업자번호</h4>
<input type="text" name="gosu_comp" id="compony"></div>
<div class="input_time">
<h4>활동가능시간</h4>
<input type="time" name="worktime_s"> <!-- 스크립트 기능 중 e가 s보다 시간이 빠르면 안됨. -->
<input type="time" name="worktime_e"></div>
</div>


<div class="submit-id">
<input type="submit" value="바치등록" id="idcheck">
</div>
</div>
</form>


    <div style="margin-left: auto; margin-right: auto;">
	<jsp:include page="footer.jsp" />
	</div>
</div>
</body>
<script>
$(document).ready(function(){
    $("#idcheck").click(function(event) { // id 확인 버튼 클릭 시
        event.preventDefault(); // 기본 이벤트인 submit 막기
        $.ajax({
            url : "bachi_select_id.bc",
            data : {cust_id: $("#cust_id").val() },
            type : "post",
            success: function(result){
                if(result === "false"){ // "false" 값이 반환되면
                    alert("중복된 아이디입니다.");
                } else {
                    $("form").submit(); // 중복되지 않은 경우에만 submit 실행
                }
            }
        });
    });
});


const gosu_menu1 = document.getElementById('gosu_menu1');
const gosu_menu2 = document.getElementById('gosu_menu2');

// 대분류 select 요소의 값이 변경될 때 실행되는 함수
function updateSubMenu() {
  // 선택된 대분류의 값에 따라 중분류 select 요소의 option 값을 변경합니다.
  if (gosu_menu1.value === '취미') {
    gosu_menu2.innerHTML = `
      <option value="요리">요리</option>
      <option value="DIY">DIY</option>
    `;
  } else if (gosu_menu1.value === '자기계발') {
    gosu_menu2.innerHTML = `
      <option value="컨설팅">컨설팅</option>
      <option value="어학">어학</option>
    `;
  } else if (gosu_menu1.value === '레슨'){
	  gosu_menu2.innerHTML = `
	      <option value="수학레슨">수학레슨</option>
	      <option value="음악레슨">음악레슨</option>
	    `;
	  
	  
  }
}

// 대분류 select 요소의 값이 변경될 때 updateSubMenu 함수를 실행합니다.
gosu_menu1.addEventListener('change', updateSubMenu);



</script>

<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=e9950da42ea3f40b10d8bafe103caf7f&libraries=services"></script>
<script> //카카오 지도 api
    var mapContainer = document.getElementById('map'), //지도를 표시할 div
        mapOption = {
            center: new daum.maps.LatLng(37.537187, 127.005476), // 지도의 중심좌표
            level: 5 // 지도의 확대 레벨
        };

    //지도를 미리 생성
    var map = new daum.maps.Map(mapContainer, mapOption);
    //주소-좌표 변환 객체를 생성
    var geocoder = new daum.maps.services.Geocoder();
    //마커를 미리 생성
    var marker = new daum.maps.Marker({
        position: new daum.maps.LatLng(37.537187, 127.005476),
        map: map
    });


    function sample5_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                var addr = data.address; // 최종 주소 변수

                // 주소 정보를 해당 필드에 넣는다.
                document.getElementById("sample5_address").value = addr;
                // 주소로 상세 정보를 검색
                geocoder.addressSearch(data.address, function(results, status) {
                    // 정상적으로 검색이 완료됐으면
                    if (status === daum.maps.services.Status.OK) {

                        var result = results[0]; //첫번째 결과의 값을 활용

                        // 해당 주소에 대한 좌표를 받아서
                        var coords = new daum.maps.LatLng(result.y, result.x);
                        // 지도를 보여준다.
                        mapContainer.style.display = "block";
                        map.relayout();
                        // 지도 중심을 변경한다.
                        map.setCenter(coords);
                        // 마커를 결과값으로 받은 위치로 옮긴다.
                        marker.setPosition(coords)
                    }
                });
            }
        }).open();
    }
</script>
</html>