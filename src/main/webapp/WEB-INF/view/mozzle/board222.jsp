<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script>

function searchbtn(){
	var data = $("#keyword").val();
	$.ajax({
		type:'POST',
		url : './searchBoard.do',
		data: {
			"content":data,
			},
		dataType:"html",
		async:true,
		success : function(result){
			console.log(result);
			 $("#test").load('./board.do');
		}
	})
}

function fn_search(){
	$("#listForm").submit();
	return false;
	}
</script>
	<div class="mt-3">
		
	
		<div class="input-group input-search mt-2" >
			<form action="./searchBoard.do" method="post" id="frm_search">
				<input type="text" class="form-control" name="content" id="keyword" placeholder="게시글 검색"> 
				<span class="input-group-btn">
					<button class="btn btn-default" type="submit" id="search_area" >
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
				<option value="new1">최신 순2222</option>
				<option value="new2">인기 순</option>
			</select>
		</div>
		<div id="test">
		<c:forEach var="boardobj" items="${requestScope.searchboardlist}" varStatus="status">
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
						
						<div class="board-cion">
							<span class="comment-write">답글</span>
							
							<div>
								<i class="xi-ellipsis-h xi-2x drop-board-box"></i>
								<ul class="drop-board" style="display:block;">
									<li><a class="btn-invite" id="board_update" onclick="board_update(${boardobj.post_id}, ${boardobj.user_id}, ${boardobj.regdate}, ${boardobj.content})">수정</a></li>
									<li><a class="btn-invite" id="board_delete" onclick="board_delete(${boardobj.post_id})">삭제</a></li>
									<!-- <li><button class="btn-invite">주소복사</button></li> -->
									<li><button id="myModal2" class="btn-invite no-padding"
											data-toggle="modal" data-target="#myModal2">신고</button></li>
								</ul>
							</div>
						</div>
					</div>
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

