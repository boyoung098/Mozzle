<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
<head>
<title>메인페이지</title>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<%@ include file="./comm/import.jsp"%>
<link rel="icon" type="image/png" sizes="16x16"
	href="<%=request.getContextPath()%>/resources/images/logo/favicon.png">
<!-- <jsp:include page="./comm/import.jsp" /> -->


<style>
.card {
	width: 90%;
	height: 200px;
}

#regist-box {
	text-align: center;
	margin: 0 auto;
	height: 150px;
	vertical-align: middle;
	font-size: 2rem;
	color: #aaa;
	border: 1px solid #dcdcdc;
	margin: 45px;
	margin-top: 75px;
}

#regist-box:hover {
	box-shadow: 1px 1px 20px #aaa;
}

#regist-button {
	width: 30px;
	height: 30px;
	margin-top: 20%;
}

.arrow-left {
	height: 90px;
	width: 70px;
	float: left;
	margin-top: 90px;
}


.arrow-right {
	height: 90px;
	width: 70px;
	float: right;
	margin-top: 90px;

}

</style>
<script>
	window.onload = function() {
		var swiper_h = new Swiper(".main-bg-img", {
			slidesPerView : 1,
			spaceBetween : 50,
			loop : false,
		});
		var swiper_n = new Swiper(".sw-new-mozzle", {
			slidesPerView : 4,
			spaceBetween : 50,
			loop : false,
		});
		var swiper_n = new Swiper(".sw-new-mozzle2", {
			slidesPerView : 4,
			spaceBetween : 50,
			loop : false,
		});
	};
</script>
</head>
<body>
	<div id="header"></div>

	<section id="main-bg" class="container">
		<div class="swiper-container main-bg-img">
			<div class="swiper-wrapper">
				<div class="swiper-slide">
					<img src="<%=request.getContextPath()%>/resources/images/bn.png" />
				</div>
				<div class="swiper-slide">
					<img src="<%=request.getContextPath()%>/resources/images/bn.png" />
				</div>
			</div>
		</div>
	</section>
	<c:if test="${userId != null}">
		<section class="container mt-3" id="new-mozzle">
			<h4>My 모즐!</h4>
			<div class="swiper-container sw-new-mozzle">
			
				<div class="swiper-wrapper">
					<div class="swiper-slide">
						<a id="mozzle-regist-button" href="./manage/registMozzleForm.do">
							<div id="regist-box">
								<img id="regist-button"
									src="<%=request.getContextPath()%>/resources/images/mozzleplus.png">
								<br><br>모즐등록하기
							</div>
						</a>
					</div>
					<c:forEach var="mozzle" items="${myMozzleList}"  varStatus="vs"  begin="0" end="9">
					<div style="display:none">${vs.index}</div>
						<div class="swiper-slide">
							<a href="./firstmozzle.do?mozzle_id=${mozzle.mozzle_id}"> <c:choose>
									<c:when test="${not empty mozzle.image_saved}">
										<div class="image-wrap1">
											<div class="image-wrap2">
												<img class="card"
													src="<%=request.getContextPath()%>/resources/upload/${mozzle.image_saved}"
													alt="img" />
											</div>
										</div>
									</c:when>
									<c:otherwise>
										<img class="card"
											src="<%=request.getContextPath()%>/resources/upload/basic.png"
											alt="img" />
										<br />
									</c:otherwise>
								</c:choose>
								<p class="mozzle_title">${mozzle.mozzle_name}</p>
								<p>리더 : ${mozzle.leader_nickname}&nbsp;&nbsp;멤버 :
									${mozzle.memberCnt}</p>
								<p>${mozzle.mozzle_intro}</p>
							</a>
						</div>
					</c:forEach>

				</div>
			</div>
			
		</section>
	</c:if>
	<section class="container mt-3 mozzle-container" id="new-mozzle">
		<h4>새로 생긴 모즐!</h4>
		<div class="swiper-container sw-new-mozzle">
			<div class="swiper-wrapper">
				<c:forEach var="mozzle" items="${newMozzleList}" varStatus="vs"  begin="0" end="9">
				<div style="display:none">${vs.index}</div>
					<div class="swiper-slide">
						<a href="./firstmozzle.do?mozzle_id=${mozzle.mozzle_id}"> <c:choose>
								<c:when test="${not empty mozzle.image_saved}">
									<div class="image-wrap1">
										<div class="image-wrap2">
											<img class="card"
												src="<%=request.getContextPath()%>/resources/upload/${mozzle.image_saved}"
												alt="img" />
										</div>
									</div>

								</c:when>
								<c:otherwise>
									<img class="card"
										src="<%=request.getContextPath()%>/resources/upload/basic.png"
										alt="img" />
									<br />
								</c:otherwise>
							</c:choose>
							<p class="mozzle_title">${mozzle.mozzle_name}</p>
							<p>리더 : ${mozzle.leader_nickname}&nbsp;&nbsp;멤버 :
								${mozzle.memberCnt}</p>
							<p>${mozzle.mozzle_intro}</p>
						</a>
					</div>
				</c:forEach>
			</div>
		</div>
	</section>
	<br />
	<section class="container mt-3 mozzle-container" id="new-mozzle2">
		<h4>HOT 모즐!</h4>
		<div class="swiper-container sw-new-mozzle2">
			<div class="swiper-wrapper">
				<c:forEach var="mozzle" items="${hotMozzleList}" varStatus="vs"  begin="0" end="9">
					<div style="display:none">${vs.index}</div>
					<div class="swiper-slide">
						<a href="./firstmozzle.do?mozzle_id=${mozzle.mozzle_id}"> <c:choose>
								<c:when test="${not empty mozzle.image_saved}">
									<div class="image-wrap1">
										<div class="image-wrap2">
											<img class="card"
												src="<%=request.getContextPath()%>/resources/upload/${mozzle.image_saved}"
												alt="img" />
										</div>
									</div>

								</c:when>
								<c:otherwise>
									<img class="card"
										src="<%=request.getContextPath()%>/resources/upload/basic.png"
										alt="img" />
									<br />
								</c:otherwise>
							</c:choose>
							<p class="mozzle_title">${mozzle.mozzle_name}</p>
							<p>리더 : ${mozzle.leader_nickname}&nbsp;&nbsp;멤버 :
								${mozzle.memberCnt}</p>
							<p>${mozzle.mozzle_intro}</p>
						</a>
					</div>
				</c:forEach>
			</div>
		</div>
	</section>
	<section class="container mt-3">
		<img class="width-100" src="./resources/images/bn2.png" />
	</section>
	<br />
	<br />

	<div id="footer"></div>


	<!-- <div>
		<h1>임의로 만든 이동페이지</h1>
		<a href="./guestInvite.do?mozzle_id=1">김보영-게스트URI뿌리는 곳으로 이동</a> <a
			href="./mozzle/mozzleMove.do?mozzle_id=1">모즐1 메인이동</a>
	</div> -->
</body>
</html>