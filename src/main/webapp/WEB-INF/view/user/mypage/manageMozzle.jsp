<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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

</style>
<script>
$(function(){
	var swiper_n = new Swiper(".sw-new-mozzle", {
    	slidesPerView: 4,
        slidesPerColumn: 2,
        slidesPerColumnFill: 'row',
		spaceBetween : 50,
		loop : false,
	});
})

</script>
</head>
<body>
	<c:if test="${userId != null}">
		<section class="mt-3" id="new-mozzle">
			<h4>My 모즐!</h4>
			<div class="swiper-container sw-new-mozzle">
				<div class="swiper-wrapper">
					<c:forEach var="mozzle" items="${myMozzleList}">
						<div class="swiper-slide">
							<a href="../firstmozzle.do?mozzle_id=${mozzle.mozzle_id}"> <c:choose>
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
</body>
</html>