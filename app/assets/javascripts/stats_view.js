function StatsView = function(lists) {
  this.element = $('#dashboard-stats')
  var self
  $(lists).on('added', function(e, list) {
    $(list).on('changed', function() {
      self.refresh();
    });
  });  
}


StatsView.prototype.refresh  = function() {
  var self = this;
  $.get('/stats').done(function(response){
    self.element.html(response);
  });
}