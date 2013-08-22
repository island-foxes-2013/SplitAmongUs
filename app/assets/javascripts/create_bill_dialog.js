function CreateBillDialog(locator, list) {
  this.dialog = $(locator)
  this.form = this.dialog.find("form");
  this.dialog.find('.datepicker').datepicker();
  var self = this;

  this.form.on('click', '.cancel', function(e) {
    self.close();
    return false;
  });
  
  this.form.on('submit', function(e) {
    e.preventDefault();
    var data = {};

    $(this).find('input[type="text"]').each(function(){
      data[$(this).attr('name')] = $(this).val();
    });

    list.createBill(data).done(function() {
      self.close();  
    }).fail(function(model){
      self.dialog.append(model.errors());
    });
  });

  
  var self = this;
  this.dialog.dialog({
    autoOpen: false,
    height: 390,
    width: 350,
    modal: true,
    close: function() {
      $(this).find('input[type="text"]').val('');
    }
  });
}

CreateBillDialog.prototype.open = function() {
  this.dialog.dialog("open");
}

CreateBillDialog.prototype.close = function() {
  this.dialog.dialog("close");
}