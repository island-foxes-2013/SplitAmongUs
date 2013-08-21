function DashboardListsView(locator, lists) {;
  this.element = $(locator);
  this.lists = lists;
  
  this.listsUl = this.element.find('.lists');
  this.addListDialog = new AddListDialog('#dialog-lists-form', lists);

  var self = this;
  $(this.lists).on('added', function(e, list) {
    var listItem = new DashboardListsViewListItem(list);
    $(listItem).on('activated', function() {
      self.makeListActive(listItem.list);
    });
    self.listsUl.append(listItem.element);
  });
  // this is the .lists and is still the same...
  
  this.element.on('click', '.create', function() {
    self.addListDialog.open();
  });
}

DashboardListsView.prototype.makeListActive = function(list) {
  var listShowView = new ListShowView(list);
  $('#middle_column').html(listShowView.element);
}