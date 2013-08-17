class ListsController < ApplicationController
  before_filter :authenticate_user!

  def create
    @list = current_user.lists.new(list_params)
    if current_user.save
      redirect_to dashboard_index_path
    else
      flash[:error] = @list.errors[:name].join('')
      redirect_to dashboard_index_path
    end
  end

  def show
    p "these are the params #{params} and list params #{list_params}"
    @list = List.find(params[:id])
  end

  private
    def list_params
      params.require(:list).permit(:name, :total_amount)
    end
end
