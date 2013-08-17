class BillsController < ApplicationController
  # def new
  #   @bill = Bill.new
  # end
  
  def create
    @bill = Bill.new(bill_params)
    @bill.list = params[:list_id]
    if @bill.save
      p 'nice'
    else
      p 'almost there'
    end
  end

  def edit
  end

  def update
  end

  private
    def bill_params
      params.require(:bill).permit(:description, :amount, :date)
    end
end