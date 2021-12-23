<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>모즐 생성 화면</title>
<%@ include file="../comm/import.jsp"%>
<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://cdn.bootcss.com/select2/3.4.5/select2.min.js"></script>
<link href="https://cdn.bootcss.com/select2/3.4.5/select2.min.css"
	rel="stylesheet" />
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" />
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script
	src="<%=request.getContextPath()%>/resources/js/registMozzle.js"></script>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/resources/js/imageUpload.js"></script>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/commons.css" />
<script
	src="<%=request.getContextPath()%>/resources/js/swiper-bundle.min.js"></script>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/manage/registMozzleForm.css" />
</head>
<body>

	<div id="header"></div>

	<div class="register-container">
		<form id="submitMozzleForm" action="./registMozzle.do" method="post"
			enctype="multipart/form-data">
			<input type="hidden" id="save_result" name="result"
				value="${result}" />
			<input type="hidden" id="mozzle_id" name="mozzle_id"
				value="${mozzle_id}" />
			<div class="register-inner">
				<h4>모즐 생성</h4>
			</div>
			<div class="register-name">
				<h5>커버 이미지 선택</h5>
			</div>
			<div class="image-wrap1">
				<div class="image-wrap2">
					<img class="image" id="image" />
				</div>
			</div>


			<div class="register-input" id="imagebox">
				<div class="box-file-input" style="margin-top: 5px">
					<label> <input type="file" name="uploadFile"
						class="file-input" accept="image/*" id="img">
					</label> <span class="filename"></span>
				</div>
			</div>

			<br>
			<div class="register-input" id="public-choice">
				<div id="text-box">
					<p>공개 설정</p>
					<div id="explain">(공개 모즐의 경우 검색플랫폼에 노출될 수 있습니다)</div>

				</div>
				<div id="slider-box">
					<label class="switch"> <input type="checkbox" name="state">
						<span class="slider round"></span>
					</label>
					<p id="on">ON</p>
				</div>
			</div>
			<div class="register-name">
				<h5>카테고리</h5>
			</div>
			<div class="register-input">
				<input type="text" id="category" name="category_code"
					style="width: 100%;" />
			</div>
			
			<div class="register-name">
				<h5>모즐이름</h5>
			</div>
			<div class="register-input">
				<input type="text" class="form-control" name="mozzle_name" id="mozzle_name" 
					placeholder="모즐 이름을 입력해주세요" /> 
				<p id="check_msg"></p>
			</div>
			<div class="register-name">
				<h5>모즐소개</h5>
			</div>
			<div class="register-input">
				<textarea class="form-control" rows="5" name="mozzle_intro"
					id="mozzle_intro" placeholder="모즐 소개글을 입력해주세요"></textarea>
			</div>
			<br>
			<div class="register-input"
				style="display: flex; justify-content: center;">
				<input type="submit" class="btn" id="submit-btn"
					style="width: 200px; background: #e82d55; color: #fff;"
					value="모즐등록" onSubmit="checkSubmit()">
			</div>
		</form>
	</div>
	<div id="footer"></div> 
</body>
</html>