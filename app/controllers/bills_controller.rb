class BillsController < ApplicationController
  before_filter :authenticate_user!

  def index
    @lists = current_user.lists
    if request.xhr?
      render :index, :layout => false
    else
      render :index
    end
  end
  
  def create 
    @bill = Bill.new(bill_params)
    @bill.list_id = params[:list_id]
    @bill.user_id = current_user.id
    if @bill.save
      if request.xhr?
        render json: {html: render_to_string(partial: 'bill', locals: { bill: @bill }), total: @bill }.to_json
      end
    else
      flash[:error] = @bill.errors.full_messages.join('')
      redirect_to list_path(@bill.list)
    end
  end

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