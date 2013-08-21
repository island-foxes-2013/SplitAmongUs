function List(attributes) {
  this.attrs = attributes;
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
  return $.get(this.path())
}