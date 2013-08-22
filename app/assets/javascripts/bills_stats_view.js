function BillStatsView(element) {
  this.element = $(element);
  // this.lists = $(lists)
  var self = this;
  $('#all-bills').on('click', function(e) {
      self.refresh();
  });  
}

BillStatsView.prototype.refresh = _.debounce(function() {
  var self = this;
  $.get('/bills/stats').done(function(response){
    $('#dashboard-stats').html(response);
  });
}, 250);