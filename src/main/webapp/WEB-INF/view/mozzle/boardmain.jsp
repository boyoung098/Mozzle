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
<%-- <script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/HuskyEZCreator.js"></script> --%>
<script src="./resources/js/summernote/summernote-lite.js"></script>
<script src="./resources/js/summernote/lang/summernote-ko-KR.js"></script>

<link rel="stylesheet" href="./resources/css/summernote/summernote-lite.css">

<script type="text/javascript">
$(document).ready(function() {
	//여기 아래 부분
	$('#summernote').summernote({
		  height: 300,                 // 에디터 높이
		  minHeight: null,             // 최소 높이
		  maxHeight: null,             // 최대 높이
		  focus: true,                  // 에디터 로딩후 포커스를 맞출지 여부
		  lang: "ko-KR",					// 한글 설정
		  placeholder: '최대 2048자까지 쓸 수 있습니다'	//placeholder 설정
          
	});
	
	$("#invite-user").click(function(){
		location.href="./guestInvite.do?mozzle_id=1";
	})
});
</script>
</head>
<body>
	<div id="header"></div>
	<section class="container mt-3" id="new-mozzle2">
		<div class="row content">
			<div class="col-sm-9">
				<div class="mo-img">
					<img src="<%=request.getContextPath()%>/resources/images/main.png"
						alt="메인" />
					<div class="mo-text">
						<h4>로아하는 로아인 모여!<a href="./manage/modifyMozzleForm.do" style="color:red; font-size:12px;">모즐 설정</a></h4>
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
	<div id="footer"></div>


</body>
</html>