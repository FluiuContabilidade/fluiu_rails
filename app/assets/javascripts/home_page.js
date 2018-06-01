$(document).ready(function () {
  show_variables = $('#showvariable');
  console.log(show_variables.val());

  if(show_variables.val() != 'open' ){
    $('.foropen').hide();
    $(".foropen").click(function(event){
      event.preventDefault();
    });
  }

  else{
    console.log('entered else');
  }


});
