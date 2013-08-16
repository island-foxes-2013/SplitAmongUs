class ListsController < ApplicationController

  def new
    @list = List.new
  end

  def create
    @list = List.new(list_params)
    @list.submit if @list.save
    respond_with @list
  end

end