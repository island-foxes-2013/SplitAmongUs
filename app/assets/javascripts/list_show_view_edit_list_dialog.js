function ListShowViewEditListDialog(list) {
  this.list = list;
  this.dialog = $("#dialog-bills-edit-form");
  this.form = this.dialog.find('form');
  this.name = this.dialog.find('input[name="list[name]"]');

  var self = this;
  this.form.on('submit', function(e) {
    e.preventDefault();
    if ($.trim(self.name.val()) === "") { return; }

    self.list.update({name: self.name.val() }).save().done(function() {
      self.close();
    });
  });
  
  this.createDialog();
}

ListShowViewEditListDialog.prototype.open = function() {
  this.dialog.dialog("open");
}

ListShowViewEditListDialog.prototype.close = function() {
  this.dialog.dialog("close");
}

ListShowViewEditListDialog.prototype.createDialog = function() {
  var self = this;
  self.dialog.dialog({
    autoOpen: false,
    height: 300,
    width: 350,
    title: "Edit list",
    modal: true,
    close: function() {
      self.name.val("");
    }
  });
}