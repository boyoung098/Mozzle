$(function(){
	let form = $("#insertcontent");
	let formup = $("#hupdate");
	
	$("#board_update").on("click", function(){
		formup.submit();
	});
	
	$("#board_delete").on("click", function(){
		form.attr("action", "/deleteBoard.do");
		form.attr("method","post");
		form.submit();
	});
});
