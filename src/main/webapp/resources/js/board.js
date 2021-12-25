// drop-board
$( document ).ready( function() {
  $(".drop-board-box").click( function() {
    $(this).next(".drop-board").slideToggle();
  });

  $(".comment-write").click( function() {
    $(this).next(".comment").slideToggle();

  });
});


//게시글 입력
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
		success : function(data){
        		
		}
	})
	alert("입력되었습니다.");
	refreshMemList();
	
}

function refreshMemList(){
	document.location.reload();
}


//게시글 삭제
function board_delete(idx){
	var numsd = confirm("삭제하시겠습니까?");
	if(numsd){
		$.ajax({
			url : "./deleteBoard.do",
			type: "POST",
			data :{"idx" : idx},
			dataType:"JSON",
			async:true,
			success:function(data){
				
			}
		})
		refreshMemList();
	}
}


//댓글 입력
function registComment(seq) {
	var content = $("#contentId").val();
	var user = '<c:out value="${allboardlist.user_id}"/>';
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




//게시글 수정폼
function board_update(post_id, user_id, regdate, content){
	console.log("들어옴?");
	var commtesmodify = "";
	
	commtesmodify +='<span id="post_id"'+post_id+'style="width:200px; height:200px; background:red;">';
	commtesmodify += user_id;
	commtesmodify += '</span>';
	commtesmodify +='<span id="regdate">';
	commtesmodify += regdate;
	commtesmodify += '</span>';
	commtesmodify += '<textarea>';
	commtesmodify += content;
	commtesmodify += '</textarea>';
	commtesmodify +='<button onclick="board_update_edit()">수정</button>';
	
	$("#replyload"+post_id).replaceWith(commtesmodify);
}
