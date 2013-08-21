require 'spec_helper'

describe SettlementsController do
  let!(:user) { create(:user) }
  let!(:user2) { create(:user) }
  let!(:list) { create(:list) }
  let!(:settlement) { create(:settlement) }
   
  before do
    sign_in(user)
  end

  describe "GET #new" do
    it "assigns a new Settlement to settlement" do
      get :new, list_id: list.id
      assigns[:settlement].should be_new_record
      assigns[:settlement].should be_a(Settlement)

    end
    it "renders the new template" do
      get :new, list_id: list.id
      expect(response).to render_template("new")
    end
  end


  describe "POST #create" do
    context "with valid attributes" do
      it "saves the new settlement in the database" do
        expect {
          post :create, settlement: list_attributes
        }.to change(List, :count).by(1)
        List.last.users.should == [user]
       end
      it "redirects to the dashboard page" do
        post :create, list: list_attributes
        actual_name = JSON.parse(response.body)['name']
        actual_name.should be_present
        actual_name.should == list_attributes[:name]
      end
    end

    context "with invalid attributes" do
      it "does not save the new list in the database" do
        expect {
          post :create, list: attributes_for(:invalid_list)
          }.to_not change(List,:count)
      end
      it "renders the error message and redirects to the dashboard page" do
        post :create, list: attributes_for(:invalid_list)
        response.should redirect_to dashboard_index_path
      end
    end
  end 
end