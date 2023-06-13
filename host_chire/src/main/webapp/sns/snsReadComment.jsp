<%@page import="dto.Feed_comment"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.commentupdate:hover{cursor: pointer;}
.commentdelete:hover{cursor: pointer;}
.updatetxt{height: 25px;    padding-left: 0.5em;    width: 260px; border: 1px solid white; box-shadow: 0 1px 3px rgba(0,0,0,0.12), 0 1px 2px rgba(0,0,0,0.24);     position: relative;
    top: -7px;
    margin-left: 10px;}
.updatefinish{height: 25px; position: relative;  top: -13px; font-size: 9pt;  border: 1px solid white;  box-shadow: 0 1px 3px rgba(0,0,0,0.12), 0 1px 2px rgba(0,0,0,0.24); margin-left: 5px;}
</style>
</head>
   <% 
	String id = (String) session.getAttribute("ID");  //로그인한 아이디
	if((id==null)){
	}else{
%>
	<input type="hidden" name="cust_id" value="<%=id%>">
<%
	}
%>
<body>
<%  //데이터 작업으로 얻은 객체 가져오기
	ArrayList<Feed_comment> commentlist = (ArrayList<Feed_comment>)request.getAttribute("commentlist");
	String cust_id = (String)request.getAttribute("cust_id");
	if(commentlist.size()==0){
%>
	<div class="comment">
		<div style="margin: 20px auto; width: 60%; font-weight: 700; font-style: italic;"> 아직 등록된 댓글이 없습니다. </div>
	</div>
<%	
	}else{
		for(int j =0; j<commentlist.size(); j++){ 
%>
	<ul class="<%=commentlist.get(j).getFeed_id()%>" id="<%=commentlist.get(j).getCmt_id()%>"> 
		<li class="commentimg"><img src="feedPics/<%=commentlist.get(j).getCust_pic()%>" onerror="this.src='img/sns/reddit-round-line-icon.png'" style="width:24px; height: 24px;"> </li>
		<li class="commentid"><%=commentlist.get(j).getCust_id()%> </li>
		<li class="comnenttxt"><%=commentlist.get(j).getCmt_txt()%> </li>
		<li class="commenttime"><%=commentlist.get(j).getCmt_time()%> </li>
<%
		if(commentlist.get(j).getCust_id().equals(cust_id)){
%>
		<li class="commentupdate" id="<%=commentlist.get(j).getCmt_id()%>">수정</li>
		<li class="commentdelete" id="<%=commentlist.get(j).getCmt_id()%>">삭제</li>
<%			
		}
%>		
	</ul>
<%  
		}
	}
%>
<script>
	$(function(){
		/*댓글 수정 */
		$(".commentupdate").click(function(){
			
			var feed_id = $(this).parent().attr("class");
			var cmt_id = $(this).attr("id");
			var cust_id = $("input:hidden[name=cust_id]").val();
			var text = $(this).prev().prev().text();     // 댓글내용 가져오기 (시간을 지웠으므로 바로 전의 값을 가져와야 함)
			
			$(this).prev().hide(); //시간 감추기
			$(this).prev().prev().hide(); //본래의 텍스트 감추기
			$(this).next().hide(); //삭제버튼 감추기
			$(this).hide();   //기존의 수정버튼 감추기
			$(this).parent().append("<li class='nothing'><input type='text' value='"+text+"' class='updatetxt'></li>"); //수정완료버튼 추가
			$(this).parent().append("<li class='updatefinish'>수정완료</li>"); //수정완료버튼 추가
			
			/*현재 시간 구하기*/
			var today = new Date();   
			var hours = ('0' + today.getHours()).slice(-2); 
			var minutes = ('0' + today.getMinutes()).slice(-2);
			var timeString = hours + ':' + minutes;
			//$(this).prev().prev().html("<input type='text' value='"+text+"' class='updatetxt'>"); //수정 누르면 댓글=> 입력창으로 변경. 내용 디폴트로 넣어두기 
			
			$(".updatefinish").click(function(){
				var cmt_txt = $(this).prev().children().val(); //수정한 텍스트값
				//  alert(cmt_txt);
	 			/* ui로 수정되는 모습 먼저 보여주기. */
	 			$(".nothing").hide();
	 			$(".updatefinish").hide();
            	var ss = "ul#"+cmt_id;
				$(ss).children(".comnenttxt").text(cmt_txt).show(200,'swing');
				$(ss).children(".commenttime").text(timeString).show(200,'swing');
            	$(ss).children(".commentupdate").show(200,'swing');
            	$(ss).children(".commentdelete").show(200,'swing');
            	
            	/* 데이터 작업하기 */
	 			var cnfm = confirm("수정 하시겠습니까?");
	 	 		if(cnfm){
	 	 			$.ajax({
	 		            url : "snsUpdateComment.sns?cmt_id="+cmt_id+"&cust_id="+cust_id+"&feed_id="+feed_id+"&cmt_txt="+cmt_txt,  
	 		            dataType : "html",
	 		            success : function(check){
	 	      	     	}
	 				});
	 	 		}else{
	 	 			return false;
	 	 		}
			});

		});
		/*댓글 삭제*/
		$(".commentdelete").click(function(){
			var cnfm = confirm("삭제 하시겠습니까?");
			var cmt_id = $(this).attr("id");
			var cust_id = $("input:hidden[name=cust_id]").val();
			var feed_id = $(this).parent().attr("class");
	 		if(cnfm){
            	//alert(cmt_id+" cust_id "+cust_id+"  feed_id  "+feed_id);
            	/* 데이터 작업하기*/
	 			$.ajax({
		            url : "snsDeleteComment.sns?cmt_id="+cmt_id+"&cust_id="+cust_id+"&feed_id="+feed_id,  
		            dataType : "html",
		            //data : "post",
		            success : function(check){
	            	
	      	     	}
				});
	 			/* ui로 삭제되는 모습 보여주기. ui삭제가 먼저 보여지면 데이터 값을 못 불러와서 삭제가 안됨!!!!*/
            	var ss = "ul#"+cmt_id;
            	$(ss).hide(200,'swing');
            	$(ss).children.hide(200,'swing');
	 			//document.location.href = "snsDeleteComment.sns?cmt_id="+cmt_id; //새로고침은 실패했을 때 차선책
	 		}else{
	 			return false;
	 		}
		});
	});
</script>
</body>
</html>