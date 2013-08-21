
function Lists() {
  this.lists = [];
}

Lists.prototype.add = function(list) {
  this.lists.push(list);
  $(this).trigger('added', list);
}

Lists.prototype.load = function() {
  var self = this;
  $.get('/lists').done(function(lists) {
    $.each(lists, function(k, list) {
      self.add(new List(list));
    });
  });
}