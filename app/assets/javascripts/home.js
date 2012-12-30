
$(function() {
  $('#submit_button').attr('disabled', 'disabled');

  $(".answer a").click(function(e) {
    var answer_id = $(e.currentTarget).attr('answer_id');
    $('#invitee_answer_id').val(answer_id);
    $('div.answer-item').css('border-color','transparent');
    $(e.currentTarget).parent().css('border-color','black');
    $('#submit_button').removeAttr('disabled');

    return false;  
  });

  var show_responses = function () {
    $("#all_answers").load('/home/show_responses');
  }

  show_responses();


 $('#answer_form').ajaxForm(function() { 
  $("#response_div").hide();
  $("#thanks_div").fadeIn(1000);
  show_responses();
 }); 
  

  
});

