function ListShowViewBill(bill) {
  this.template = '#list-show-view-bill-template';
  this.bill = bill;
  this.render();
  var self = this;
  this.bill.on('changed', function() {
    self.refresh();
  })
}

ListShowViewBill.prototype = Object.create(View.prototype);

ListShowViewBill.prototype.refresh = function() {
  this.element.find('.date').text(this.bill.date())
  this.element.find('.description').text(this.bill.description());
  this.element.find('.amount').text(this.bill.amount())
  this.element.find('.date_paid').text(this.bill.datePaid());
  this.element.find('.paid_by').text(this.bill.paidBy());
  this.element.find('.shared_amount').text(this.bill.sharedAmount());
}
