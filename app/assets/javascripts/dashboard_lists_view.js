function DashboardListsView(locator, lists) {
  this.dashboardLists = $(locator);
  this.lists = lists;
  this.listsUl = this.dashboardLists.find('.lists');
  this.addListDialog = new AddListDialog('#dialog-lists-form', lists);

  var self = this;
  $(this.lists).on('added', function(e, list) {
    $.ajax({
      url: '/lists/' + list.id,
      contentType: "html",
      method: "GET"
    }).done(function(response) {
      self.listsUl.append(response);
    });
  });
  this.dashboardLists.on('click', '.create', function() {
    self.addListDialog.open();
  });
}

