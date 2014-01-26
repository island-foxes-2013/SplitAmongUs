function Model() {

}

Model.prototype.id = function() {
  return this.attrs.id;
}

Model.prototype.update = function(attrs) {
  $.extend(this.attrs, attrs);
  this.triggerChanged();
  return this;
}

Model.prototype.triggerChanged = function() {
  $(this).trigger('changed');
}

Model.prototype.refresh = function() {
  var self = this;
  $.ajax({
    method: "GET",
    url: this.path(),
    contentType: "text/json"
  }).done(function(model_attributes) {
    self.update(model_attributes);
  });
}

Model.prototype.on = function(event, callback) {
  $(this).on(event, callback);
}

Model.prototype.trigger = function(event) {
  $(this).trigger(event);
}

Model.prototype.saveableData = function() {
  return this.attrs;
}

Model.prototype.errors = function() {
  return this.attrs.errors.join('<br>') + '<br>' || [];
}

Model.prototype.save = function() {
  var promise = $.Deferred();
  
  var data = {}
  data = $.extend({}, this.saveableData());
  var self = this;

  $.ajax({
    method: this.id() ? "PUT" : "POST",
    url: this.path(), 
    data: data,
  }).done(function(model_attributes) {
    self.update(model_attributes);
    promise.resolve(self);
  }).fail(function(response) {    
    self.update(response.responseJSON);
    promise.reject(self);
  });

  return promise;
}