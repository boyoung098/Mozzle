<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
<title>메인페이지</title>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<jsp:include page="../comm/import.jsp" />

<style>
.card {
	width: 90%;
	height: 200px;
}
.image-wrap1 {
    text-align:center;
    display:table;
    border:1px dotted #cecece;
    width:100%;
    height:100%px;
    border-radius: 5px;
}
.image-wrap2 {
    display:table-cell;
    vertical-align:middle;
}
#image {
    max-width:100%;
    max-height:100%;
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
			slidesPerView : 3,
			spaceBetween : 50,
			loop : false,
		});
		var swiper_n = new Swiper(".sw-new-mozzle2", {
			slidesPerView : 3,
			spaceBetween : 50,
			loop : false,
		});
	};
</script>
</head>
<body>
	<jsp:include page="../comm/header.jsp" >
		<jsp:param value="${userId}" name="userId"/>
	</jsp:include>
	<section id="main-bg" class="container mt-3">
		<div class="swiper-container main-bg-img">
			<div class="swiper-wrapper">
				<div class="swiper-slide">
					<img src="<%=request.getContextPath()%>/resources/images/bn.png" />
				</div>
				<div class="swiper-slide">
					<img src="bn.png" />
				</div>
			</div>
		</div>
	</section>
	<section class="container mt-3" id="new-mozzle">
		<h4>My 모즐!</h4>
		<div class="swiper-container sw-new-mozzle">
		
			<div class="swiper-wrapper">
				<c:forEach var="mozzle" items="${mList}">
					<div class="swiper-slide">
						<a href="./home.do">
							<c:choose>
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
									<img class="card" src="<%=request.getContextPath()%>/resources/upload/basic.png" alt="img" /><br />
	   							</c:otherwise>
							</c:choose>
							<p class="mozzle_title">${mozzle.mozzle_name}</p>
							<p>리더 : ${mozzle.mozzle_id}&nbsp;&nbsp;멤버 : ${mozzle.memberCnt}</p>
							<p>${mozzle.mozzle_intro}</p> 
						</a> 
					</div>  
				</c:forEach>
			</div> 
		</div>
	</section>

	<section class="container mt-3" id="new-mozzle">
		<h4>새로 생긴 모즐!</h4>
		<div class="swiper-container sw-new-mozzle">
		
			<div class="swiper-wrapper">
				<c:forEach var="mozzle" items="${mList}">
					<div class="swiper-slide">
						<a href="./home.do">
							<c:choose>
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
									<img class="card" src="<%=request.getContextPath()%>/resources/upload/basic.png" alt="img" /><br />
	   							</c:otherwise>
							</c:choose>
							<p class="mozzle_title">${mozzle.mozzle_name}</p>
							<p>리더 : ${mozzle.mozzle_id}&nbsp;&nbsp;멤버 : ${mozzle.memberCnt}</p>
							<p>${mozzle.mozzle_intro}</p> 
						</a> 
					</div>  
				</c:forEach>
			</div> 
		</div>
	</section>
	<br />
	<section class="container mt-3" id="new-mozzle2">
		<h4>Best 모즐!</h4>
		<div class="swiper-container sw-new-mozzle2">
			<div class="swiper-wrapper">
				<c:forEach var="mozzle" items="${mList}">
					<div class="swiper-slide">
						<a href="./home.do">
							<c:choose>
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
									<img class="card" src="<%=request.getContextPath()%>/resources/upload/basic.png" alt="img" /><br />
	   							</c:otherwise>
							</c:choose>
							<p class="mozzle_title">${mozzle.mozzle_name}</p>
							<p>리더 : ${mozzle.mozzle_id}&nbsp;&nbsp;멤버 : ${mozzle.memberCnt}</p>
							<p>${mozzle.mozzle_intro}</p> 
						</a> 
					</div>  
				</c:forEach>
			</div>
		</div>
	</section>
	<section class="container mt-3">
		<img class="width-100" src="<%=request.getContextPath()%>/resources/images/bn2.png" />
	</section>
	<br />
	<br />

	<jsp:include page="../comm/footer.jsp" />


	<div>
		<h1>임의로 만든 이동페이지</h1>
		<a href="./guestInvite.do">김보영-게스트URI뿌리는 곳으로 이동</a>
	</div>
</body>
</html>