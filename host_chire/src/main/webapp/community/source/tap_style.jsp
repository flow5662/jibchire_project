<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	@font-face{
		font-family: 'NanumSquare';
		url('https://cdn.rawgit.com/moonspam/NanumSquare/master/nanumsquare.css');
	} 
	section #mid{height: 100px; width: 1280px;}
	.tabs {  display: flex;  position: relative;
	  box-shadow: 0 0 1px 0 rgba(24, 94, 224, 0.15), 0 6px 12px 0 rgba(24, 94, 224, 0.15);
	  padding: 0.75rem;  border-radius: 99px; }
	.tab {  display: flex;   align-items: center;    justify-content: center;	height: 54px;  width: 200px; 
	 font-size: 12pt;   z-index: 2; border-radius: 99px;  cursor: pointer;  transition: color 0.15s ease-in;}
	.glider {  position: absolute;  height: 54px;  width: 140px; z-index: 1;
	  border-radius: 99px;  transition: 0.25s ease-out; background-color: #ECD1AD;}
	input[type="radio"] {  display: none;}
	input[type="radio"]:checked + label {  color: #3F1709; filter:opacity(0.5) drop-shadow(0 0 0 #926b61);}
	input[id="radio-1"]:checked ~ .glider {	transform: translateX(0);}
	input[id="radio-2"]:checked ~ .glider {	transform: translateX(100%);}
	input[id="radio-3"]:checked ~ .glider {	transform: translateX(200%);}
	input[id="radio-4"]:checked ~ .glider { transform: translateX(300%);}
	input[id="radio-5"]:checked ~ .glider { transform: translateX(400%);}
	input[id="radio-6"]:checked ~ .glider { transform: translateX(500%);}
	input[id="radio-7"]:checked ~ .glider { transform: translateX(600%);}
	input[id="radio-8"]:checked ~ .glider { transform: translateX(700%);}
	input[id="radio-9"]:checked ~ .glider { transform: translateX(800%);}
</style>
</head>
<body>
	<!-- section style 분류 탭-->
	<section>
    	<article id="mid">
    		<div class="wrap">
				<div class="tabs">
					<input type="radio" id="radio-1"  name="tabs" checked />
					<label class="tab" for="radio-1">
						<img src="img/community/png/fullscreen-fill.png"> 모든분위기</label>
					<input type="radio" id="radio-2" name="tabs"/>
					<label class="tab" for="radio-2">
						<img src="img/community/png/stop-line.png">미니멀&심플</label>
					<input type="radio" id="radio-3"  name="tabs"/>
					<label class="tab" for="radio-3">
						<img src="img/community/png/plant-line.png">내추럴</label>
					<input type="radio" id="radio-4" name="tabs" />
					<label class="tab" for="radio-4">
						<img src="img/community/png/global-line.png">북유럽</label>
					<input type="radio" id="radio-5"  name="tabs"/>
					<label class="tab" for="radio-5">
						<img src="img/community/png/seedling-line.png">빈티지</label>
					<input type="radio" id="radio-6" name="tabs" />
					<label class="tab" for="radio-6">
						<img src="img/community/png/rainbow-line.png">유니크</label>
					<input type="radio" id="radio-7" name="tabs" />
					<label class="tab" for="radio-7">
						<img src="img/community/png/sun-line.png">프렌치</label>
					<input type="radio" id="radio-8" name="tabs" />
					<label class="tab" for="radio-8">
						<img src="img/community/png/mist-fill.png">믹스매치</label>
					<input type="radio" id="radio-9" name="tabs" />
					<label class="tab" for="radio-9">
						<img src="img/community/png/ancient-pavilion-line.png">한옥</label>
					<span class="glider"></span>
				</div>
			</div>  
        </article>	
    </section>
</body>
</html>