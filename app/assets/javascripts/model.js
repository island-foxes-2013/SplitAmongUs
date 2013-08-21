function Model() {

}

Model.prototype.id = function() {
  return this.attrs.id;
}

Model.prototype.update = function(attrs) {
  $.extend(this.attrs, attrs);
  $(this).trigger('changed');
  return this;
}

Model.prototype.save = function() {
  var promise = $.Deferred();
  
  
  var data = {}
  data[this.type] = $.extend({}, this.attrs);
  delete data[this.type]["created_at"]
  delete data[this.type]["id"]
  delete data[this.type]["updated_at"]
  var self = this;

  $.ajax({
    method: this.id() ? "PUT" : "POST",
    url: this.path(), 
    data: data
  }).done(function(model_attributes) {
    self.update(model_attributes);
    promise.resolve(self);
  });

  return promise;
}