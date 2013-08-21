class Users::InvitationsController < Devise::InvitationsController
  def new
    @list = List.find(params[:list_id])
    self.resource = resource_class.new
  end

  def create
    form_params = invite_params
     list_id = form_params.delete(:list_id)


    self.resource = resource_class.invite!(form_params, current_inviter)
    group = resource.groups.build(:list_id => list_id)

    if resource.errors.empty? && group.save
      set_flash_message :notice, :send_instructions, :email => self.resource.email if self.resource.invitation_sent_at
      respond_with resource, :location => after_invite_path_for(resource)
    else
      @list = List.find(list_id)
      respond_with_navigational(resource) { render :new }
    end
  end

  private
  def invite_params
    params.require(:user).permit(:name, :email, :list_id)
  end
end