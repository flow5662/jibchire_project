<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>draggable</title>
	<link rel="stylesheet" type="text/css" href="style/view_write.css">
<link rel="stylesheet"href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
<link rel="stylesheet" href="/resources/demos/style.css">
</head>

<style>
#pic{width:500px; height:1200px; margin: 0 auto;}
#draggable {	width: 150px;	height: 150px;	padding: 0.5em; }

/*아이콘 박스*/
#icons{margin : 3% 0 0 3%;}
.draggable{z-index: 3;}
.iteminfo{width : 300px; height: 110px;  position: relative; background-color: white; display: none; z-index: 4; opacity: 0.9;}
/*큰박서*/
.postPics{width: 100%; height:780px; position: relative;  overflow: hidden;  margin: 20px auto 0 auto;}
.postPics .pics{margin: 0 auto; object-fit:cover; float: left;     margin: 20px 0 0 2%;}
#previewImg{width: 100%; height: 100%; object-fit:cover;}

/*작업 후 넘어가기*/
.postItem{    width: 140px;    float: left;    margin : 20px 3% 0 1%;}

/*맨 오른쪽*/
.uploaditem{width: 230px;    float: left;    margin-top: 20px;}
.uploaditem li {width: 100%;  height: 190px; margin-top: 12px;}
.uploaditem li h5{text-align: center;}
.uploaditem li .register{    text-align: center;    margin-top: 15px;    font-weight: 900;}
.uploaditem li .register:hover{cursor:pointer;}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
<script>
	//첨부파일 삽입하면 이미지 미리보기
	function readImage(input) {  
	
	  if (input.files && input.files[0]) { // 인풋 태그에 파일이 있는 경우
	    var reader = new FileReader();  // FileReader 인스턴스 생성
	    reader.onload = function(e) {
	      document.getElementById('previewImg').src = e.target.result;
	    };
	    reader.readAsDataURL(input.files[0]);
	  } 
	  else {
	    document.getElementById('previewImg').src = "";
	  }
	}
	/* draggable의 범위 한정*/
	$(function() {
		$(".draggable").draggable({ containment: "#previewImg" });
		
		$("aside").hide();
		/*검색어 바뀔때마다 내용 바꾸기*/
		$("#searchwordbutton").click(function(){
			var searchword = $("#searchwordinput").val();
			$.ajax({
				url : "iconselect.sns?searchword="+searchword,  
				dataType : "html",
				//data : "post",
				success : function(check){
					alert(check);
					$("#searchresult").html(check);
				}
			});
		});
		
		/*아이콘 더블클릭했을 때 상품고르기*/
		$(".draggable").dblclick(function(){
// 			alert("더블클릭에 이벤트 걸 것!!!");
			$("aside").show();
			
			var icon = $(this).attr("id");
			for(var i = 1 ; i<=10 ; i++){
				var iconid = "icon"+i; 
				if(iconid==icon){
					var id = "#"+iconid;
					var top = $(id).css("top");
					var left = $(id).css("left");
// 					alert("top="+top+"left="+left);
					$(".iteminfo").css("top".top);
					$(".iteminfo").css("left".left);
					$(".iteminfo").show();
				}
			}
			$(".iteminfo").show;
		});
		$(".uploaditem li:nth-child(1) .register").click(function(){
			/* inputtype hidden이든 뭐든 데이터 저장저장~~~*/
			for(var i = 1 ; i<=10 ; i++){
				 var iconid = "#icon"+i;
			     var itemid = ""; //여기에 아이템 아이디 넣기 
				 var iconvalue = "input:hidden[name='icon"+i+"']";
				 var top = $(iconid).css("top");
				 var left = $(iconid).css("left");
				 var position = top +","+left+",";
				 $(iconvalue).attr("value",position);
				 $(iconvalue).val(position);
			}

			/*위치 변경*/
			var src = $("#previewImg").attr("src");
			$(".draggable").css("top",0);
			$(".draggable").css("left",0);
			$("#previewImg").attr("src","");
			$(".postItem li:nth-child(1) img").attr("src",src);
		});
		$(".uploaditem li:nth-child(2) .register").click(function(){
			/* inputtype hidden이든 뭐든 데이터 저장저장~~~*/
			
			/*위치 변경*/
			var src = $("#previewImg").attr("src");
			$(".draggable").css("top",0);
			$(".draggable").css("left",0);
			$("#previewImg").attr("src","");
			$(".postItem li:nth-child(2) img").attr("src",src);
		});
		$(".uploaditem li:nth-child(3) .register").click(function(){
			/* inputtype hidden이든 뭐든 데이터 저장저장~~~*/
			
			/*위치 변경*/
			var src = $("#previewImg").attr("src");
			$(".draggable").css("top",0);
			$(".draggable").css("left",0);
			$("#previewImg").attr("src","");
			$(".postItem li:nth-child(3) img").attr("src",src);
		});
		$(".uploaditem li:nth-child(4) .register").click(function(){
			/* inputtype hidden이든 뭐든 데이터 저장저장~~~*/
			
			/*위치 변경*/
			var src = $("#previewImg").attr("src");
			$(".draggable").css("top",0);
			$(".draggable").css("left",0);
			$("#previewImg").attr("src","");
			$(".postItem li:nth-child(4) img").attr("src",src);
		});
	});
</script>
<body>

	<div id="wrap">
<!-- 		<aside id ="searchbox" style="position:fixed; top:200px; left:100px; border:1px solid gray; width: 200px; height: 150px; "> -->
<!-- 			<div id = "searchinput"> -->
<!-- 				<input type="text" placeholder="검색어" id="searchwordinput"> -->
<!-- 				<span id="searchwordbutton">검색</span> -->
<!-- 				keyup으로 이벤트 -->
<!-- 			</div> -->
<!-- 			<div id = "searchresult"> -->
<!-- 				<ul> -->
<!-- 				list 클릭으로 이벤트 -->
<!-- 				</ul> -->
<!-- 			</div> -->
<!-- 		</aside> -->
		<table id="writing">
			<thead><tr><td ><h4> 글 작성 </h4></td></tr></thead>
			<tbody>
				<tr>
					<td  id="title"><input type="text" name="post_title" placeholder="글제목"></td>
				</tr>
				<tr>
					<td class="postPics">
<!-- 						<div id="icons"> -->
<!-- 							<img src="img/community/png/green-button.png" class="draggable" id="icon1"> -->
<!-- 								<input type="hidden" name="icon1" > -->
<!-- 							<img src="img/community/png/green-button.png" class="draggable" id="icon2"> -->
<!-- 								<input type="hidden" name="icon2"> -->
<!-- 							<img src="img/community/png/green-button.png" class="draggable" id="icon3"> -->
<!-- 								<input type="hidden" name="icon3"> -->
<!-- 							<img src="img/community/png/green-button.png" class="draggable" id="icon4"> -->
<!-- 								<input type="hidden" name="icon4"> -->
<!-- 							<img src="img/community/png/green-button.png" class="draggable" id="icon5"> -->
<!-- 								<input type="hidden" name="icon5">	 -->
<!-- 							<img src="img/community/png/green-button.png" class="draggable" id="icon6"> -->
<!-- 								<input type="hidden" name="icon6">	 -->
<!-- 							<img src="img/community/png/green-button.png" class="draggable" id="icon7"> -->
<!-- 								<input type="hidden" name="icon7">	 -->
<!-- 							<img src="img/community/png/green-button.png" class="draggable" id="icon8"> -->
<!-- 								<input type="hidden" name="icon8">	 -->
<!-- 							<img src="img/community/png/green-button.png" class="draggable" id="icon9"> -->
<!-- 								<input type="hidden" name="icon9">	 -->
<!-- 							<img src="img/community/png/green-button.png" class="draggable" id="icon10"> -->
<!-- 								<input type="hidden" name="icon10">	 -->
<!-- 						</div> -->
						<div class="pics">
							<!-- 썸네일 -->
							<div id="preview">
							 	<img id="previewImg" style="width:630px; height: 780px;">
							</div>
						 </div>
						 <div class="postItem">
						 	<!-- 큰 사진에 대한 상품 사진 넣는 공간 -->
						 	<ul class="insertedpicture">
						 		<li><img style="width:140px; height: 190px;"> </li>
						 		<li><img style="width:140px; height: 190px;"> </li>
						 		<li><img style="width:140px; height: 190px;"> </li>
						 		<li><img style="width:140px; height: 193px;"> </li>
						 	</ul>
						 </div> 
						 <div class="uploaditem">
						 	<!-- 큰 사진에 대한 상품 사진 넣는 공간 -->
						 	<ul>
						 		<li>
						 			<h5>사진을 등록해주세요</h5>
						 			<h5>*썸네일로 등록*</h5><br>
						 			<input type="file" onchange="readImage(this);" name="post_pics"> 
						 			<div class="register">등록완료</div></li>
						 		<li>
						 			<h5>사진을 등록해주세요</h5><br>
						 			<input type="file" onchange="readImage(this);" name="post_pic1">
						 			<div class="register">등록완료</div></li>
						 		<li>
						 			<h5>사진을 등록해주세요</h5><br>
						 			<input type="file" onchange="readImage(this);" name="post_pic1"> 
						 			<div class="register">등록완료</div></li>
						 		<li>
						 			<h5>사진을 등록해주세요</h5><br>
						 			<input type="file" onchange="readImage(this);" name="post_pic1">
						 			<div class="register">등록완료</div> </li>
						 	</ul>
						 </div> 
					</td>
				</tr>
			</tbody>
<!-- 					<tr> -->
<!-- 						<td id="preview"> -->
<!-- 							<img src="img/community/png/green-button.png" class="draggable" id="icon1"> -->
<!-- 								<input type="hidden" name="icon1" > -->
<!-- 							<img src="img/community/png/green-button.png" class="draggable" id="icon2"> -->
<!-- 								<input type="hidden" name="icon2"> -->
<!-- 							<img src="img/community/png/green-button.png" class="draggable" id="icon3"> -->
<!-- 								<input type="hidden" name="icon3"> -->
<!-- 							<img src="img/community/png/green-button.png" class="draggable" id="icon4"> -->
<!-- 								<input type="hidden" name="icon4"> -->
<!-- 							<img src="img/community/png/green-button.png" class="draggable" id="icon5"> -->
<!-- 								<input type="hidden" name="icon5">	 -->
<!-- 							<img src="img/community/png/green-button.png" class="draggable" id="icon6"> -->
<!-- 								<input type="hidden" name="icon6">	 -->
<!-- 							<img src="img/community/png/green-button.png" class="draggable" id="icon7"> -->
<!-- 								<input type="hidden" name="icon7">	 -->
<!-- 							<img src="img/community/png/green-button.png" class="draggable" id="icon8"> -->
<!-- 								<input type="hidden" name="icon8">	 -->
<!-- 							<img src="img/community/png/green-button.png" class="draggable" id="icon9"> -->
<!-- 								<input type="hidden" name="icon9">	 -->
<!-- 							<img src="img/community/png/green-button.png" class="draggable" id="icon10"> -->
<!-- 								<input type="hidden" name="icon10">		 -->
<!-- 							<img id="previewImg"> -->
<!-- 						</td> -->
<!-- 					</tr> -->
			
				<tfoot>
<!-- 					<tr> -->
<!-- 						<td> -->
<!-- 							<h5>가장 메인이 되는 사진을 올려주세요. 이 사진은 썸네일로 사용 될 예정입니다</h5>  -->
<!-- 							<input type="file" onchange="readImage(this);" name="post_pics"> -->
<!-- 							<input type="file" name="post_pic1">  -->
<!-- 							<input type="file" name="post_pic2">  -->
<!-- 							<input type="file" name="post_pic3"> -->
<!-- 						</td> -->
<!-- 					</tr> -->
					<tr>
						<td id="text">
							<textarea name="post_txt" id="textarea" placeholder="글내용을 입력해주세요"></textarea>
						</td>
					</tr>
				</tfoot>
<!-- 				<tfoot>	<tr><td colspan="2" > <input type="submit" value="작성완료"> </td></tr>	</tfoot> -->
		</table>
	</div>
</body>
</html>