function ListShowView(locator) {
  var name = $( "#name" ),
      email = $( "#email" ),
      password = $( "#password" ),
      allFields = $( [] ).add( name ).add( email ).add( password ),
      tips = $( ".validateTips" );

  function updateTips( t ) {
    tips
      .text( t )
      .addClass( "ui-state-highlight" );
    setTimeout(function() {
      tips.removeClass( "ui-state-highlight", 1500 );
    }, 500 );
  }

  $( "#dialog-bills-form" ).dialog({
    autoOpen: false,
    height: 300,
    width: 350,
    modal: true,
    buttons: {
      "Create bill": function() {
        $('form#new_bill').submit();
        $( this ).dialog( "close" );
      },
    Cancel: function() {
      $( this ).dialog( "close" );
    }
    },
    close: function() {
      allFields.val( "" );
    }
  });

  $( "#create-bill" )
    .click(function() {
      $( "#dialog-bills-form" ).dialog( "open" );
    });
}
