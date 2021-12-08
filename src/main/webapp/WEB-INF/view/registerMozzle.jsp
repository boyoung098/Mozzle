<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>모즐 생성 화면</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.10.1/jquery.min.js"></script>
<script src="https://cdn.bootcss.com/select2/3.4.5/select2.min.js"></script>
<link href="https://cdn.bootcss.com/select2/3.4.5/select2.min.css"
	rel="stylesheet" />
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" />
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script type="text/javascript" src="./resources/js/imageUpload.js"></script>
<style>
.card {
	width: 90%;
	height: 100%;
}

.register-container {
	justify-content: center;
	align-items: center;
	width: 50%;
}

.register-name {
	text-align: left;
}

.switch {
	position: relative;
	display: inline-block;
	width: 40px;
	height: 20px;
	vertical-align: middle;
}

.switch input {
	display: none;
}

.slider {
	position: absolute;
	cursor: pointer;
	top: 0;
	left: 0;
	right: 0;
	bottom: 0;
	background-color: #ccc;
	-webkit-transition: .4s;
	transition: .4s;
}

.slider:before {
	position: absolute;
	content: "";
	height: 17px;
	width: 17px;
	left: 1.8px;
	bottom: 1.8px;
	background-color: white;
	-webkit-transition: .4s;
	transition: .4s;
}

input:checked+.slider {
	background-color: #2196F3;
}

input:focus+.slider {
	box-shadow: 0 0 1px #2196F3;
}

input:checked+.slider:before {
	-webkit-transform: translateX(26px);
	-ms-transform: translateX(26px);
	transform: translateX(20px);
}

.slider.round {
	border-radius: 34px;
}

.slider.round:before {
	border-radius: 50%;
}

p {
	margin: 0px;
	display: inline-block;
	font-size: 10px;
	font-weight: bold;
}

section.content {
	margin-top: 5%;
	margin-bottom: 5%;
}

.dragAndDropDiv {
	border: 2px dashed #92AAB0;
	width: 650px;
	height: 200px;
	color: #92AAB0;
	text-align: center;
	vertical-align: middle;
	padding: 10px 0px 10px 10px;
	font-size: 200%;
	display: table-cell;
}

.progressBar {
	width: 200px;
	height: 22px;
	border: 1px solid #ddd;
	border-radius: 5px;
	overflow: hidden;
	display: inline-block;
	margin: 0px 10px 5px 5px;
	vertical-align: top;
}

.progressBar div {
	height: 100%;
	color: #fff;
	text-align: right;
	line-height: 22px;
	/* same as #progressBar height if we want text middle aligned */
	width: 0;
	background-color: #0ba1b5;
	border-radius: 3px;
}

.statusbar {
	border-top: 1px solid #A9CCD1;
	min-height: 25px;
	width: 99%;
	padding: 10px 10px 0px 10px;
	vertical-align: top;
}

.statusbar:nth-child(odd) {
	background: #EBEFF0;
}

.filename {
	display: inline-block;
	vertical-align: top;
	width: 250px;
}

.filesize {
	display: inline-block;
	vertical-align: top;
	color: #30693D;
	width: 100px;
	margin-left: 10px;
	margin-right: 5px;
}

.abort {
	background-color: #A8352F;
	-moz-border-radius: 4px;
	-webkit-border-radius: 4px;
	border-radius: 4px;
	display: inline-block;
	color: #fff;
	font-family: arial;
	font-size: 13px;
	font-weight: normal;
	padding: 4px 15px;
	cursor: pointer;
	vertical-align: top
}
</style>
</head>
<body>

	<jsp:include page="./comm/header.jsp" />

	<div class="register-container">
		<div class="register-inner">
			<h3>모즐 생성</h3>
		</div>
		<div class="register-name">
			<h5>커버 이미지 선택</h5>
		</div>
		<div class="register-input">
			<div id="fileUpload" class="dragAndDropDiv">Drag & Drop Files
				Here or Browse Files</div>
			<input type="file" name="fileUpload" id="fileUpload"
				style="display: none;" multiple />
		</div>
		<div class="register-name">
			<h5>공개 설정</h5>
		</div>
		<div class="register-input">
			<label class="switch"> <input type="checkbox"> <span
				class="slider round"></span>
			</label>
			<p>ON</p>
		</div>
		<div class="register-name">
			<h5>카테고리</h5>
		</div>
		<div class="register-input">
			<input type="text" id='Books' value="" style="width: 90%;" />
			<button type="button" class="btn" id="bt" style="margin-left: 3px;">등록</button>
		</div>
		<div class="register-name">
			<h5>이름</h5>
		</div>
		<div class="register-input">
			<input type="text" class="form-control" name="name"
				placeholder="이름을 입력해주세요" />
		</div>
		<div class="register-name">
			<h5>모즐소개</h5>
		</div>
		<div class="register-input">
			<textarea class="form-control" rows="5" id="comment"
				placeholder="모즐 소개글을 입력해주세요"></textarea>
		</div>
	</div>

	<script>
		$(document).ready(
				function() {
					var empArray = [ {
						id : '001',
						text : '자바'
					}, {
						id : '002',
						text : '자바스크립트'
					}, {
						id : '003',
						text : '자바스프링'
					}, {
						id : '004',
						text : '컴퓨터'
					}, {
						id : '005',
						text : '등산'
					} ];

					$("#Books").select2({
						data : empArray,
						multiple : true,
						placeholder : '카테고리를 입력해주세요'
					});

					$('#bt').click(
							function() {
								$('#lbl').empty();
								$('#lbl').append("You have selected: <br />");
								var iCnt = 0;
								var data = $('#Books').select2('data');

								$.each(data,
										function() {
											var empName = $('#Books').select2(
													'data')[iCnt]['text']
													+ '<br />';
											$('#lbl').append(empName);
											iCnt += 1;
										});
							});
				});
	</script>

</body>
</html>