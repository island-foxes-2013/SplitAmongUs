class ListsController < ApplicationController
  before_filter :authenticate_user!

  # def new
  #   @list = current_user.lists.new
  # end

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
    @list = List.find(params[:id])
  end

  def edit
    @list = List.find(params[:id])
  end

  def update
    @list = List.find(params[:id])
    @list.name = params[:list][:name]
    @list.save
    redirect_to dashboard_index_path
  end

  def destroy
    @list = List.find(params[:id])
    @list.destroy
    redirect_to dashboard_index_path
  end

  private
    def list_params
      params.require(:list).permit(:name, :total_amount)
    end
end
