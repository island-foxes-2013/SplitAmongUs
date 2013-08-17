class ListsController < ApplicationController
  before_filter :authenticate_user!

  # def new
  #   @list = current_user.lists.new
  # end

  def create
    @list = current_user.lists.build(list_params)
    if @list.save
      redirect_to dashboard_index_path
    else
      p "*" * 100
      p @list.errors.full_messages
      flash[:error] = @list.errors[:name].join('')
      redirect_to dashboard_index_path
    end
  end

  def show
    @list = List.find(params[:id])
  end

  private
    def list_params
      params.require(:list).permit(:name, :total_amount)
    end
end
