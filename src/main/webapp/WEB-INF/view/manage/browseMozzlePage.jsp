<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>메인페이지</title>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<%@ include file="../comm/import.jsp"%>
<script type="text/javascript">

window.onload = function() {	

	$.ajax({
		url : "./selectCategoryByCnt.do",
		type : "post",
		success : function(data) {
			if (data.isc == true) {
				console.log("성공");
				
				var categoryList = data.cList;
				
				for (var i = 0; i < 10; i++) {
					$('ol').append('<a href="./browseMozzlePage.do?keyword=' + categoryList[i].category_name+ '"><li>' + categoryList[i].category_name + '</li></a>');
				} 
			}
		},
		error : function() {
			
			$('ol').append('<li>카테고리 리스트를 불러오는 것에 실패하였습니다</li>');
		}
	});
} 
</script>
<style>
.image-wrap2 {
	display: table-cell;
	vertical-align: middle;
}

#image {
	max-width: 100%;
	max-height: 100%;
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
						hidden="hidden"> 
						<a href="./MozzleFromTheImportance.do?keyword=${keyword}">관련도순</a>&nbsp;&nbsp;
						<a href="./browseMozzleFromTheLastest.do?keyword=${keyword}">최신순</a>
					<hr>
					<c:choose>
					<c:when test="${not empty mLists}">
					<c:forEach var="mozzle" items="${mLists}">
						<ul class="nav nav-pills nav-stacked">
							<li>
								<div class="container-fluid">
									<div class="row">
										<div class="col-sm-2 browse_list">
											<c:choose>
												<c:when test="${not empty mozzle.image_saved}">
													<a href="./firstmozzle.do?mozzle_id='${mozzle.mozzle_id}'">
														<img class="card" src="<%=request.getContextPath()%>/resources/upload/${mozzle.image_saved}" alt="img" />
													</a>
												</c:when>
												<c:otherwise>
													<a href="./firstmozzle.do?mozzle_id=${mozzle.mozzle_id}">
														<img class="card" src="<%=request.getContextPath()%>/resources/upload/basic.png" alt="img" />
													</a>
												</c:otherwise>
											</c:choose>
										</div>
										<div class="col-sm-10 browse_title"  style="align-items: center; justify-content: center;">
											<ul>
												<li>
													<h4><a href="./firstmozzle.do?mozzle_id=${mozzle.mozzle_id}">${mozzle.mozzle_name}</a></h4>
												</li>
												<li><a href="./firstmozzle.do?mozzle_id=${mozzle.mozzle_id}">${mozzle.mozzle_intro}</a></li>
												<li>회원수 : 110 <span></span> 리더 : 홍길동
												</li>
											</ul>
										</div>
									</div>
								</div>
							</li>
						</ul>
					</c:forEach>
					</c:when>
					<c:otherwise>
						<h4>검색된 모즐이 없습니다</h4>
					</c:otherwise>
					</c:choose>
					<br>
					<hr>
					<h4>게시물 검색 결과</h4>
					<input type="text" id="save-info" value="${keyword}"
						hidden="hidden"> <a
						href="./MozzleFromTheImportance.do?keyword=${keyword}">관련도순</a>&nbsp; <a
						href="./browseMozzleFromTheLastest.do?keyword=${keyword}">최신순</a>
					<hr>
				
				</div>
				

				<div class="col-sm-3 best_cate">
					<h4>실시간 BEST 카테고리</h4>
					<div>
						<ol>
						</ol>
					</div>

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