<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script>


</script>
	<div class="mt-3">
		<div class="input-group input-search mt-2" >
			<form method="post" id="frm_search" onsubmit="javascript:retrun false;">
				<input type="text" class="form-control" name="keyword" id="keyword" placeholder="게시글 검색" value="${keyword}"> 
				<span class="input-group-btn">
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
										<i class="xi-ellipsis-h xi-2x drop-board-box"></i>
										
										<button>삭제</button>
										<button>수정</button>
										<button>신고</button>
									</div>
								</div>
							</div>
							<div class="board-text-container">
								<p>${post.content}</p>
								<div id="replyload">
								
								</div>
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

