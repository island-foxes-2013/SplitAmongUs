class UsersController < ApplicationController
  before_filter :authenticate_user!

  def show
    @user = User.find(current_user.id)
  end

  private
    def list_params
      params.require(:list).permit(:name)
    end
end