<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<% 	
	String keyword = (String) session.getAttribute("keyword");
	session.setAttribute("keyword", "");
	System.out.println(keyword);
%> 
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
	padding: 0;
	'
}

input:focus, select:focus {
	outline: transparent !important;
}

#search-btn {
	border: none;
	background-color: rgba(0, 0, 0, 0);
}

.navbar-right li {
	text-align: center;
}

.dropdown-menu {
	width: 350px;
	left: 50% !important;
	right: auto !important;
	transform: translate(-50%, 0);
}



.notice-img{
	float: left;
}

.wrap{
	word-break: break-all;
    white-space: normal;
}
.notice-list a{
	min-height: 80px;
}
.notice-list a.checked{
	background-color: #eee;
}
</style>

<script>
	$(function() {
		$("#myPageGo").click(function(e) {
			e.preventDefault();
			$("#myPageGo-form").submit();
		});
		
		$(".dropdown").on("show.bs.dropdown", function(e){
			$(".dropdown-menu").empty();
			$.ajax({
				url : "<%=request.getContextPath()%>/notice/notification.do",
				type : "post",
				data : {
					userId: "${sessionScope.userId}",
				},
				success : function(result) {
					console.log(result);
					$(result).each(function(){
						console.log(this);
						// 알림에 따라 변수 처리
						var link;
						var content;
						if(this.TYPE == "가입"){
							content = this.MOZZLE_NAME + "가입을 환영합니다!";
							link = "<%=request.getContextPath()%>/firstmozzle.do?mozzle_id=" + this.MOZZLE_ID;
						}
						else if(this.TYPE == "탈퇴"){
							content = this.MOZZLE_NAME + "에서 탈퇴되었습니다."
						}
						// HTML Element 생성
						var $noticeli = $("<li></li>").addClass("notice-list");
						var $noticea = $("<a></a>").attr("href", link);
						if(this.READ_CHECKED == 'Y'){
							$noticea.addClass("checked");
						}
						var src = "<%=request.getContextPath()%>/resources/upload/" + this.IMAGE_SAVED;
						var $noticediv = $("<div><div class='notice-img'><img width='75' height='75' src='" + src + "' /></div><div><p class='wrap'><b>" + this.MOZZLE_NAME + "</b></p><p class='wrap'>" + content + "</p></div></div>").addClass("flex");
						
						var $notice = $noticeli.append($noticea.append($noticediv));
						$(".dropdown-menu").append($notice);
					
					});
					
					
				}
			});
		});

	});
	
</script>

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
				<a class="navbar-brand" href="<%=request.getContextPath()%>"><img
					src="<%=request.getContextPath()%>/resources/images/logo/logo.png" /></a>
			</div>
			<div class="collapse navbar-collapse select_bar" id="myNavbar">
				<ul class="nav navbar-nav navbar-center">
					<li>
						<form action="./browseMozzlePage.do" method="post">
							<div class="input-group intput-width search">
								<input type="text" class="form-control search-input"
									name="keyword" placeholder=" 찾으시는 모임이 있나요?" value="<%= keyword %>"/>
								<div class="input-group-btn">
									<button type="submit" id="search-btn" class="btn btn-default">
										<i class="glyphicon glyphicon-search"></i>
									</button>
								</div>
							</div>
						</form>
					</li>
				</ul>
				<ul class="nav navbar-nav navbar-right">
					<c:if test="${empty sessionScope.userId}">
						<li><a href="<%=request.getContextPath()%>/loginPage.do">로그인</a></li>
						<li><a href="<%=request.getContextPath()%>/registerPage.do">회원가입</a></li>
					</c:if>
					<c:if test="${not empty sessionScope.userId}">
						<li class="dropdown"><a id="notification" href="#" data-toggle="dropdown">${sessionScope.userId}님</a>
							<ul class="dropdown-menu">
								<li><a href="#">HTML</a></li>
								<li><a href="#">CSS</a></li>
								<li><a href="#">JavaScript</a></li>
							</ul></li>
						<li><a id="myPageGo" href="#">마이페이지</a></li>
						<li><a id="logoutGo"
							href="<%=request.getContextPath()%>/logout.do">로그아웃</a></li>
					</c:if>
				</ul>
				<form id="myPageGo-form"
					action="<%=request.getContextPath()%>/user/myPage.do" method="post">
					<input type="hidden" name="auth" value="false" />
				</form>
			</div>
		</div>
	</nav>
	<hr class="nav-hr" />

</body>
</html>
