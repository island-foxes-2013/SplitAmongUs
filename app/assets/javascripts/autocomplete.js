$(function() {
    var availableTags = [friends];
    $( "#tags" ).autocomplete({
      source: availableTags
    });
  });