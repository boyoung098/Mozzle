<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<style>
.search {
	height: 40px;
	width: 100%;
	border-radius: 100px;
	border: 1px solid #ddd;
	padding-left: 10px;
}

.select_bar {
	padding-top: 17px;
}

.container h3 {
	margin-top: 40px;
	font-weight: 600;
}

.swiper-slide .mozzle_title {
	font-size: 16px;
	padding-top: 10px;
	font-weight: 700;
}

.swiper-slide p {
	width: 90%;
	font-size: 13px;
	margin-bottom: 5px;
}

.intput-width {
	width: 65%;
}


.search-input {
	border: none;
	padding: 0;'
}

input:focus, select:focus {
	outline: transparent !important;
}
#search-btn{
	border: none;
	background-color: rgba(0, 0, 0, 0);
}
</style>
</head>

<body>
	<nav class="navbar container">
		<div class="container-fluid">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target="#myNavbar">
					<span class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="./"><img
					src="<%=request.getContextPath()%>/resources/images/logo/logo.png" /></a>
			</div>
			<div class="collapse navbar-collapse select_bar" id="myNavbar">
				<ul class="nav navbar-nav navbar-center">
					<li>
						<form action="#">
							<div class="input-group intput-width search">
								<input type="text" class="form-control search-input"
									placeholder=" 찾으시는 모임이 있나요?" />
									<div class="input-group-btn">
										<button id="search-btn" class="btn btn-default" type="submit">
											<i class="glyphicon glyphicon-search"></i>
										</button>
									</div>
								
							</div>
						</form>
					</li>
				</ul>

				<ul class="nav navbar-nav navbar-right">
					<c:if test="${empty param.userId}">
						<li><a href="./loginPage.do">로그인</a></li>
						<li><a href="./registerPage.do">회원가입</a></li>
					</c:if>
					<c:if test="${not empty param.userId}">
						<li><a href="./">${param.userId}님</a></li>
						<li><a href="./">마이페이지</a></li>
						<li><a href="./logout.do">로그아웃</a></li>
					</c:if>
				</ul>
			</div>
		</div>
	</nav>
	<hr class="nav-hr" />

</body>
</html>