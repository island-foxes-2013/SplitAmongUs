function DashboardListsViewListItem(list) {
  this.template = $.trim($('#dashboard-lists-view-list-item-template').html());
  this.list = list;

  this.render();

  var self = this;

  this.element.on('click', 'a', function(e){
    e.preventDefault();
    $(self).trigger('activated');
  });
  
  $(list).on('changed', function() {
    self.render();
  });
}

DashboardListsViewListItem.prototype.render = function() {
  if(!this.element) {
    this.element = $(this.template);
  }
  this.element.find('a').attr('href', '/lists/'+ this.list.id());
  this.element.find('a').text(this.list.name());
}