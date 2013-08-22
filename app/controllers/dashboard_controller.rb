class DashboardController < ApplicationController
  before_filter :authenticate_user!

  def index
  end

  def stats
    render partial: "bills/totals"
  end
end