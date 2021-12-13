// drop-board
$( document ).ready( function() {
  $(".drop-board-box").click( function() {
    $(this).find(".drop-board").slideToggle();
  });

  $(".comment-write").click( function() {
    $(this).next(".comment").slideToggle();

  });
});
