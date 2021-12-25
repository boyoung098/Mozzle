<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>메인페이지</title>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1">
<%@ include file="../comm/import.jsp"%>

<style type="text/css">
.btn-xs {
	margin-top: 15px;
}

#save-button {
	margin-left: 3px
}

.category-box {
	border: 1px solid #ccc;
	border-radius: 5px;
}

#enroll-category-box {
	width: 280px;
	height: 300px;
	margin-right: 5px;
	float: left;
}

#saved-category-box {
	width: 280px;
	height: 300px;
	margin-left: 5px;
	float: right;
	overflow: scroll;
}

.col-sm-4 {
	margin: 0 auto;
	text-align: center;
	vertical-align: middle;
	height: 300px
}
</style>

</head>
<body>
	<div id="header"></div>
	<div class="container">
		<h2>관리자 페이지</h2>
		<ul class="nav nav-tabs">
			<li>카테고리 관리</a></li>
		</ul>

		<div class="tab-content">
			<div id="home" class="tab-pane fade in active">
				<br>
				<button type="button" class="btn btn-xs"
					onclick="selectInitial('1')">ㄱ</button>
				<button type="button" class="btn btn-xs"
					onclick="selectInitial('2')">ㄴ</button>
				<button type="button" class="btn btn-xs"
					onclick="selectInitial('3')">ㄷ</button>
				<button type="button" class="btn btn-xs"
					onclick="selectInitial('4')">ㄹ</button>
				<button type="button" class="btn btn-xs"
					onclick="selectInitial('5')">ㅁ</button>
				<button type="button" class="btn btn-xs"
					onclick="selectInitial('6')">ㅂ</button>
				<button type="button" class="btn btn-xs"
					onclick="selectInitial('7')">ㅅ</button>
				<button type="button" class="btn btn-xs"
					onclick="selectInitial('8')">ㅇ</button>
				<button type="button" class="btn btn-xs"
					onclick="selectInitial('9')">ㅈ</button>
				<button type="button" class="btn btn-xs"
					onclick="selectInitial('10')">ㅊ</button>
				<button type="button" class="btn btn-xs"
					onclick="selectInitial('11')">ㅋ</button>
				<button type="button" class="btn btn-xs"
					onclick="selectInitial('12')">ㅌ</button>
				<button type="button" class="btn btn-xs"
					onclick="selectInitial('13')">ㅍ</button>
				<button type="button" class="btn btn-xs"
					onclick="selectInitial('14')">ㅎ</button>
				<button type="button" class="btn btn-xs"
					onclick="selectInitial('15')">A</button>
				<button type="button" class="btn btn-xs"
					onclick="selectInitial('16')">B</button>
				<button type="button" class="btn btn-xs"
					onclick="selectInitial('17')">C</button>
				<button type="button" class="btn btn-xs"
					onclick="selectInitial('18')">D</button>
				<button type="button" class="btn btn-xs"
					onclick="selectInitial('19')">E</button>
				<button type="button" class="btn btn-xs"
					onclick="selectInitial('20')">F</button>
				<button type="button" class="btn btn-xs"
					onclick="selectInitial('21')">G</button>
				<button type="button" class="btn btn-xs"
					onclick="selectInitial('22')">H</button>
				<button type="button" class="btn btn-xs"
					onclick="selectInitial('23')">I</button>
				<button type="button" class="btn btn-xs"
					onclick="selectInitial('24')">J</button>
				<button type="button" class="btn btn-xs"
					onclick="selectInitial('25')">K</button>
				<button type="button" class="btn btn-xs"
					onclick="selectInitial('26')">L</button>
				<button type="button" class="btn btn-xs"
					onclick="selectInitial('27')">M</button>
				<button type="button" class="btn btn-xs"
					onclick="selectInitial('28')">N</button>
				<button type="button" class="btn btn-xs"
					onclick="selectInitial('29')">O</button>
				<button type="button" class="btn btn-xs"
					onclick="selectInitial('30')">P</button>
				<button type="button" class="btn btn-xs"
					onclick="selectInitial('31')">Q</button>
				<button type="button" class="btn btn-xs"
					onclick="selectInitial('32')">R</button>
				<button type="button" class="btn btn-xs"
					onclick="selectInitial('33')">S</button>
				<button type="button" class="btn btn-xs"
					onclick="selectInitial('34')">T</button>
				<button type="button" class="btn btn-xs"
					onclick="selectInitial('35')">U</button>
				<button type="button" class="btn btn-xs"
					onclick="selectInitial('36')">V</button>
				<button type="button" class="btn btn-xs"
					onclick="selectInitial('37')">W</button>
				<button type="button" class="btn btn-xs"
					onclick="selectInitial('38')">X</button>
				<button type="button" class="btn btn-xs"
					onclick="selectInitial('39')">Y</button>
				<button type="button" class="btn btn-xs"
					onclick="selectInitial('40')">Z</button>
				<br> <br>


				<div class="container" style="text-align: center; width: 60%">
					<div class="row">
						<div class="col-sm-5" style="text-align: center; width: 50%">
							<input type="text" class="form-control" id="inputCategory"
								name="inputCategory" style="width: 40%; display: inline-block;" />
							<button type="button" class="btn btn-default"
								onclick="enrollCategory()">추가</button>
						</div>
						<div class="col-sm-5" style="text-align: center; width: 50%">
							<form action="./searchCategory.do" method="post"
								class="form-horizontal">
								<div class="form-group">
									<input type="text" class="form-control" id="focusedInput"
										name="searchName" style="width: 40%; display: inline-block;" />
									<input type="submit" class="btn btn-default" value="검색">
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>

			<div class="container" style="width: 60%">
				<div class="row">
					<div class="col-sm-4">
						<div class="category-box" id="enroll-category-box">
							<ul id="enroll-category-list"></ul>
						</div>

					</div>
					<div class="col-sm-4">
						<img id="add-category" alt="arrow"
							src="<%=request.getContextPath()%>/resources/images/arrow.png"
							style="margin-top: 100px">
					</div>
					<div class="col-sm-4">
						<div class="category-box" id="saved-category-box">
							<ul id="saved-category-list">
								<c:forEach var="category" items="${cList}">
									<li><a href="#" class="category-link"
										id="category-link'${category.category_code}'"
										onclick="checkForDelete('${category.category_code}')">${category.category_name}</a></li>
								</c:forEach>
							</ul>
						</div>
					</div>
				</div>
			</div>
			<div style="float: right; margin-right: 200px">
				<br>
				<div>총 : ${cnt} 개</div>
				<br>
				<button class="btn btn-primary" id="save-button"
					onclick="window.location.reload()">저장</button>
				<button class="btn btn-danger" id="delete-button"
					onclick="deleteSavedCategory()">삭제</button>
			</div>
		</div>
	</div>

	<div id="footer"></div>
</body>
<script>
	var appendCnt = 0;
	function enrollCategory() {
		var category_name = $("#inputCategory").val(); 
		
		$.ajax({
			url: "./duplicateCheck.do",
			type: "POST",
			data: {
				"category_name": category_name
			},
			success: function(result) {
				
				if(result == true) {
					alert("이미 등록된 카테고리입니다");
				} else {
					
					if(appendCnt <10) {
						console.log("ready");
						$("#enroll-category-list").append("<li id='enroll-category-list-li"+ appendCnt+ "'>" + $("#inputCategory").val() 
								+"<a onclick='deleteEnrollCategory("+ appendCnt + ")'><img src='<%=request.getContextPath()%>/resources/images/delete.png'/></a></li>")
						document.getElementById("inputCategory").value = "";

						appendCnt += 1;
					}
				}
			}
		})
	};

	function deleteEnrollCategory(appendCnt) {
		console.log("ready");
		$("#enroll-category-list-li" + (appendCnt)).remove();
		appendCnt -= 1;

	}

	$("#add-category").click(
			function() {
				console.log("ready");
				var categoryArray = [];
				$("#enroll-category-list li").each(function() {
					categoryArray.push($(this).text());

				})
				console.log(categoryArray);

				$.ajax({
					url : "./registIndex.do",
					type : "POST",
					data : {
						"category" : categoryArray
					},
					success : function(result) {
						if (result == true) {
							alert("카테고리가 성공적으로 등록되었습니다");
							$("#enroll-category-list").children().remove();
							appendCnt = 0;

							for (var i = 0; i < categoryArray.length; i++) {
								$("#saved-category-list").prepend(
									"<li>"+ categoryArray[i] + "</li>")
							}
						}
					}
				})
			});

	var deleteList = [];

	function checkForDelete(category_code) {
		console.log(category_code);

		deleteList.push(category_code);
		console.log(deleteList);

		$(this).attr("style", "color:red;");

	};

	function deleteSavedCategory() {

		$.ajax({
			url : "./deleteCategory.do",
			type : "POST",
			data : {
				"category" : deleteList
			},
			success : function(result) {
				if (result == true) {
					alert("카테고리가 성공적으로 삭제되었습니다");
					window.location.reload();
				}
			}
		})
	};

	function selectInitial(obj) {
		location.href = "./selectInitial.do?cNum=" + obj;
	};
</script>
</html>
