class Users::InvitationsController < Devise::InvitationsController
  def new
    @list = List.find(params[:list_id])
    self.resource = resource_class.new
    @friends = current_user.friends.map {|friend| friend.name }
  end

  def create
    form_params = invite_params
    list_id = form_params.delete(:list_id)
    @list = List.find(list_id)
    user = User.find_by_email(invite_params[:email])

    #if user exists AND is part of the list, don't invite, show error
    if user && user.lists.include?(@list)
      flash[:alert] = "#{invite_params[:name]} is already part of this list"
      self.resource = user
      render :new
    
    #if user already exists AND not part of the list, don't invite, add to list
    elsif user
      user.groups.create(:list_id => list_id)
      #TODO: send email letting user know she's on a new list?
      #TODO: add flash[:notice] saying user was added to list
      redirect_to after_invite_path_for(resource)
    #if user doesn't exist, invite, add to list
    else
      self.resource = resource_class.invite!(form_params, current_inviter)
      
      if resource.errors.empty?
        self.resource.groups.create(:list_id => list_id)
        set_flash_message :notice, :send_instructions, :email => self.resource.email if self.resource.invitation_sent_at
        respond_with resource, :location => after_invite_path_for(resource)
      else
        respond_with_navigational(resource) { render :new }
      end
    end
  end

  private
  def invite_params
    params.require(:user).permit(:name, :email, :list_id)
  end
end