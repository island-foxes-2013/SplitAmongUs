class GroupsController < ApplicationController
  before_filter :authenticate_user!

  def destroy
    @group = Group.find(params[:id])
    @group.destroy
    redirect_to dashboard_index_path
  end

end