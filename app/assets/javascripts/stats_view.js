function StatsView(lists) {
  this.element = $('#dashboard-stats');
  var self = this;
  console.log('this is element'+ this.element)
  console.log('this is self'+ self)
  $(lists).on('added', function(e, list) {
      console.log('this is e'+ e)
      console.log('this is list'+ list)
    $(list).on('changed', function() {
      self.refresh();
    });
  });  
}

StatsView.prototype.refresh  = function() {
  var self = this;
  $.get('/stats').done(function(response){
    console.log('this is response'+ response)
    self.element.html(response);
  });
}