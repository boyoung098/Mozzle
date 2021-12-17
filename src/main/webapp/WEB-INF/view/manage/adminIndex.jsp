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
table th {
	width: 600px;
	margin: 0 auto;
	text-align: center;
}

table {
	width: 600px;
	margin: 0 auto;
	text-align: center;
}

.btn-xs {
	margin-top: 15px;
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


				<div class="container" id="search-container">
					<div style="width: 5%; display: inline-block;"></div>
					<div style="width: 55%; display: inline-block;">
						<form action="./searchCategory.do" method="post" class="form-horizontal">
							<div class="form-group">
								<label class="col-sm-2 control-label">검색</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" id="focusedInput"
										name="searchName" style="width: 40%; display: inline-block;" />
									<input type="submit" class="btn btn-default" value="찾기" />
								</div>
							</div>
						</form>
					</div>
					<div style="width: 10%; float: right"></div>
					<div style="width: 30%; float: right">
						<input type="text" class="form-control" id="focusedInput"
										name="inputCategory" style="width: 40%; display: inline-block;" />
						<button type="button" class="btn btn-default"
							onclick="location.href='./registCategory.jsp'">등록</button>
						<button type="button" class="btn btn-warning"
							onclick="location.href='./deleteCategory.jsp'"
							style="margin-left: 5px;">삭제</button>
					</div>
				</div>

				<br> <br>
				<div class="success"></div>
				<table>
					<thead>
						<tr>
							<th>순번</th>
							<th>카테고리명</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="category" items="${cList}" varStatus="status">
							<tr>
								<td>${fn:length(cList) - status.index}</td>
								<td>${category.category_name}</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>

				</table>




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

	<jsp:include page="../comm/footer.jsp" /></body>
</html>
