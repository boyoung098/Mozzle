//게시글 수정폼
function board_update(post_id, user_id, regdate, content){
	console.log("들어옴?");
	var commtesmodify = "우왕";
	//console.log(commtesmodify);
	//commtesmodify +='<span id="post_id"'+post_id+'" style="width:200px; height:200px; background:red;">';
	//commtesmodify += user_id;
	//commtesmodify += '</span>';
	//commtesmodify +='<span id="regdate">';
	//commtesmodify += regdate;
	//commtesmodify += '</span>';
	commtesmodify += '<textarea>';
	commtesmodify += '안녕하세요';
	commtesmodify += '</textarea>';
	//commtesmodify +='<button onclick="board_update_edit()">수정</button>';
	
	//$("#post_id"+post_id).replaceWith(commtesmodify);
}

// 게시글 수정
function board_update_edit(){
	
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
				console.log("삭제완료");
				document.location.reload(true);
			}
		})
	}
}


//댓글 입력
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