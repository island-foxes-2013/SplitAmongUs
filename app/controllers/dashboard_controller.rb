class DashboardController < ApplicationController
  def index
  end

  def stats
    render json: { list: current_user.lists.last, bill: current_user.lists.last.bills }
  end
end