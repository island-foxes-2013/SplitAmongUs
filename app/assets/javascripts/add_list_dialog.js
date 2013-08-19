function AddListDialog(id, lists) {
  this.dialog = $(id);
  this.form = this.dialog.find('form');
  this.name = this.dialog.find('input[name="list[name]"]');
  this.form.on('ajax:success', function(e, list) {
    lists.add(list);
  });
  this.createDialog();
}

AddListDialog.prototype.open = function() {
  this.dialog.dialog("open");
}

AddListDialog.prototype.close = function() {
  this.dialog.dialog("close");
}

AddListDialog.prototype.createDialog = function() {
  var self = this;
  self.dialog.dialog({
    autoOpen: false,
    height: 300,
    width: 350,
    title: "Add a list",
    modal: true,
    buttons: {
      "Create list": function() {
        self.createList();
      },
    "Cancel": function() {
      self.close();
    }
    },
    close: function() {
      self.name.val("");
    }
  });
}

AddListDialog.prototype.createList = function() {
  if ($.trim(this.name.val()) === "") {
    alert("NO SOUP FOR YOU");
  } else {
    this.dialog.find('form').submit();
    this.close();
  }
}
