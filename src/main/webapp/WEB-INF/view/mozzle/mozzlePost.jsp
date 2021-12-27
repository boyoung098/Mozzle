<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

 
  
<div class="input-post">
	<label for="comment">게시글을 작성해주세요</label>
	<textarea class="form-control" name="mozzle-content" id="summernote" rows="10" cols="68"></textarea>
	<br>
	<button id="commentWrite" class="color-btn" onclick="insertMozzlePost()" style="float:right">등록</button>
</div>
<br><hr><br>

<div class="mt-3">
	<div class="input-group input-search mt-2" style="width:200px;">
		<form action="./searchMozzlePost.do" method="post" id="frm_search">
			<input type="text" class="form-control" name="keyword" id="keyword"
				placeholder="게시글 검색"> <span class="input-group-btn">
			<input type="hidden" name="mozzle_id"  value="${mozzle_id}">
			<button type="submit" class="btn btn-default" id="search_area">
				<span class="glyphicon glyphicon-search"></span>
			</button>
			</span>
		</form>
	</div>
</div>

<div class="board-top mt-2">
	<select class="board-sel selectbox">
		<option value="new1">최신순</option>
		<option value="new2">내가쓴글</option>
	</select>
</div>

<div>
	<input type="hidden" id="save-info-mozzeId" value="${mozzle_id}">
	<c:forEach var="post" items="${postList}">
		<section id="board-card-list">
			<div class="borad-box row" id="borad-box">
				<div class="col-sm-10 board-box-list">
					<div class="meeber-thumbnail">
						<c:choose>
							<c:when test="${mozzleUser.image_saved == null}">
								<img src="<%=request.getContextPath()%>/resources/images/default_profile.png" alt="">
							</c:when>
							<c:otherwise>
							<img src="<%=request.getContextPath()%>/storage/${mozzleUser.image_saved}" alt="">
							</c:otherwise>
						</c:choose>
					</div>
					<span>${post.user_id}</span> <span>${post.regdate}</span>
				</div>
				<div class="col-sm-2">
					<div class="board-cion">
					<c:if test="${sessionScope.userId != null}">
						<div>
							<a onclick="deleteReply(${post.post_id})">삭제</a>&nbsp;| 
							<a href="#" data-toggle="modal" data-target="#myModal">수정</a>&nbsp;|
							<c:if test="${mozzleUserdto.auth_code == '1' || mozzleUserdto.auth_code == '2'}">
								<a href="#" class="reportclick">신고 
									<input type="hidden" value="${post.post_id}" class="post_id">
								</a>
							</c:if> 
						</div>
					</c:if>	
					</div>
				</div>
				<div class="board-text-container">
					<p>${post.content}</p>
					<div id="replyload"></div>
					<div class="modify"></div>
	
				</div>
	
				<div class="borad-reply-container">
					<button id="reply-show-button" onclick="replyShow('${post.refer}')">
						<p>댓글보기</p>
					</button>
					<div id="reply-list-show-${post.refer}" style="display: none">
						<table id="reply-list-${post.refer}">
						</table>
						<br><br>
						<div class="reply_box">
							<input type="text" class="form-control" name="first-reply-content"
								id="first-reply-content-${post.refer}" style="width: 100%">
						</div>
						<button class="btn btn-default" onclick="submitFisrtReply('${post.post_id}', '${post.refer}')">댓글작성</button>
					</div>
				</div>
			</div>
		</section>
	</c:forEach>
</div>
	<!-- Modal -->
	  <div class="modal fade" id="myModal" role="dialog">
	    <div class="modal-dialog">
	    
	      <!-- Modal content-->
	      <div class="modal-content">
	        <div class="modal-header">
	          <button type="button" class="close" data-dismiss="modal">&times;</button>
	          <h4 class="modal-title">게시글 수정</h4>
	        </div>
	        <div class="modal-body">
	         <textarea rows="10" cols="68" ></textarea>
	        </div>
	        <div class="modal-footer">
	          <button type="button" class="btn btn-default" data-dismiss="modal" id="modify_btn">수정</button>
	        </div>
	      </div>
	      
	    </div>
	  </div>
	<!-- Modal -->
<script>
$( document ).ready(function() {
	   $("#modify_btn").click(function(){
		var modifytext = confirm("수정하시겠습니까?");
		
		if(modifytext){
			var content = $("#modify_text").val();
		}
			$.ajax({
				url:"./modify.do",
				type : "post",
				data: {"content" : content,
						"mozzle_id": mozzle_id
				},
				success : function(result){
					if(result ==true){
						document.location.reload();
					}
				}
			})
		});
	});


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
		url : "./replyShow.do?refer=" + obj,
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
		url : "./replyIn.do",
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
	var content = document.getElementById("first-reply-content-" + refer).value;
	console.log(content);
	var mozzle_id = document.getElementById("save-info-mozzeId").value;
	console.log(mozzle_id)
	$.ajax({
		url : "./replyIn.do",
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
				document.getElementById("first-reply-content-" + refer).value = "";
			}
		}	
	})
}
function deleteReply(obj, refer) {
	
	var url = "./deleteMozzlePost.do?post_id=" + obj;
	
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
	document.location.reload();
}
function insertMozzlePost() {
	
	var content = $("#summernote").val();
	console.log(content);
	var mozzle_id = document.getElementById("save-info-mozzeId").value;
	
	$.ajax({
		url: "./insertMozzlePost.do",
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
$('#summernote').summernote({ 
    placeholder: '내용을 입력해주세요',
     tabsize: 2, height: 100 
}); 

$(".reportclick").click(function(e){
    e.preventDefault();
    var postid =($(this).children("input").eq(0).val());
    
    $.ajax({
       type:"get",
       url:"./checkPostId.do",
       data:"post_id="+postid,
       success:function(msg){
          if(msg.count=="true"){
             console.log("true");
             console.log(postid);
             var url = './reportPostForm.do?post_id='+postid;
             var title = '글 신고하기';
             var attr = 'width = 450px, height = 550px';
             window.open(url,title,attr);
             
          } else{
             swal("신고","이미 신고접수가 되었습니다.");
          }
          },
       error : function(){
             alert("문제가 발생하였습니다.");
          }
       
    })
    
 
 });
</script>


