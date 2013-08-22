function StatsView(lists, element) {
  this.element = $(element);
  this.lists = $(lists)
  var self = this;
  this.lists.on('added', function(e, list) {
    $(list).on('changed', function() {
      self.refresh();
    });
  });  
}

StatsView.prototype.refresh  = function() {
  var self = this;
  $.get('/stats').done(function(response){
    $(self.element).html(response);
  });
}