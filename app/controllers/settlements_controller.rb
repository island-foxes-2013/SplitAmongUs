class SettlementsController < ApplicationController
  before_filter :authenticate_user!

  def new
    @settlement = Settlement.new
    @list = List.find(params[:list_id])
  end

  def create
    @settlement = Settlement.create(settlement_params)
    @settlement.list_id = params[:list_id]
    payer = User.find_by_name("#{params[:payer]}")
    payee = User.find_by_name("#{params[:payee]}")
    @settlement.payer_id = payer.id
    @settlement.payee_id = payee.id
    if @settlement.save
      redirect_to root_path
    else
      flash[:error] = @list.errors[:name].join('')
      redirect_to new_list_settlement_path(params[:list_id])
    end
  end

  private
    def settlement_params
      params.require(:settlement).permit(:payer, :payee, :amount, :list_id)
    end
end