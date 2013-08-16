class ListsController < ApplicationController
  # before authenticate! 

  # def show
  #   @list = current_user.lists.find(params[:id])
  # end

  def new
    @list = current_user.lists.new
  end

  def create
    # List.transaction do |t|
    # end

    @list = current_user.lists.new(list_params)
    if current_user.save
      redirect_to dashboard_index_path
    else
      render text: "jeffreysux"
    end
  end

  private
    def list_params
      params.require(:list).permit(:name)
    end

end
