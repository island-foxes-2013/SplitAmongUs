class SettlementsController < ApplicationController
  before_filter :authenticate_user!

  def new
    @settlement = Settlement.new
    @list = List.find(params[:list_id])
  end

  def create
    list = List.find(settlement_params[:list_id])
    payee = list.users.find_by_name(settlement_params.delete(:payee))
    payer = list.users.find_by_name(settlement_params.delete(:payer))
    @settlement = Settlement.new(settlement_params)
    @settlement.list_id = list.id
    @settlement.payee_id = payee.id
    @settlement.payer_id = payer.id
    if @settlement.save
      redirect_to root_path
    else
      flash[:error] = @list.errors[:name].join('')
      redirect_to new_list_settlement_path(params[:list_id])
    end
  end

  private
    def settlement_params
      @settlement_params ||= params.require(:settlement).permit(:payer, :payee, :amount_cents, :amount, :list_id, :payer_id, :payee_id)
    end
end