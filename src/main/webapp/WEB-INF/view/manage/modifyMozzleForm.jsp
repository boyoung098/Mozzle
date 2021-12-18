<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>모즐 생성 화면</title>
<%@ include file="../comm/import.jsp" %>
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

	<div id="header"></div>

	<div class="register-container">
		<form id="submitMozzleForm" action="./modifyMozzle.do" method="post"
			enctype="multipart/form-data">
			<input type="hidden" id="save_result" name="result" value="${result}" />
			<input type="hidden" id="save_infor" name="mozzle_id"
				value="${mozzle_id}" />
			<div class="register-inner">
				<h4>모즐 생성</h4>
			</div>
			<div class="register-name">
				<h5>커버 이미지 선택</h5>
			</div>
			<div class="image-wrap1">
				<div class="image-wrap2">
					<img class="image" id="image"
						src="<%=request.getContextPath()%>/resources/upload/${mozzle.image_saved}" ;/>
				</div>
			</div>


			<div class="register-input" id="imagebox">
				<div class="box-file-input" style="margin-top: 5px">
					<label> <input type="file" name="uploadFile"
						class="file-input" accept="image/*" id="img"
						value="${mozzle.image_origin}">
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
					<label class="switch"> <input type="checkbox" name="state"
						${mozzle.state}> <span class="slider round"></span>
					</label>
					<p id="on">ON</p>
				</div>
			</div>
			<div class="register-name">
				<h5>카테고리</h5>
			</div>
			<div class="register-input">
				<input type="text" id="category" name="category_code"
					style="width: 100%;" placeholder="카테고리를 입력해주세요"
					value="${mozzle.category_code}" />
			</div>
			<div class="register-name">
				<h5>이름</h5>
			</div>
			<div class="register-input">
				<input type="text" class="form-control" id="mozzle_name"
					name="mozzle_name" placeholder="모즐 이름을 입력해주세요"
					value="${mozzle.mozzle_name}" />
			</div>
			<div class="register-name">
				<h5>모즐소개</h5>
			</div>
			<div class="register-input">
				<textarea class="form-control" rows="5" name="mozzle_intro"
					id="mozzle_intro" placeholder="모즐 소개글을 입력해주세요">${mozzle.mozzle_intro}</textarea>
			</div>
			<br>
			<div class="register-input"
				style="display: flex; justify-content: center;">
				<input type="submit" class="btn" id="submit-btn"
					style="width: 200px; background: #e82d55; color: #fff;"
					value="모즐수정" onSubmit="checkSubmit()">
				<button>모즐 삭제</button>
			</div>
		</form>
	</div>
	<div id="footer"></div>
	<script>
		var dataList = [];
		$(document).ready(function() {
				console.log('ready');
				
				$.ajax({
					url: "./searchCategory.do",
					type: "POST",	
					dataType: "JSON",
					success: function(result) {
						console.log("성공");
						var categoryList = result.cList;
						for (var i = 0; i < categoryList.length; i++) {
							var Obj = {};
							Obj.id = categoryList[i].category_code;
							Obj.text = categoryList[i].category_name;
							dataList.push(Obj);
						}	
					}
				});

				console.log(dataList);
				
					$("#category").select2({
						data : dataList,
						multiple : true,

					});
				
					if($('#save_result').val() != '') {
						console.log($('#save_result').val());
						
						if($('#save_result').val() == 'true') {
							alert('모즐이 성공적으로 수정되었습니다.');
							$('#save_result').val('');
							location.href = "./home.do";
						} else {
							alert('수정을 실패했습니다.');
							$('#save_result').val('');
						} 
					}
					
				});
		
	

	<%-- 	window.onload = function() {
			document.getElementById("image").src = "<%=request.getContextPath()%>/resources/images/img.png";
		}; --%>

		document.getElementById("img").onchange = function() {
			var reader = new FileReader();

			reader.onload = function(e) {
				// get loaded data and render thumbnail.
				document.getElementById("image").src = e.target.result;
			};

			// read the image file as a data URL.
			if(this.files != undefined && this.files[0] != null) {
				reader.readAsDataURL(this.files[0]);
			} else {
				document.getElementById("image").src = "./resources/images/img.png";			}
		};
		
		function checkSubmit() {
			alert($('#submitMozzleForm').val());
		}
		
	</script>

</body>
</html>