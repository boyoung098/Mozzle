<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script>
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script>

<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.js"></script>


<script>

$(document).ready(function(){
	$("#search_area").on("click",function(){
		var data = $("#data").val();
		$.ajax({
			type:'POST',
			url : './searchBoard.do',
			data: { "data":data },
			dataType:"json",
			contetnType : "application/json",
			success : function(d){
				console.log("success");
				console.log(d);
				
			},
			error : function(e){
				console.log("error");
				console.log(e);
			},
			complete: function(result){
				console.log("complete");
				console.log(result);
			}
			
		})	 
	});
}); 


</script>
	<div class="mt-3">
		
		<textarea name="content" id="summernote" class="summernote"></textarea>

		<div class="input-group input-search mt-2" >
			<form method="post" id="frm_search" onsubmit="javascript:retrun false;" action="./searchBoard.do">
				<input type="text" class="form-control" name="keyword" id="keyword" placeholder="게시글 검색" value="${keyword}"> 
				<span class="input-group-btn">
					<button class="btn btn-default" id="search_area" type="submit">
						<span class="glyphicon glyphicon-search"></span>
					</button>
				</span>
			</form>
		</div> 
		<div class="board-container" id="items">
			<div class="txt mt-3">
				<c:if test="${userId != null}">
					<button data-toggle="modal" data-target="#myModal">글쓰기</button>
				</c:if>
			</div> 
			
		</div>
		<div class="board-top mt-2">
			<select class="board-sel selectbox">
				<option value="new1">최신 순</option>
				<option value="new2">인기 순</option>
			</select>
		</div>

		<c:forEach var="boardobj" items="${requestScope.boardlist}" varStatus="status">
			<section id="board-card-list">
				<div class="borad-box row" id="borad-box">
					<div class="col-sm-10 board-box-list">
						<div class="meeber-thumbnail">
							<img src="./resources/images/weast044_01.jpg" alt="하늘">
						</div>
						<input type="hidden" id="postId" value="${boardobj.post_id}">
						<span>${boardobj.user_id}</span> <span>${boardobj.regdate}</span>
					</div>
					<div class="col-sm-2">
						<c:if test="${mozzleUserdto.user_id != null}">
						<div class="board-cion">
							<i class="xi-ellipsis-h xi-2x drop-board-box"></i>
							<ul class="drop-board" style="display:block;">
								<li><a class="btn-invite" id="board_update" onclick="board_update(${boardobj.post_id}, ${boardobj.user_id}, ${boardobj.regdate}, ${boardobj.content})">수정</a></li>
								<li><a class="btn-invite" id="board_delete" onclick="board_delete(${boardobj.post_id})">삭제</a></li>
								<!-- <li><button class="btn-invite">주소복사</button></li> -->
								<li><button id="myModal2" class="btn-invite no-padding"
										data-toggle="modal" data-target="#myModal2">신고</button></li>
							</ul>
						</div>
						</c:if>
					</div>
					<span class="comment-write">답글</span>
					<div class="comment" >
						<textarea class="form-control comment-input" name="contentId"  id="contentId" rows="5"></textarea>
						<button class="comment-btn" id="comment-btn" onclick = 'registComment(${boardobj.post_id})'>댓글</button>
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
      	<textarea id="summernote" name="comments" class="comments" rows="10" cols="68"></textarea>
		<div class="modal-btn">
			<button id="commentWrite" class="color-btn" onclick = 'inputComment()'>글 작성</button>
		</div>
      </div>
    </div>

  </div>
</div>

