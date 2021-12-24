<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script>

	function replyShow(obj) {
		
		$("#reply-list").css("display", "block");

		$.ajax({
			url : "./replyShow.do?refer=" + obj,
			type : "post",
			success : function(data) {
	
				if (data.isc == true) {
					console.log("성공");
					var replyList = data.replyList;
					var replyListBox = document.getElementById("reply-list-"
								+ obj);
				
					if (replyList != null) {
						console.log("성공2");
						for (var i = 0; i < replyList.lenght; i++) {
								
							replyListBox.append("댓글");
						}
					} else {
						console.log("결국 실패");
						replyListBox.append("등록된 댓글이 없습니다");
					}
				}
			}
		})
	};


	
</script>
<div class="mt-3">
	<div class="input-group input-search mt-2">
		<form method="post" id="frm_search"
			onsubmit="javascript:retrun false;">
			<input type="text" class="form-control" name="keyword" id="keyword"
				placeholder="게시글 검색"> <span class="input-group-btn">
				<button class="btn btn-default" id="search_area">
					<span class="glyphicon glyphicon-search"></span>
				</button>
			</span>
		</form>
	</div>
	<div class="board-container" id="items">
		<div class="txt mt-3">
			<button data-toggle="modal" data-target="#myModal">글쓰기</button>
		</div>

	</div>
	<div class="board-top mt-2">
		<select class="board-sel selectbox">
			<option value="new1">최신순</option>
			<option value="new2">내가쓴글</option>
		</select>
	</div>
	<c:forEach var="post" items="${postList}" varStatus="status">
		<section id="board-card-list">
			<div class="borad-box row" id="borad-box">
				<div class="col-sm-10 board-box-list">
					<div class="meeber-thumbnail">
						<img src="" alt="">
					</div>
					<span>${post.user_id}</span> <span>${post.regdate}</span>
				</div>
				<div class="col-sm-2">
					<div class="board-cion">
						<div>
							<a href="#">삭제</a>&nbsp;| <a href="#">수정</a>&nbsp;| <a href="#">신고</a>
						</div>
					</div>
				</div>
				<div class="board-text-container">
					<p>${post.content}</p>
					<div id="replyload"></div>
					<div class="modify"></div>

				</div>

				<div class="borad-reply-container">
					<button id="reply-show-button"
						onclick="replyShow('${post.refer}')">
						<p>댓글보기</p>
					</button>
					<div id="reply-list-${post.refer}">

						
					</div>
					<div>
						<form class="form-inline" action="/action_page.php">
							<div class="form-group" style="width:93%">
								<input type="text" class="form-control" name="content" id="content" style="width:100%">
							</div>
							<div class="form-group" style="width:6%">
								<button type="submit" class="btn btn-default">등록</button>
							</div>
						</form>
					</div>


				</div>

			</div>
		</section>
	</c:forEach>

</div>
<div id="myModal" class="modal fade" role="dialog">
	<div class="modal-dialog">

		<!-- Modal content-->
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">&times;</button>
				<h4>모즐 글 작성</h4>
			</div>
			<div class="modal-body">
				<textarea id="summernote" name="comments" class="comments" rows="10"
					cols="68"></textarea>
				<div class="modal-btn">
					<button id="commentWrite" class="color-btn"
						onclick='inputComment()'>글 작성</button>
				</div>
			</div>
		</div>
	</div>
</div>

