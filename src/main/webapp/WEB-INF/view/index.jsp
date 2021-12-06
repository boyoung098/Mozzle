<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Bootstrap Example</title>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<jsp:include page="./comm/import.jsp" />

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" />
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/swiper-bundle.min.css" />
<script
	src="<%=request.getContextPath()%>/resources/js/swiper-bundle.min.js"></script>
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
	<jsp:include page="./comm/header.jsp" />
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
					<a href="#"><img class="card" src="test.jpg" alt="" /><br />
						<b>로아 하는 로아인 모여!</b>
						<p>리더 : 로아로아&nbsp;&nbsp;멤버 : 101</p>
						<p>혼자하기 어려운 레이드, 던전 같이 해요! 옾톡, 디코 필수입니다!!</p> </a>
				</div>
				<div class="swiper-slide">
					<a href="#"><img class="card" src="test.jpg" alt="" /><br />
						<b>로아 하는 로아인 모여!</b>
						<p>리더 : 로아로아&nbsp;&nbsp;멤버 : 101</p>
						<p>혼자하기 어려운 레이드, 던전 같이 해요! 옾톡, 디코 필수입니다!!</p> </a>
				</div>
				<div class="swiper-slide">
					<a href="#"><img class="card" src="test.jpg" alt="" /><br />
						<b>로아 하는 로아인 모여!</b>
						<p>리더 : 로아로아&nbsp;&nbsp;멤버 : 101</p>
						<p>혼자하기 어려운 레이드, 던전 같이 해요! 옾톡, 디코 필수입니다!!</p> </a>
				</div>
				<div class="swiper-slide">
					<a href="#"><img class="card" src="test.jpg" alt="" /><br />
						<b>로아 하는 로아인 모여!</b>
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
					<a href="#"><img class="card" src="test.jpg" alt="" /><br />
						<b>로아 하는 로아인 모여!</b>
						<p>리더 : 로아로아&nbsp;&nbsp;멤버 : 101</p>
						<p>혼자하기 어려운 레이드, 던전 같이 해요! 옾톡, 디코 필수입니다!!</p> </a>
				</div>
				<div class="swiper-slide">
					<a href="#"><img class="card" src="test.jpg" alt="" /><br />
						<b>로아 하는 로아인 모여!</b>
						<p>리더 : 로아로아&nbsp;&nbsp;멤버 : 101</p>
						<p>혼자하기 어려운 레이드, 던전 같이 해요! 옾톡, 디코 필수입니다!!</p> </a>
				</div>
				<div class="swiper-slide">
					<a href="#"><img class="card" src="test.jpg" alt="" /><br />
						<b>로아 하는 로아인 모여!</b>
						<p>리더 : 로아로아&nbsp;&nbsp;멤버 : 101</p>
						<p>혼자하기 어려운 레이드, 던전 같이 해요! 옾톡, 디코 필수입니다!!</p> </a>
				</div>
				<div class="swiper-slide">
					<a href="#"><img class="card" src="test.jpg" alt="" /><br />
						<b>로아 하는 로아인 모여!</b>
						<p>리더 : 로아로아&nbsp;&nbsp;멤버 : 101</p>
						<p>혼자하기 어려운 레이드, 던전 같이 해요! 옾톡, 디코 필수입니다!!</p></a>
				</div>
			</div>
		</div>
	</section>
	<section class="container mt-3">
		<img src="bn2.png" />
	</section>
	<br />
	<br />

	<jsp:include page="./comm/footer.jsp" />

</body>
</html>
