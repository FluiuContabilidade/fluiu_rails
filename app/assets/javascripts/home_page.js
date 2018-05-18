$(document).ready(function () {
  show_variables = $('#showvariable');
  console.log(show_variables.val());

  if(show_variables.val() == 'false' ){
    $('.foropen').hide();
    $(".foropen").click(function(event){
      event.preventDefault();
    });
  }

  else{
    console.log('entered else');
  }


});
