class ListsController < ApplicationController
  # before authenticate! 

  def show
    @list = List.find(params[:id])
  end

  def new
    @list = List.new
  end

  def create
    @list = List.new(list_params)
    @list.
    p "these are the list params #{list_params}"
    @list.save
    p "this i s the list #{@list}"
    # render partial: 'lists/list', locals: { list: @list }
    # respond_with @list
  end

  private
    def list_params
      params.require(:list).permit(:name)
    end

end
