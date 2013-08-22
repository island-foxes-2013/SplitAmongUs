function Bill(attributes) {
  this.attrs = attributes;
}

$.extend(Bill.prototype, Model.prototype);

// this needs to get the list id here somehow!
Bill.prototype.path = function() {
  var path = this.list().path();
  path += "/bills"
  if (this.id()) {
    path += "/" + this.id()
  }
  return path;
} 

Bill.prototype.saveableData  = function() {
  var saveableAttrs = $.extend({}, this.attrs)
  delete saveableAttrs["list"];
  return saveableAttrs;
}
Bill.prototype.type = 'bill';

Bill.prototype.list = function() {
  return this.attrs.list;
}
Bill.prototype.description = function() {
  return this.attrs.description;
}

Bill.prototype.amount = function() {
  return new Money(this.attrs.amount);
}

Bill.prototype.date = function() {
  return this.attrs.date;
}

Bill.prototype.datePaid = function() {
  return this.attrs.date_paid;
}

Bill.prototype.paidBy = function() {
  return this.attrs.paid_by ? this.attrs.paid_by.name : ""
}

Bill.prototype.sharedAmount = function() {
  return new Money(this.attrs.shared_amount || 0);
}