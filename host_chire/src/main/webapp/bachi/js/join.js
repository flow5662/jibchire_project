/**
 * 
 *//* 
$(document).on("click", ".naccs .menu div", function() {
	var numberIndex = $(this).index(); //몇번째 자식이냐 ? 

	if (!$(this).is("active")) {
		$(".naccs .menu div").removeClass("active");
		$(".naccs ul li").removeClass("active");

		$(this).addClass("active");
		$(".naccs ul").find("li:eq(" + numberIndex + ")").addClass("active");

		var listItemHeight = $(".naccs ul")
			.find("li:eq(" + numberIndex + ")")
			.innerHeight();
		$(".naccs ul").height(listItemHeight + "px");
	}
});
*/

$(function(){

	$(".naccs .menu div").click(function(){ // 각각의 메뉴 클릭할 때마다 우측의 내용이 바뀌는 것
		var numberIndex = $(this).index();  // 몇번째 자식? 

		if (!$(this).is("active")) {
			$(".naccs .menu div").removeClass("active");
			$(".naccs ul li").removeClass("active");

			$(this).addClass("active");
			$(".naccs ul").find("li:eq(" + numberIndex + ")").addClass("active");

			var listItemHeight = $(".naccs ul")
				.find("li:eq(" + numberIndex + ")")
				.innerHeight();
			$(".naccs ul").height(listItemHeight + "px");
		}
	});


	$("#mustall").click(function(){  //필수항목 전체동의를 누르면 필수항목 모두 선택되는 것
		var aa = $("#mustall").is(":checked");
		if(aa){
			$(".must").prop("checked",true);
			$("#mustall").prop("checked",true);
		}else{
			$(".must").prop("checked",false);
			$("#mustall").prop("checked",false);
		}
	});

	$("#all").click(function(){  //전체항목 동의 누르면 모든 checkbox 선택됨
		var aa = $("#all").is(":checked");
		if(aa){
			$("input[type=checkbox]").prop("checked",true);
		}else{
			$("input[type=checkbox]").prop("checked",false);
		}

	});




});
