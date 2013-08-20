function ListShowView(locator) {
  this.element = $(locator);
  var dialog = new CreateBillDialog("#dialog-bills-form");
  var self = this;
  dialog.form.on('ajax:success', function(e, bill) {
    self.element.find('.bills').append(bill);
    self.refreshStats();
  });
  
  $( "#create-bill" ).click(function() {
    dialog.open();
  });
}

ListShowView.prototype.refreshStats = function() {
  // call the server to re-render the list-amounts div
}