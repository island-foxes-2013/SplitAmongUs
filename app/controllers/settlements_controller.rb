class SettlementsController < ApplicationController
  before_filter :authenticate_user!

  def new
    @settlement = Settlement.new
    @list = List.find(params[:list_id])
  end

  def create
    @list = List.find(params[:list_id])
    @settlement = Settlement.new(settlement_params)
    p "this is the settlement amount #{settlement_params[:amount]}"
    @settlement.list_id = @list.id
    if @settlement.save
      redirect_to root_path
    else
      flash[:error] = @list.errors[:name].join('')
      redirect_to new_list_settlement_path(@list.id)
    end
  end

  private
    def settlement_params
      @settlement_params ||= params.require(:settlement).permit(:amount, :payer_id, :payee_id)
    end
end