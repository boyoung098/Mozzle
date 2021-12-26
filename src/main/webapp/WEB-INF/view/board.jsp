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
	<div id="header"></div>
<%-- 	<section class="container mt-3" id="new-mozzle2">
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
							<button class="join-btn">가입요청</button>
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
				<div class="board-container" id="items">
					<div class="txt mt-3">
						<!-- <form action="./insertBoard.do" method="post" id="insertcontent">
						<div class="">
							<div class="form-group">
								<label>게시글 작성</label>
								<textarea name="ir1" id="ir1" rows="10" cols="100">내용을 입력해주세요.</textarea>
							</div>
							<input type="submit" class="btn btn-block btn-bg" value="새 글작성">
						</div>
					</form> -->
						<form method="post" action="./insertBoard.do">
							<textarea id="summernote" name="content"></textarea>
							<button id="subBtn" type="button">글 작성</button>
						</form>
						<form action="./updateboard.do" method="get" id="hupdate">
						<input type="hidden" id="post_id" name="post_id" value="${boardlist.content}">
					</form>
					</div>

					<div class="board-top mt-3">
						<select class="board-sel selectbox">
							<option value="new1">최신 순</option>
							<option value="new2">인기 순</option>
						</select>
					</div>
					<c:forEach var="boardobj" items="${requestScope.boardlist}">
						<section id="board-card-list">
							<div class="borad-box row" id="borad-box">
								<div class="col-sm-11 board-box-list">
									<div class="meeber-thumbnail">
										<img src="./resources/images/weast044_01.jpg" alt="하늘">
									</div>
									<span>${boardobj.user_id}</span> <span>${boardobj.regdate}</span>
								</div>
								<div class="col-sm-1 drop-board-box">
									<i class="xi-ellipsis-h xi-2x"></i>
									<ul class="drop-board">
										<li><a class="btn-invite" id="board_update">수정</a></li>
										<li><a class="btn-invite" id="board_delete">삭제</a></li>
										<!-- <li><button class="btn-invite">주소복사</button></li> -->
										<li><button id="myModal2" class="btn-invite no-padding"
												data-toggle="modal" data-target="#myModal2">신고</button></li>
									</ul>
								</div>
								<div class="board-text-container">
									<p>${boardobj.content}</p>
									<!-- 댓글 -->
									<div id="reply-comment">${result.content}
										${result.regdate}</div>
									<!-- 댓글 -->
								</div>

								<div class="board-cion">
									<div class="comment-icon">
										<i class="xi-star-o xi-2x"></i>
									</div>
									<div class="comment-icon comment-write">
										<i class="xi-speech-o xi-2x"></i>
									</div>
									<div class="comment">
										<form id="reply" action="./reinboard.do" method="post">
											<input type="text" id="contentId"
												class="form-control comment-input" name="contentId" /> <input
												type="submit" value="댓글" class="comment-btn"
												id="comment-btn" />
										</form>
									</div>
								</div>

							</div>
						</section>
					</c:forEach>
				</div>


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
				<!-- <div class="mozzle-member">
					<div class="member-title">
						<div class="member-box">
							<h4>멤버</h4>
							<span>123</span>
						</div>
						<button type="button" id="invite-user" class="btn-invite">멤버 초대</button>
					</div>
					<div class="member-box input-search">
						<form action="" method="">
							<input type="text" class="form-control" placeholder="멤버 검색">
							<span class="input-group-btn">
								<button class="btn btn-default" type="button">
									<span class="glyphicon glyphicon-search"></span>
								</button>
							</span>
						</form>
					</div>
					<ul>
						<li id="invite" value="invite" data-toggle="modal"
							data-target="#myModal">
							<div class="meeber-thumbnail">
								<img src="./resources/images/weast044_01.jpg" alt="하늘">
							</div> <span>아프리카</span>
						</li>
					</ul>
				</div> -->

			</div>
		</div>

	</section>
 --%>



	<div id="footer"></div>
	<%-- <jsp:include page="./comm/footer.jsp" /> --%>
	<!-- <script type="text/javascript">
		 $(document).ready(function(){
			$("#comment-btn").click(function(){
				console.log("들어 온다?");
				
				
			 	var mdata = document.getElementById('content').value;
				console.log(mdata);
				$.ajax({
					url:"./reinboard.do",
					type:"POST",
					data: mdata,
					dataType:"JSON",
					async : true,
					success: function(){
						console.log(result.result);
						$("#content").val('');
					},
					error: function(error){
						console.log("에러 : " + error);
					}
				})  
				
			});
		}); 
			
		
	</script> -->
	<script type="text/javascript">
		function goWrite(frm){
			var content = frm.content.value;
			
			if(content.eqauls == ""){
				alert("내용을 입력해주세요.");
				return false;
			}
			frm.submit();
		}
	</script>
	




</body>
</html>