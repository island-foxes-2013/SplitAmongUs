function List(attributes) {
  this.attrs = attributes;
  this.bills = new Bills(this);
  var self = this;
  $(this.bills).on('added', function(e, bill) {
    self.refresh();
  });
}

$.extend(List.prototype, Model.prototype);

List.prototype.path = function() {
  if (this.id()) {
    return "/lists/" + this.id();
  }
  return "/lists"  
} 
List.prototype.type = 'list';

List.prototype.name = function() {
  return this.attrs.name;
}

List.prototype.loadShowHtml = function() {
  return $.get(this.path(), { contentType: "text/html" })
}

List.prototype.createBill = function(billData) {
  var bill = new Bill($.extend(billData, { list: this }));
  this.bills.add(bill)
  return bill.save();
}

List.prototype.loadBills = function() {
  this.bills.load();
}