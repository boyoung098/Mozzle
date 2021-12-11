<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>메인페이지</title>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<jsp:include page="./comm/import.jsp" />

<style>
.card {
	width: 90%;
	height: 100%;
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
	<jsp:include page="./comm/header.jsp" >
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
		<h4>새로 생긴 모즐!</h4>
		<div class="swiper-container sw-new-mozzle">
			<div class="swiper-wrapper">
				<div class="swiper-slide">
					<a href="./home.do"><img class="card" src="./resources/images/g1.png" alt="" /><br />
						<p class="mozzle_title">로아 하는 로아인 모여!</p>
						<p>리더 : 로아로아&nbsp;&nbsp;멤버 : 101</p>
						<p>혼자하기 어려운 레이드, 던전 같이 해요! 옾톡, 디코 필수입니다!!</p> 
					</a>
				</div>
				<div class="swiper-slide">
					<a href="#"><img class="card" src="./resources/images/g2.png" alt="" /><br />
						<p class="mozzle_title">로아 하는 로아인 모여!</p>
						<p>리더 : 로아로아&nbsp;&nbsp;멤버 : 101</p>
						<p>혼자하기 어려운 레이드, 던전 같이 해요! 옾톡, 디코 필수입니다!!</p> </a>
				</div>
				<div class="swiper-slide">
					<a href="#"><img class="card" src="./resources/images/g3.png" alt="" /><br />
						<p class="mozzle_title">로아 하는 로아인 모여!</p>
						<p>리더 : 로아로아&nbsp;&nbsp;멤버 : 101</p>
						<p>혼자하기 어려운 레이드, 던전 같이 해요! 옾톡, 디코 필수입니다!!</p> </a>
				</div>
				<div class="swiper-slide">
					<a href="#"><img class="card" src="./resources/images/g4.png" alt="" /><br />
						<p class="mozzle_title">로아 하는 로아인 모여!</p>
						<p>리더 : 로아로아&nbsp;&nbsp;멤버 : 101</p>
						<p>혼자하기 어려운 레이드, 던전 같이 해요! 옾톡, 디코 필수입니다!!</p></a>
				</div>
			</div>
		</div>
	</section>
	<br />
	<section class="container mt-3" id="new-mozzle2">
		<h4>새로 생긴 모즐!</h4>
		<div class="swiper-container sw-new-mozzle2">
			<div class="swiper-wrapper">
				<div class="swiper-slide">
					<a href="#"><img class="card" src="./resources/images/g1.png" alt="" /><br />
						<p class="mozzle_title">로아 하는 로아인 모여!</p>
						<p>리더 : 로아로아&nbsp;&nbsp;멤버 : 101</p>
						<p>혼자하기 어려운 레이드, 던전 같이 해요! 옾톡, 디코 필수입니다!!</p> </a>
				</div>
				<div class="swiper-slide">
					<a href="#"><img class="card" src="./resources/images/g2.png" alt="" /><br />
						<p class="mozzle_title">로아 하는 로아인 모여!</p>
						<p>리더 : 로아로아&nbsp;&nbsp;멤버 : 101</p>
						<p>혼자하기 어려운 레이드, 던전 같이 해요! 옾톡, 디코 필수입니다!!</p> </a>
				</div>
				<div class="swiper-slide">
					<a href="#"><img class="card" src="./resources/images/g3.png" alt="" /><br />
						<p class="mozzle_title">로아 하는 로아인 모여!</p>
						<p>리더 : 로아로아&nbsp;&nbsp;멤버 : 101</p>
						<p>혼자하기 어려운 레이드, 던전 같이 해요! 옾톡, 디코 필수입니다!!</p> </a>
				</div>
				<div class="swiper-slide">
					<a href="#"><img class="card" src="./resources/images/g4.png" alt="" /><br />
						<p class="mozzle_title">로아 하는 로아인 모여!</p>
						<p>리더 : 로아로아&nbsp;&nbsp;멤버 : 101</p>
						<p>혼자하기 어려운 레이드, 던전 같이 해요! 옾톡, 디코 필수입니다!!</p></a>
				</div>
			</div>
		</div>
	</section>
	<section class="container mt-3">
		<img class="width-100" src="./resources/images/bn2.png" />
	</section>
	<br />
	<br />

	<jsp:include page="./comm/footer.jsp" />


	<div>
		<h1>임의로 만든 이동페이지</h1>
		<a href="./guestInvite.do?mozzle_id=1">김보영-게스트URI뿌리는 곳으로 이동</a>
	</div>
</body>
</html>
