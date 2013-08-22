class DashboardController < ApplicationController
  before_filter :authenticate_user!

  def index
  end

  # def stats
  #   render partial: 'bills/list_total', locals: { list: current_user.lists.last }
  # end
end