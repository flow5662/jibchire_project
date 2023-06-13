<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
.progress-wrapper {
	display: flex;
	align-items: center;
	gap: 30px;
}

.progress-wrapper .progress {
	width: 500px;
	height: 0.25rem;
	border-radius: 2px;
	background-color: #f2f2f2;
	box-shadow: none;
	margin: 0;
	flex: 1;
}

.request-form-progress-bar {
	margin: 0.5rem 0 0;
}

.request-form-progress-bar .progress .progress-bar {
	background: #00c7ae;
	background: linear-gradient(92deg, #789849, #03b9c9);
	border-radius: 5px;
	box-shadow: none;
}

.progress-bar {
	flex-direction: column;
	justify-content: center;
	color: #fff;
	text-align: center;
	white-space: nowrap;
	background-color: #00c7ae;
	transition: width .6s ease;
	height: 100%;
	width: 0%;
}
</style>
<body>
	<div class="request-form-progress-bar" id="myBar">
		<div class="progress-wrapper">
			<div class="progress">
				<div class="progress-bar" style="width: 0%;"></div>
			</div>
			<div class="progress-percent" id="percent">0%</div>
		</div>
	</div>
</body>
</html>