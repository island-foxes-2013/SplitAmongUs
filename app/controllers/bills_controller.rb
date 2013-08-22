class BillsController < ApplicationController
  before_filter :authenticate_user!

  def index
    render json: List.find(params[:list_id]).bills
  end
  
  
  def create 
    @bill = Bill.new(bill_params)
    @bill.list_id = params[:list_id]
    @bill.user_id = current_user.id
    if @bill.save
      render json: @bill
    else
      render json: @bill, status: :unprocessable_entity
    end
  end

  # will end up removing this method once dialog is implemented
  def edit
    @bill = Bill.find(params[:id])
  end

  def update
    @bill = Bill.find(params[:id])
    @bill.update_attributes(bill_params)
    redirect_to dashboard_index_path
  end

  def destroy
    @bill = Bill.find(params[:id])
    @bill.destroy
    redirect_to dashboard_index_path
  end

  private
  def bill_params
    params.require(:bill).permit(:description, :amount, :date)
  end
end