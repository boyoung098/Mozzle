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
<script src="<%=request.getContextPath()%>/resources/js/summernote/summernote-lite.js"></script>
<script src="<%=request.getContextPath()%>/resources/js/summernote/lang/summernote-ko-KR.js"></script>

<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/summernote/summernote-lite.css">

<script type="text/javascript">
$(document).ready(function() {
	//여기 아래 부분
	$('#summernote').summernote({
		  height: 250,                 // 에디터 높이
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

<div class="content">
	<div class="board-container" id="items">
		<div class="txt mt-3">
			<h4>글 작성</h4>
			<textarea id="summernote" name="content" class="comments" style="width: 500px" rows="3" cols="30"></textarea>
			<button id="commentWrite" onclick = 'inputComment()'>글 작성</button>
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
						<li><a class="btn-invite" id="board_update">수정</a></li>
						<li><a class="btn-invite" id="board_delete">삭제</a></li>
						<!-- <li><button class="btn-invite">주소복사</button></li> -->
						<li><button id="myModal2" class="btn-invite no-padding"
								data-toggle="modal" data-target="#myModal2">신고</button></li>
					</ul>
				</div>
				<div class="board-text-container">
					<p>${boardobj.content}</p>
				
					<div class="comment_box" id="comment_box${boardobj.post_id}" style="height:100px; width:100%; background:#ddd;">
					
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
	</div>
	
<script type="text/javascript">
function inputComment() {
	var content = $("#summernote").val();
	console.log(content);
	$.ajax({
		type:'POST',
		url : './insertBoard.do',
		data: {
			"incontent":content,
			},
		dataType:"JSON",
		async:true,
		success : function(reinsert){
			
        		
		}
	})
}
	

/*
 * 댓글 등록하기(Ajax)
 */
function registComment(seq) {
	var content = $("#contentId").val();
	var user = '<c:out value="${boardobj.user_id}"/>';
	console.log(content);
	$.ajax({
		type:'POST',
		url : './addComment.do',
		data: {
			"fmcontent":content,
			"postId":seq
			},
		dataType:"JSON",
		async:true,
		success : function(reinsert){
			//alert(reinsert);
			if(reinsert == true){
				//document.getElementById("comment_box").innerHTML = "대글";
				$('#comment_box' + seq).append('<div>'+user+'</div>');
				$('#comment_box' + seq).append('<div>'+content+'</div>');
				//console.log("성공");
				
			} 
        		
		},
        error:function(){
        	alert("내용을 입력 해주세요.");
       } 
	})
}

</script>

</body>
</html>