class ListsController < ApplicationController
  before_filter :authenticate_user!

  def create
    @list = current_user.lists.new(list_params)
    if current_user.save
      render json: @list
    else
      flash[:error] = @list.errors[:name].join('')
      redirect_to dashboard_index_path
    end
  end

  def show
    @list = List.find(params[:id])
    if request.xhr?
      render :show, :layout => false
    else
      render :show
    end
  end

  def edit
    @list = List.find(params[:id])
  end

  def update
    @list = List.find(params[:id])
    if @list.update_attributes(list_params)
      redirect_to dashboard_index_path
    else
      render :edit
    end
  end

  def destroy
    @list = List.find(params[:id])
    @list.destroy
    render json: @list
    
  end

  private
    def list_params
      params.require(:list).permit(:name, :total_amount)
    end
end
