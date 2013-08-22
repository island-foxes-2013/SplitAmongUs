function View() {
  
}

View.prototype.render = function() {
  if (!this.element) {
    this.element = $($.trim($(this.template).text()));
  }
  this.refresh();
}

View.prototype.refresh = function() {
};