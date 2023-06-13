
$(function(){
	const label = document.querySelectorAll('.label');

	label.forEach(function(lb){
	    lb.addEventListener('click', e => {
	        let optionList = lb.nextElementSibling;
	        let optionItems = optionList.querySelectorAll('.optionItem');
	        clickLabel(lb, optionItems);
	    })
	});
	const clickLabel = (lb, optionItems) => {
	    if(lb.parentNode.classList.contains('active')) {
	        lb.parentNode.classList.remove('active');
	        optionItems.forEach((opt) => {
	            opt.removeEventListener('click', () => {
	                handleSelect(lb, opt)
	            })
	        })
	    } else {
	        lb.parentNode.classList.add('active');
	        optionItems.forEach((opt) => {
	            opt.addEventListener('click', () => {
	                handleSelect(lb, opt)
	            })
	        })
	    }
	}
	const handleSelect = (label, item) => {
	    label.innerHTML = item.textContent;
	    label.parentNode.classList.remove('active');
	}

	// 방개수에 대한 select의 option 추가하기
	for(var i = 1; i<6; i++){
		$("#rooms").append("<option value="+ i +">"+i+"개 </option>");
		if(i==5){
			$("#rooms").append("<option value = 6> 6명이상 </option>");
		}
	}	
	// 집평수에 대한 select의 option 추가하기
	for(var i = 5; i<31; i+=5){
		$("#m2").append("<option value="+ i +">"+i+"평이상 </option>");
		if(i==30){
			$("#m2").append("<option value = 35> 35평이상 </option>");
		}
	}
	// 가족인원수에 대한 select의 option 추가하기
	for(var i = 1; i<6; i++){
		$("#fam").append("<option value="+ i +">"+i+"명 </option>");
		if(i==5){
			$("#fam").append("<option value = 6> 6명이상 </option>");
		}
	}
	// 집연식에 대한 select의 option 추가하기
	for(var i = 0; i<21; i+=5){
		if(i==0){
			$("#houseold").append("<option value=0> 5년미만 </option>");			
		}else{
			$("#houseold").append("<option value="+ i +">"+i+"년이상 </option>");
			if(i==20){
				$("#houseold").append("<option value = 25> 20년이상 </option>");
				$("#houseold").append("<option value=0> 잘모르겠음 </option>");	
			}
		}	
	}
	$("img").mouseenter(function(){
		$(this).css("scale","1.05");
		$(this).css("cursor","pointer");
	});
	$("img").mouseleave(function(){
		$(this).css("scale","1.0");
	});

	/*
	$(".pic").click(function(){ //게시글 누르면 해당 게시글로 이동
		var pid= $("this>input[type=hidden]").val();     // 선택한 td칸의 뒤에 있는(동위) hidden버튼
		location.href="view_read.jsp?post_id="+pid   // 왜 자꾸 3이 나오지?
	});
	*/
	
	
});