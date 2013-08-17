require 'spec_helper'

describe UsersController do
  let(:user) { create(:user) }
   
  before do
    sign_in(user)
  end

  describe "GET #show" do
    it "assigns the requested user to @user" do
      get :show, id: user.id
      assigns(:user).should eq(user)
    end
    it "renders the show template" do
      get :show, id: user.id
      expect(response).to render_template("show")
    end
  end
end