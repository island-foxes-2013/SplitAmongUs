require 'spec_helper'

describe Users::InvitationsController do

  let(:user) { create(:user) }
  let!(:list) { create(:list) }

  before do
    sign_in(user)
  end

  describe "GET #new" do
    it "assigns the requested list" do
      get :new, list_id: list.id
      assigns(:list).should eq(list)
    end
    it "assigns a new user" do
      get :new, list_id: list.id
      controller.resource.should be_a(User)
      controller.resource.should be_new_record
    end
  end
end