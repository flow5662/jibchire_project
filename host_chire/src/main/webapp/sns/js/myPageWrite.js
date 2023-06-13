$(function(){
	
	// 방개수에 대한 select의 option 추가하기
	for(var i = 1; i<3; i++){
		$("#rooms").append("<option value="+i+">"+i+"개 </option>");
		if(i==3){
			$("#rooms").append("<option value ="+4+"> 4개이상 </option>");
		}
	}	
	// 집평수에 대한 select의 option 추가하기
	for(var i = 5; i<31; i+=5){
		$("#m2").append("<option value="+i+">"+i+"평이상 </option>");
		if(i==30){
			$("#m2").append("<option value ="+35+" > 35평이상 </option>");
		}
	}
	// 가족인원수에 대한 select의 option 추가하기
	for(var i = 1; i<6; i++){
		$("#fam").append("<option value="+i+">"+i+"명 </option>");
		if(i==5){
			$("#fam").append("<option value = 6> 6명이상 </option>");
		}
	}
	// 집연식에 대한 select의 option 추가하기
	for(var i = 0; i<21; i+=5){
		if(i==0){
			$("#houseold").append("<option value=0> 5년미만 </option>");			
		}else{
			$("#houseold").append("<option value="+i+">"+i+"년이상 </option>");
			if(i==20){
				$("#houseold").append("<option value = 25> 20년이상 </option>");
				$("#houseold").append("<option value=0> 잘모르겠음 </option>");	
			}
		}	
	}
	// 공사시작일, 공사마감일에 대한 select의 옵션 추가하기
    // 생년월일 selectbox 만들기 위한 변수선언
	var now = new Date();
    var year = now.getFullYear();
    var mon = (now.getMonth() + 1) > 9 ? ''+(now.getMonth() + 1) : '0'+(now.getMonth() + 1); 
    var date = (now.getDate()) > 9 ? ''+(now.getDate()) : '0'+(now.getDate()); 

    //년도 selectbox만들기               
    for(var i = 2020 ; i <= year ; i++) {
        $('#startdate_year').append('<option value="'+i+'">' + i + '년</option>');  
        $('#enddate_year').append('<option value="'+i+'">' + i + '년</option>');    
    }
    // 월별 selectbox 만들기            
    for(var i=1; i <= 12; i++) {
        var mm = i > 9 ? i : "0"+i ;            
        $('#startdate_month').append('<option value="'+mm+'">' + mm + '월</option>');
        $('#enddate_month').append('<option value="'+mm+'">' + mm + '월</option>');    
    }
    // 일별 selectbox 만들기
    for(var i=1; i <= 31; i++) {
        var dd = i > 9 ? i : "0"+i ;            
        $('#startdate_date').append('<option value="'+dd+'">' + dd+ '일</option>');  
        $('#enddate_date').append('<option value="'+dd+'">' + dd+ '일</option>');   
    }
    


});