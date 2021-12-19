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
<%@ include file="/WEB-INF/view/comm/import.jsp" %>
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




			</div>
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
		</div>

	</section>

	<div id="footer"></div>





</body>
</html>