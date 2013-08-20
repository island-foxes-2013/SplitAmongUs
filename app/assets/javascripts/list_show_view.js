function ListShowView(locator) {
  this.element = $(locator);
  var dialog = new CreateBillDialog("#dialog-bills-form");
  var self = this;
  dialog.form.on('ajax:success', function(e, bill) {
    self.element.find('.bills').append(bill.html);
    self.refreshStats(bill.total.amount_cents);
  });
  
  $( "#create-bill" ).click(function() {
    dialog.open();
  });

  // delete form
  $(".delete-list").on('click', function(){
    self.delete(this);
  })
}

// now a ton of stuff needs to update - need to make this more scalable
// need to add classes and spans to the new totals
ListShowView.prototype.refreshStats = function(amount) {
  var totalAmountSpan = $('.owe-me');
  var totalAmount = totalAmountSpan[0];
  var newTotal = addBill(amount, $(totalAmount).text().slice(1));
  return $('.owe-me').text('$'+newTotal);
}

ListShowView.prototype.delete = function(self) {
  // pass in the delete link - 
}