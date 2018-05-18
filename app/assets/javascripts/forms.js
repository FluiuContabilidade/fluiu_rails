// Update protocol field based on form options
if($('#opening_status_select').val() == "comercial"){$('#protocol_field').hide();}

$(document).on('change', '#opening_status_select', function(e) {
    if(this.options[e.target.selectedIndex].text == 'Junta Comercial'){
      $('#protocol_field').show();
    }
    else{
      $('#protocol_field').hide();
    }
});
