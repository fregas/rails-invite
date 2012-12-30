
$(function() {
  $(".answer a").click(function(e) {
    var answer_id = $(e.currentTarget).attr('answer_id');
    $('#invitee_answer_id').val(answer_id);
    $('div.answer a').css('border-color','transparent');
    $(e.currentTarget).css('border-color','black');

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

