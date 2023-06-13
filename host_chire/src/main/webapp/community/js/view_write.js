$(function(){
	$(".draggable").draggable({ containment: "#previewImg" });
	
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