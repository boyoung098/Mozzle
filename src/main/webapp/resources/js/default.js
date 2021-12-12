// drop-board
$( document ).ready( function() {
  $(".drop-board-box").click( function() {
    $(this).find(".drop-board").slideToggle();
  });

  $(".comment-write").click( function() {
    $(this).next(".comment").slideToggle();

  });
});
//게시판 등록
function board_insert(){
	console.log("여기가 틀림?");
	var form = document.getElementById("insertcontent");
	console.log("어디임??");
	form.submit();
	console.log("완료???????");
}

