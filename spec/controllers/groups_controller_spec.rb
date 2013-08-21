require 'spec_helper'

describe GroupsController do
  
  let(:user) { create(:user) }
  let!(:group) { create(:group) }
   
  before do
    sign_in(user)
  end

  describe "DELETE #destroy" do
    it "deletes the requested group from the database" do
      expect{ 
        delete :destroy, id: group
        }.to change{Group.count}.by(-1)
    end
    it "redirects to the dashboard page" do
      delete :destroy, id: group
      response.should redirect_to dashboard_index_path
    end
  end
end