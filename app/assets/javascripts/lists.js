
function Lists() {
  this.lists = [];
}

Lists.prototype.add = function(list) {
  this.lists.push(list);
  $(this).trigger('added', list);
}
