<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>메인페이지</title>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<%@ include file="../comm/import.jsp"%>
<script type="text/javascript">
window.onload = function(){
	var keyword = $("#save-info").val();
	console.log(keyword);
	
	$.ajax({
		url:"view/comm/header.jsp",
		method:"get",
		data: {"keyword":keyword},
		success(result) {
			
		}
	})
}

</script>
<style>
.card {
	width: 100%;
	height: 70px;
}

.image-wrap2 {
	display: table-cell;
	vertical-align: middle;
}

#image {
	max-width: 100%;
	max-height: 100%;
}

a:hover {
	color: blue;
	text-decoration: underline;
}
</style>
</head>
<body>
	<div id="header"></div>
	<section id="main-bg" class="container mt-3">
		<div class="container-fluid">
			<div class="row content">
				<div class="col-sm-9 sidenav">
					<h4>모즐검색결과</h4>
					<input type="text" id="save-info" value="${keyword}"
						hidden="hidden"> <a
						href="./MozzleFromTheImportance.do?keyword=${keyword}">관련도순</a> <a
						href="./browseMozzleFromTheLastest.do?keyword=${keyword}">최신순</a> <a
						href="#">인기순</a>
					<hr>
					<c:forEach var="mozzle" items="${mLists}">
						<ul class="nav nav-pills nav-stacked">
							<li>
								<div class="container-fluid">
									<div class="row">
										<div class="col-sm-1">
											<c:choose>
												<c:when test="${not empty mozzle.image_saved}">
													<a href=#><img class="card"
														src="<%=request.getContextPath()%>/resources/upload/${mozzle.image_saved}"
														alt="img" /></a>
												</c:when>
												<c:otherwise>
													<a href=#><img class="card"
														src="<%=request.getContextPath()%>/resources/upload/basic.png"
														alt="img" /></a>
												</c:otherwise>
											</c:choose>
										</div>
										<div class="col-sm-9"
											style="align-items: center; justify-content: center;">
											<ul>
												<li><a href=#>${mozzle.mozzle_name}</a></li>
												<li><a href=#>${mozzle.mozzle_intro}</a></li>
												<li>회원수 : 110 <span></span> 리더 : 홍길동
												</li>
											</ul>

										</div>
									</div>
								</div>
							</li>
						</ul>
					</c:forEach>
					<br>
				</div>

				<div class="col-sm-3">

					<hr>
					<h2>Officially Blogging</h2>
					<h5>
						<span class="glyphicon glyphicon-time"></span> Post by John Doe,
						Sep 24, 2015.
					</h5>
					<h5>
						<span class="label label-success">Lorem</span>
					</h5>
					<br>

					<h4>실시간 BEST 카테고리</h4>

					<table>
						<ul>
							<li>1. 운동</li>
							<li>2. 취미</li>
							<li>3. 여행</li>
							<li>4. 반려동물</li>
							<li>5. 자기개발</li>
							<li>6. 독서</li>
							<li>7. 육아</li>
							<li>8. 음악</li>
							<li>9. 예술</li>
							<li>10. 그림</li>
							<li>11. 서핑</li>
							<li>12. 친구찾기</li>
						</ul>
					</table>



				</div>
			</div>
		</div>
	</section>
	<div id="footer"></div>


	<div>
		<h1>임의로 만든 이동페이지</h1>
		<a href="./guestInvite.do">김보영-게스트URI뿌리는 곳으로 이동</a>
	</div>
</body>
</html>