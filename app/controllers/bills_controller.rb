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

  def edit
    @list = List.find(params[:list_id])
    @bill = Bill.find(params[:id])
  end

  def update
    @bill = Bill.find(params[:id])
    @bill.description = params[:bill][:description]
    @bill.amount = params[:bill][:amount]
    @bill.date = params[:bill][:date]
    @bill.save
    redirect_to dashboard_index_path
  end

  # def destroy
  #   @list = List.find(params[:id])
  #   @list.destroy
  #   redirect_to dashboard_index_path
  # end

  private
  def bill_params
    params.require(:bill).permit(:description, :amount, :date)
  end
end