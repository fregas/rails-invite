
$(function() {
  $(".answer a").click(function(e) {
    var answer_id = $(e.currentTarget).attr('answer_id');
    $('#invitee_answer_id').val(answer_id);
    return false;
  });
});

