class Users::BillsController < ApplicationController
  def index
    @lists = current_user.lists
    if request.xhr?
      render "users/bills/index", :layout => false
    else
      render "users/bills/index"
    end
  end
end