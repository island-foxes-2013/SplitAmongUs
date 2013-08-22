function Bills(list) {
  this.bills = [];
  this.list = list;
}

Bills.prototype.add = function(bill) {
  this.bills.push(bill);
  $(this).trigger('added', bill);
}

Bills.prototype.load = function() {
  var self = this;
  $.get(this.list.path() + '/bills').done(function(bills_data) {
    $.each(bills_data, function() {
      self.add(new Bill(this));
    })
  });
}
// some bill amounts to display totals
function addSettlement(amount, totalAmount) {
  var sumCents = Number(amount) + Number(totalAmount) * 100;
  var intoDollars = sumCents / 100;
  return intoDollars;
}

function BillsIndexView(locator) {
  this.element = $(locator);
  
  this.element.on('ajax:success', 'a', function(e, response) {
    $('#middle_column').html(response);
  });
}