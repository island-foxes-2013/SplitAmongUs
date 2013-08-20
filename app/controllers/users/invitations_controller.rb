class Users::InvitationsController < Devise::InvitationsController
  def new
    @list = List.find(params[:list_id])
    p ">>>>>>>>>>>> #{@list}"
    self.resource = resource_class.new
  end

  def create
    form_params = invite_params
    list_id = form_params.delete(:list_id)

    self.resource = resource_class.invite!(form_params, current_inviter)

    if resource.errors.empty?
      resource.groups.create(:list_id => list_id)
      set_flash_message :notice, :send_instructions, :email => self.resource.email if self.resource.invitation_sent_at
      respond_with resource, :location => after_invite_path_for(resource)
    else
      respond_with_navigational(resource) { render :new }
    end
  end

  private
  def invite_params
    params.require(:user).permit(:name, :email, :list_id)
  end
end