<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>모즐 생성 화면</title>
<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://cdn.bootcss.com/select2/3.4.5/select2.min.js"></script>
<link href="https://cdn.bootcss.com/select2/3.4.5/select2.min.css"
	rel="stylesheet" />
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" />
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
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

	<jsp:include page="../comm/header.jsp" />

	<div class="register-container">
		<form action="./registerMozzle.do"></form>
		<div class="register-inner">
			<h4>모즐 생성</h4>
		</div>
		<div class="register-name">
			<h5>커버 이미지 선택</h5>
		</div>

		<div class="register-input" id="imagebox">
			<div class="image-wrap1">
				<div class="image-wrap2">
					<img class="image" id="image" />
				</div>
			</div>
			<div class="box-file-input" style="margin-top:5px">
				<label> <input type="file" name="image_origin"
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
				<label class="switch"> <input type="checkbox"> <span
					class="slider round"></span>
				</label>
				<p id="on">ON</p>
			</div>
		</div>
		<div class="register-name">
			<h5>카테고리</h5>
		</div>
		<div class="register-input">
			<input type="text" id="category" value="category_code"
				style="width: 83%;" />
			<button type="button" class="btn" id="bt"
				style="margin-left: 5px; width: 15%;">등록</button>
		</div>
		<div class="register-name">
			<h5>이름</h5>
		</div>
		<div class="register-input">
			<input type="text" class="form-control" name="mozzle_name"
				placeholder="모즐 이름을 입력해주세요" />
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
			<input type=button class="btn" id="submit-btn"
				style="width: 200px; background: #e82d55; color: #fff;" value="모즐등록">
		</div>

	</div>

	<jsp:include page="../comm/footer.jsp" />


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

					$("#category").select2({
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
		
		
		document.addEventListener("DOMContentLoaded", function(){
			document.getElementById("image").src = "./resources/images/img.png";
		});

		document.getElementById("img").onchange = function() {
			var reader = new FileReader();

			reader.onload = function(e) {
				// get loaded data and render thumbnail.
				document.getElementById("image").src = e.target.result;
			};

			// read the image file as a data URL.
			reader.readAsDataURL(this.files[0]);
		};

		function resize(img) {

			// 원본 이미지 사이즈 저장
			var width = img.width;
			var height = img.height;

			// 가로, 세로 최대 사이즈 설정
			var maxWidth = 20; // 원하는대로 설정. 픽셀로 하려면 maxWidth = 400
			var maxHeight = height * 0.5; // 원래 사이즈 * 0.5 = 50%

			//document.write(maxWidth+"<br>");
			//document.write(maxHeight+"<br>");

			// 가로나 세로의 길이가 최대 사이즈보다 크면 실행
			if (width > maxWidth || height > maxHeight) {
				// 가로가 세로보다 크면 가로는 최대사이즈로, 세로는 비율 맞춰 리사이즈
				if (width > height) {
					resizeWidth = maxWidth;
					resizeHeight = Math.Round((height * resizeWidth) / width);

					// 세로가 가로보다 크면 세로는 최대사이즈로, 가로는 비율 맞춰 리사이즈
				} else {
					resizeHeight = maxHeight;
					resizeWidth = Math.Round((width * resizeHeight) / height);
				}

				// 최대사이즈보다 작으면 원본 그대로
			} else {
				resizeWidth = width;
				resizeHeight = height;
			}

			// 리사이즈한 크기로 이미지 크기 다시 지정
			img.width = resizeWidth;
			img.height = resizeHeight;
			document.write(resizeWidth + "<br>");
			document.write(resizeHeight + "<br>");
		}
	</script>

</body>
</html>