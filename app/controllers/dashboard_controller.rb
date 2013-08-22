class DashboardController < ApplicationController
  def index
  end

  def stats
    render json: { partial: 'bills/list_total', locals: { list: current_user.lists.last, bill: current_user.lists.last.bills } }
  end
end