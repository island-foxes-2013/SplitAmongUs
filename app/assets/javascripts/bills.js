function Bills() {
  this.bills = [];
}

Bills.prototype.add = function(bill) {
  this.bills.push(bill);
  // I might not need the trigger here -- find out...
  $(this).trigger('added', bill);
}

// some bill amounts to display totals
function addBill(amount, totalAmount) {
  var sumCents = Number(amount) + Number(totalAmount) * 100;
  var intoDollars = sumCents / 100;
  return intoDollars;
}

function BillsIndexView(locator) {
  this.element = $(locator);
  
  this.element.on('ajax:success', '.button_to', function(e, response) {
    $('#middle_column').html(response);
  });
}