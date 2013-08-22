function ListStatsView(lists, element) {
  this.element = $(element);
  this.lists = $(lists)
  var self = this;
  this.lists.on('added', function(e, list) {
    $(list).on('changed', function() {
      self.refresh(list);
    });
  });  
}

ListStatsView.prototype.refresh = _.debounce(function(list) {
  var self = this;
  console.log("this is this" + self);
  console.log("this is list" + list);
  // debugger
  $.get('/lists/'+ list.id() +'/stats').done(function(response){

    $('#dashboard-stats').html(response);
  });
}, 250);