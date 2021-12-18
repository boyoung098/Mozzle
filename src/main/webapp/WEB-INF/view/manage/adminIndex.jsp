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
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<jsp:include page="../comm/import.jsp" />
<style type="text/css">

table {
	width: 100%;
	margin: 0 auto;
	text-align: center;
}

.btn-xs {
	margin-top: 15px;
}

.category-box {
	border: 1px solid #ccc;;
	border-radius: 5px;
}

#enroll-category-box {
	width: 280px;
	height: 300px;
	margin-right:5px;
	float: left;
}

#saved-category-box {
	width: 280px;
	height: 300px;
	margin-left:5px;
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
	<div class="container">
		<h2>관리자 페이지</h2>
		<ul class="nav nav-tabs">
			<li class="active"><a data-toggle="tab" href="#home">카테고리 관리</a></li>
			<li><a data-toggle="tab" href="#menu1">모즐 관리</a></li>
			<li><a data-toggle="tab" href="#menu2">회원 관리</a></li>
		</ul>

		<div class="tab-content">
			<div id="home" class="tab-pane fade in active">
				<br>
				<button type="button" class="btn btn-xs" onclick="click('1')">ㄱ</button>
				<button type="button" class="btn btn-xs" onclick="click('2')">ㄴ</button>
				<button type="button" class="btn btn-xs" onclick="click('3')">ㄷ</button>
				<button type="button" class="btn btn-xs" onclick="click('4')">ㄹ</button>
				<button type="button" class="btn btn-xs" onclick="click('5')">ㅁ</button>
				<button type="button" class="btn btn-xs" onclick="click('6')">ㅂ</button>
				<button type="button" class="btn btn-xs" onclick="click('7')">ㅅ</button>
				<button type="button" class="btn btn-xs" onclick="click('8')">ㅇ</button>
				<button type="button" class="btn btn-xs" onclick="click('9')">ㅈ</button>
				<button type="button" class="btn btn-xs" onclick="click('10')">ㅊ</button>
				<button type="button" class="btn btn-xs" onclick="click('11')">ㅋ</button>
				<button type="button" class="btn btn-xs" onclick="click('12')">ㅌ</button>
				<button type="button" class="btn btn-xs" onclick="click('13')">ㅍ</button>
				<button type="button" class="btn btn-xs" onclick="click('14')">ㅎ</button>
				<button type="button" class="btn btn-xs" onclick="click('15')">A</button>
				<button type="button" class="btn btn-xs" onclick="click('16')">B</button>
				<button type="button" class="btn btn-xs" onclick="click('17')">C</button>
				<button type="button" class="btn btn-xs" onclick="click('18')">D</button>
				<button type="button" class="btn btn-xs" onclick="click('19')">E</button>
				<button type="button" class="btn btn-xs" onclick="click('20')">F</button>
				<button type="button" class="btn btn-xs" onclick="click('21')">G</button>
				<button type="button" class="btn btn-xs" onclick="click('22')">H</button>
				<button type="button" class="btn btn-xs" onclick="click('23')">I</button>
				<button type="button" class="btn btn-xs" onclick="click('24')">J</button>
				<button type="button" class="btn btn-xs" onclick="click('25')">K</button>
				<button type="button" class="btn btn-xs" onclick="click('26')">L</button>
				<button type="button" class="btn btn-xs" onclick="click('27')">M</button>
				<button type="button" class="btn btn-xs" onclick="click('28')">N</button>
				<button type="button" class="btn btn-xs" onclick="click('29')">O</button>
				<button type="button" class="btn btn-xs" onclick="click('30')">P</button>
				<button type="button" class="btn btn-xs" onclick="click('31')">Q</button>
				<button type="button" class="btn btn-xs" onclick="click('32')">R</button>
				<button type="button" class="btn btn-xs" onclick="click('33')">S</button>
				<button type="button" class="btn btn-xs" onclick="click('34')">T</button>
				<button type="button" class="btn btn-xs" onclick="click('35')">U</button>
				<button type="button" class="btn btn-xs" onclick="click('36')">V</button>
				<button type="button" class="btn btn-xs" onclick="click('37')">W</button>
				<button type="button" class="btn btn-xs" onclick="click('38')">X</button>
				<button type="button" class="btn btn-xs" onclick="click('39')">Y</button>
				<button type="button" class="btn btn-xs" onclick="click('40')">Z</button>
				<br> <br>


				<div class="container" style="text-align:center;width:60%">
					<div class="row">
						<div class="col-sm-5" style="text-align:center;width:50%">
							<input type="text" class="form-control" id="inputCategory"
								name="inputCategory" style="width: 40%; display: inline-block;" />
							<button type="button" class="btn btn-default"
								onclick="enrollCategory()">등록</button>
							<button type="button" class="btn btn-warning"
								onclick="location.href='./deleteCategory.jsp'"
								style="margin-left: 5px;">삭제</button>
						</div>
						<div class="col-sm-5" style="text-align:center;width:50%">
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

			<div class="container" style="width:60%">
				<div class="row">
					<div class="col-sm-4">
						<div class="category-box" id="enroll-category-box">
							<ul id="enroll-category-list"></ul>
						</div>
						
					</div>
					<div class="col-sm-4">
						<img alt="arrow" src="<%=request.getContextPath()%>/resources/images/arrow.png" style="margin-top:100px">	
					</div>
					<div class="col-sm-4">
						<div class="category-box" id="saved-category-box">
							<table>
								<thead>
								</thead>
								<tbody>
									<c:forEach var="category" items="${cList}" varStatus="status">
										<tr>
											<td>${category.category_name}</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
			<div style="float:right; margin-right:200px">
				<br>
				<div>총 : 개</div>
				<br >
				<button type="button" class="btn btn-default"
					onclick="location.href='./registCategory.jsp'">저장</button>
			</div>
		</div>






		<div id="menu1" class="tab-pane fade"></div>

		<div id="menu2" class="tab-pane fade">
			<div class="container"></div>
		</div>

		<div id="menu3" class="tab-pane fade">
			<h3>Menu 3</h3>
			<p>Eaque ipsa quae ab illo inventore veritatis et quasi
				architecto beatae vitae dicta sunt explicabo.</p>



		</div>
	</div>
	</div>

	<jsp:include page="../comm/footer.jsp" />
</body>
<script>
	var appendCnt = 0;
	function enrollCategory() {
		if(appendCnt <10) {
			console.log("ready");
			$("#enroll-category-list").append("<li id='enroll-category-list-li"+ appendCnt+ "'>" + $("#inputCategory").val() 
					+"<a onclick='deleteCategory()'><img src='<%=request.getContextPath()%>/resources/images/delete.png'/></a></li>")
			document.getElementById("inputCategory").value = "";
			
			appendCnt += 1;
		}
	};
	
	function deleteCategory() {
		console.log("ready");
		$("#enroll-category-list-li" + (appendCnt - 1)).remove();
		appendCnt -= 1;
		
	}
</script>
</html>
