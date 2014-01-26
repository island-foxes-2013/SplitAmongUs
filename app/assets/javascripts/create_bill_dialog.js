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
    $(this).find('select').each(function(){
      data[$(this).attr('name')] = $(this).val();
    });

    list.createBill(data).done(function() {
      console.log("inside of create bill");
      self.close();  
    }).fail(function(model){
      console.log("inside of errors");
      self.dialog.find('.errors').html(model.errors());
    });
  });

  
  var self = this;
  this.dialog.dialog({
    autoOpen: false,
    height: 420,
    width: 350,
    modal: true,
    close: function() {
      $(this).find('input[type="text"]').val('');
      self.dialog.find('.errors').remove();
    }
  });
}

CreateBillDialog.prototype.open = function() {
  this.dialog.dialog("open");
}

CreateBillDialog.prototype.close = function() {
  this.dialog.dialog("close");
}