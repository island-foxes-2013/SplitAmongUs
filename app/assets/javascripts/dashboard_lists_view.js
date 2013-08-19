function DashboardListsView(locator, lists) {
  this.element = $(locator);
  this.lists = lists;
  this.listItemTemplate = $.trim(this.element.find('.list-item-template').html());
  this.listsUl = this.element.find('.lists');
  this.addListDialog = new AddListDialog('#dialog-lists-form', lists);

  var self = this;
  $(this.lists).on('added', function(e, list) {
    var newList = $(self.listItemTemplate);
    newList.find('a').attr('href', '/lists/' + list.id);
    newList.find('a').text(list.name);
    self.listsUl.append(newList);
  });
  this.listsUl.on('ajax:success', 'li a', function(e, response) {
    $('#dashboard-main-content').html(response);
    new ListShowView('#list_show');
  });
  this.element.on('click', '.create', function() {
    self.addListDialog.open();
  });
}
