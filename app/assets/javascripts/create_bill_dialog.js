function CreateBillDialog(locator) {
  this.dialog = $(locator)
  this.form = this.dialog.find("#new_bill");
  this.dialog.find('.datepicker').datepicker();
  
  var self = this;
  this.dialog.dialog({
    autoOpen: false,
    height: 300,
    width: 350,
    modal: true,
    title: "add bill",
    buttons: {
      "Create bill": function() {
        self.form.submit();
        self.close();
      },
      "Cancel": function() {
        self.open();
      }
    },
    close: function() {
      self.form.find('input').val('');
    }
  });
}

CreateBillDialog.prototype.open = function() {
  this.dialog.dialog("open");
}

CreateBillDialog.prototype.close = function() {
  this.dialog.dialog("close");
}