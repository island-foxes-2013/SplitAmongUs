function Money(number) {
  this.number = number;
}
Money.prototype.toString = function() {
  var dollarAmount = this.number.toString();
  return '$' + dollarAmount.insert(dollarAmount.length - 2, '.')
}
