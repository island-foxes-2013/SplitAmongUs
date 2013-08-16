class ListsController < ApplicationController
  
  def show
    @list = List.find(params[:id])
  end

  def new
    @list = List.new
  end

  def create
    @list = List.new(list_params)
    @list.save
    respond_with @list
  end

  private
    def list_params
      params.require(:list).permit(:name)
    end

end