class BillsController < ApplicationController
  # def new
  #   @bill = Bill.new
  # end
  
  def create
    @bill = Bill.new(params[:bill])
    @bill.list = params[:list_id]
    if @bill.save
      p 'nice'
    else
      p 'almost there'
    end
  end
end