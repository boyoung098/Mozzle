<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<section id="board-card-list">
	<div class="borad-box row" id="borad-box">
		<div class="col-sm-11 board-box-list">
			<div class="meeber-thumbnail">
				<img src="../resources/images/weast044_01.jpg" alt="하늘">
			</div>
			<span>${sessionScope.userId}</span> <span>${boardobj.regdate}</span>
		</div>
		<div class="col-sm-1 drop-board-box">
			<i class="xi-ellipsis-h xi-2x"></i>
			<ul class="drop-board">
				<li><button class="btn-invite" onclick="board_update()">수정</button></li>
				<li><button class="btn-invite" onclick="board_delete()">삭제</button></li>
				<li><button class="btn-invite">주소복사</button></li>
				<li><button id="myModal2" class="btn-invite no-padding"
						data-toggle="modal" data-target="#myModal2">신고</button></li>
			</ul>
		</div>
		<div class="board-text-container">
			<p>${boardobj.content}</p>
		</div>
		<!-- 댓글 -->
		<div id="reply-comment">wefwfwefewf</div>
		<!-- 댓글 -->

		<div class="board-cion">
			<div class="comment-icon">
				<i class="xi-star-o xi-2x"></i>
			</div>
			<div class="comment-icon comment-write">
				<i class="xi-speech-o xi-2x"></i>
			</div>
			<div class="comment">
				<form action="../reinboard.do" method="post" id="reply">
					<input type="text" name="comment-id" id="comment-id"
						class="form-control comment-input" name="content" /> <input
						type="button" value="댓글" class="comment-btn" id="comment-btn"
						onclick="fn_comment(${boardobj.post_id})" />
				</form>
			</div>
		</div>

	</div>
</section>
