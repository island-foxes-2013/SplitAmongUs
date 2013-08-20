function errors() {
  $("form#new_user").on('keyup', function(){
      $("#user_email").css({'border-color': 'red'});
  });
}

