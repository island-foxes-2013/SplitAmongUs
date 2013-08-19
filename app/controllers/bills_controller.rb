class BillsController < ApplicationController
  before_filter :authenticate_user!

  def index
    @lists = current_user.lists
  end
  
  def create 
    @bill = Bill.new(bill_params)
    @bill.list_id = params[:list_id]
    if @bill.save
      redirect_to list_path(@bill.list)
    else
      flash[:error] = @bill.errors.full_messages.join('')
      redirect_to list_path(@bill.list)
    end
  end

  private
  def bill_params
    params.require(:bill).permit(:description, :amount, :date)
  end
end