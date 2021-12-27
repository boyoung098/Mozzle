<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style>
#reply-show-button{
	width: 100%;
	height: 100%;
	border: 1px solid #ddd;
	text-align: center;
	padding: 10px;
}

#reply-show-button p {
	margin: 0px;
}

#reply-show-button:hover {
	box-shadow: 1px 1px 1px #aaa;
	cursor: pointer;
	transition-duration: 0.1s;
}

#content{
  width: 100%;
  }
  
.profil-image{
    width: 200px;
    height: 200px;
    object-fit: cover;
    border-radius: 100%;
}
</style>
<script>

$( document ).ready(function() {
	   flag01 = true;
	   flag02 = true;
	});

function replyShow(obj) {
	
	if(flag01 == true) {
		document.getElementById("reply-list-show-"+ obj).style.display = "";
		flag01 = false;
	} else {
		document.getElementById("reply-list-show-"+ obj).style.display = "none";
		flag01 = true;
	}
	
	
	$.ajax({
		url : "<%=request.getContextPath()%>/replyShow.do?refer=" + obj,
		type : "post",
		success : function(data) {
			if (data.isc == true) {
				var replyList = data.replyList;
				console.log('replyList');
				console.log(replyList);
				var replyListBox = document.getElementById("reply-list-"+ obj);
			
				if (replyList.length != 0) {
					while(replyListBox.hasChildNodes()) {
						replyListBox.removeChild(replyListBox.firstChild);
					}
					$(replyList).each(function(){
						var img = "<img alt='답글' src='<%=request.getContextPath()%>/resources/images/reply.png' title='답글' >";
						var blank = "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp";
						var result = "";
						
						if(this.depth > 0) {
							for(var i = 0; i < this.depth; i++) {
								result += blank;	
							}
							result += img;
						}
						
						var replyHTML = '';
						replyHTML = "<br><tr><td>" + 
						result + 
						"&nbsp;&nbsp;";
						
						if(this.delflag == 'N') {
							replyHTML = replyHTML + 
							this.user_id +
							"</td><td>&nbsp;&nbsp;" +
							this.regdate + 
							"</td><td>&nbsp;&nbsp;" +
							this.content +
							"</td><td>&nbsp;&nbsp;" + 
							"<a onclick = 'showReplyInput("+
							this.post_id +
							")'>답글</a>&nbsp;|&nbsp" +
							"<a onclick = 'deleteReply("+
							this.post_id +
							", " +
							this.refer +
							")'>삭제</a>" +
							"</td><tr><td>" + 
							"<div id='reply-input-" +
							this.post_id +
							"' style='display:none' >" +
							"<input type='text' class='form-control' id='reply-" + 
							this.post_id +
							"' name='content' />" +
							"<input type='hidden' id='save-info-post-id' value='" +
							this.post_id +
							"'/>" +
							"<input class='btn btn-default' type='button' onclick='submitReply(" +
							this.post_id+
							", " +
							this.refer+
							")' value='등록' />" +
							"</div>" +
							"</td></tr>";
						} else {
							console.log()
							replyHTML = replyHTML + '삭제된 댓글입니다.</td></tr>'; 
						}
						
						replyListBox.innerHTML += replyHTML;
						
						}) 	
				} else {
					while(replyListBox.hasChildNodes()) {
						replyListBox.removeChild(replyListBox.firstChild);
					} 
					replyListBox.append("등록된 댓글이 없습니다");
				}
			}
		}
	});
};

function showReplyInput(obj) {
	if(flag02 == true) {
		document.getElementById("reply-input-"+ obj).style.display = "";
		flag02 = false;
	} else {
		document.getElementById("reply-input-"+ obj).style.display = "none";
		flag02 = true;
		replyShow(obj);
	}
}

function submitReply(obj, refer) {
	
	var content = document.getElementById("reply-"+ obj).value;
	console.log(content);
	var mozzle_id = document.getElementById("save-info-mozzeId").value;
	console.log(mozzle_id)
	$.ajax({
		url : "<%=request.getContextPath()%>/replyIn.do",
		type : "POST",
		data : {
			"post_id": obj,
			"content": content,
			"mozzle_id": mozzle_id
		},	
		success : function(data) {
			if(data == true) {
				alert("등록되었습니다");
				flag01 = true;	
				replyShow(refer);
			}
		}	
	})
}

function submitFisrtReply(obj, refer) {
	var content = document.getElementById("first-reply-content").value;
	console.log(content);
	var mozzle_id = document.getElementById("save-info-mozzeId").value;
	console.log(mozzle_id)
	$.ajax({
		url : "<%=request.getContextPath()%>/replyIn.do",
		type : "POST",
		data : {
			"post_id": obj,
			"content": content,
			"mozzle_id": mozzle_id
		},	
		success : function(data) {
			console.log(data);
			if(data == true) {
				alert("등록되었습니다");
				flag01 = true;
				replyShow(refer);
			}
		}	
	})
}

function deleteReply(obj, refer) {
	
	var url = "<%=request.getContextPath()%>/deleteMozzlePost.do?post_id=" + obj;
	
	$.ajax({
		url : url,
		type : "GET",
		success : function(data) {
			if(data == true) {
				alert("삭제되었습니다");
				flag01 = true;
				replyShow(refer);
			}
		}
	})
}

function insertMozzlePost() {
	
	var content = $("#mozzle-content").val();
	console.log(content);
	var mozzle_id = document.getElementById("save-info-mozzeId").value;
	
	$.ajax({
		url: "<%=request.getContextPath()%>/insertMozzlePost.do",
		type: "POST",
		data: {
			"content": content,
			"mozzle_id": mozzle_id
		},
		success: function(data) {
			if(data == true) {
				alert("게시글이 등록되었습니다");
				$('#default-move-03').click();
			}
		}
		
	})
	
}

</script>

<section id="board-card-list">
<input type="hidden" id="save-info-mozzeId" value="${param.mozzle_id}">
	<div class="borad-box row" id="borad-box">
		<div class="col-sm-10 board-box-list">
			
			<div class="meeber-thumbnail">
				<c:if test="${param.image_saved != ''}">
				<img src="<%=request.getContextPath()%>/storage/${param.image_saved}" alt="">
				</c:if>
				<c:if test="${param.image_saved == ''}">
				<img src="<%=request.getContextPath()%>/resources/images/default_profile.png" alt="">
				</c:if>
			</div>
			<span>${param.nickname}(${param.mozzle_name})</span> <span>${param.regdate}</span>
		</div>
		<div class="col-sm-2">
			<div class="board-cion">
				<div>
					<a onclick="deleteReply(${param.post_id})">삭제</a>&nbsp;| <a href="#">수정</a>&nbsp;|
					<a href="#">신고</a>
				</div>
			</div>
		</div>
		<div class="board-text-container">
			<p>${param.content}</p>
			<div id="replyload"></div>
			<div class="modify"></div>

		</div>

		<div class="borad-reply-container">
			<button id="reply-show-button" onclick="replyShow('${param.refer}')">
				<p>댓글보기</p>
			</button>
			<div id="reply-list-show-${param.refer}" style="display: none">
				<table id="reply-list-${param.refer}">
				</table>
				<br>
				<br>
				<div style="width: 90%;">
					<input type="text" class="form-control" name="first-reply-content"
						id="first-reply-content" style="width: 100%">
				</div>
				<button class="btn btn-default"
					onclick="submitFisrtReply('${param.post_id}', '${param.refer }')">댓글작성</button>
			</div>
		</div>
	</div>
</section>
