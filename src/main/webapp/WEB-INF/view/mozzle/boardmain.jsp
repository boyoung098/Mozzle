<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>모즐메인</title>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<link rel="icon" type="image/png" sizes="16x16"
	href="<%=request.getContextPath()%>/resources/images/logo/favicon.png">
<%-- <jsp:include page="./comm/import.jsp" /> --%>
<%@ include file="../comm/import.jsp" %>

<script type="text/javascript">
$(document).ready(function() {
	$("#invite-user").click(function(){
		location.href="./guestInvite.do?mozzle_id=1";
	})
});
</script>
</head>
<body>
	<div id="header"></div>
<%-- 	<section class="container mt-3" id="new-mozzle2">
		<div class="row content">
			<div class="col-sm-3 sidenav">
				<div class="input-group input-search" style="width: 86%;">
					<form action="" method="post">
						<input type="text" class="form-control" name="keyword"
							id="keyword" placeholder="모즐 게시글 검색"> <span
							class="input-group-btn">
							<button class="btn btn-default" type="button"
								onclick="searchboard()">
								<span class="glyphicon glyphicon-search"></span>
							</button>
						</span>
					</form>
				</div>
				<div class="new-photo">
					<h4>최신 사진</h4>
					<ul>
						<!-- <li><img src="./image/" alt=""></li>
						<li><img src="./image/" alt=""></li>
						<li><img src="./image/" alt=""></li>
						<li><img src="./image/" alt=""></li>
						<li><img src="./image/" alt=""></li>
						<li><img src="./image/" alt=""></li>
						<li><img src="./image/" alt=""></li> -->
					</ul>
				</div>
				
				<!-- 모즐멤버리스트 뿌리는 곳 -->
				<%@ include file="/WEB-INF/view/mozzle/mozzleMemberList.jsp" %>


			</div>
			<div class="col-sm-9">
				<div class="mo-img">
					<img src="<%=request.getContextPath()%>/resources/images/main.png"
						alt="메인" />
					<div class="mo-text">
						<h4>로아하는 로아인 모여ddd!<a href="./manage/modifyMozzleForm.do" style="color:red; font-size:12px;">모즐 설정</a></h4>
						<p>그들의 그림자는 천고에 사라지지 않는 것이다 이것은 현저하게 일월과 같은 예가 되려니와 그와 같지
							못하고그림자가 사라지지 않는 것이다 그들의 그림자는 천고에 사라지지 않는 것이다 이것은 현저하게 일월과 같은 예가 되
						</p>
						<div class="mo-member">
							<ul>
								<li>리더 : 로아로아</li>
								<li>멤버 : 101</li>
							</ul>
							<button class="join-btn"  onclick="userSessionCheck()" id="joinbtn">가입요청</button>
						</div>
					</div>
					<div class="mo-list">
						<ul>
							<li>게시글</li>
							<li>사진첩</li>
							<li><a href="./calendar.do">일정</a></li>
							<li>설정</li>
						</ul>
					</div>
				</div>
	<%@include file= "/WEB-INF/view/mozzle/mozzleJoinForm.jsp"  %>
<!-- 각자 기능넣기 -->
			
	

		<!-- 	</div>
			</div>


	</section> -->
 --%>
<script type="text/javascript">
function userSessionCheck(){
	var userId = '<%=(String)session.getAttribute("userId")%>';
	console.log(userId);
	if(userId=='null'){
//			console.log(userId+"ss");
		alert('로그인이 되어있지 않습ㄴ디ㅏ.');
		location.href='./loginPage.do'; //로그인페이지로 이동해야함
	}else{
		 $('#joinModal').modal();
	}
	
} 
</script>

</body>
</html>
