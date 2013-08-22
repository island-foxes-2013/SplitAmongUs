function ListShowView(list) {
  this.list = list;

  var self = this;

  var createBillDialog, editDialog;
  this.element = $('<div id="list-show-page"></div>');
  list.loadShowHtml().done(function(showHtml){
    self.element.html(showHtml);
    createBillDialog = new CreateBillDialog("#dialog-bills-form", list);
    editDialog = new ListShowViewEditListDialog(list);
  });

  $(list).on('changed', function() {
    self.element.find('.list_name').text(list.name());
  });

  $(list).on('deleted', function() {
    self.element.remove();
  });

  $(list.bills).on('added', function(e, bill) {
    var billView = new ListShowViewBill(bill);
    self.element.find('.bills').append(billView.element);
  });

  this.element.on('click', '.edit', function() {
    editDialog.open();
  });
  this.element.on('click', '.create', function() {
    createBillDialog.open();
  });
  
  list.loadBills();
}
