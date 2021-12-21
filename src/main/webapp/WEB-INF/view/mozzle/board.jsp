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

<%@ include file="../comm/import.jsp"%>


<script type="text/javascript">
$(document).ready(function() {
	$("#invite-user").click(function(){
		location.href="./guestInvite.do?mozzle_id=1";
	})
});
</script>
</head>
<body>
	<div class="board-container" id="items">
		<div class="txt mt-3">
			<h4>글 작성</h4>
			<form action="">
				<textarea id="summernote" name="comments" class="comments" style="width: 500px" rows="3" cols="30"></textarea>
				<button id="commentWrite" onclick = 'inputComment()'>글 작성</button>
			</form>
		</div>
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
					<input type="hidden" id="postId" value="${boardobj.post_id}">
					<span>${boardobj.user_id}</span> <span>${boardobj.regdate}</span>
				</div>
				<div class="col-sm-1 drop-board-box">
					<i class="xi-ellipsis-h xi-2x"></i>
					<ul class="drop-board">
						<li><a class="btn-invite" id="board_update" onclick="board_update(${boardobj.post_id}, ${boardobj.user_id}, ${boardobj.regdate}, ${boardobj.content})">수정</a></li>
						<li><a class="btn-invite" id="board_delete" onclick="board_delete(${boardobj.post_id})">삭제</a></li>
						<!-- <li><button class="btn-invite">주소복사</button></li> -->
						<li><button id="myModal2" class="btn-invite no-padding"
								data-toggle="modal" data-target="#myModal2">신고</button></li>
					</ul>
				</div>
				<div class="board-text-container">
					<p>${boardobj.content}</p>
					<div id="replyload"></div>
					<div class="modify">
					</div>
					
					<div class="comment_box_recomment" id="comment_box${boardobj.post_id}">
					<p>${reboardlist.user_id}</p>
					<p>${reboardlist.content}</p>
					</div>
				</div>

				<div class="board-cion">
					<div class="comment-icon">
						<i class="xi-star-o xi-2x"></i>
					</div>
					<div class="comment-icon comment-write">
						<i class="xi-speech-o xi-2x"></i>
					</div>
					<div class="comment" style="display:block;">
							<input type="text" class="form-control comment-input" name="contentId"  id="contentId"/> 
							<button class="comment-btn" id="comment-btn" onclick = 'registComment(${boardobj.post_id})'>댓글</button>
					</div>
				</div>

			</div>
		</section>
	</c:forEach>
	



</body>
</html>