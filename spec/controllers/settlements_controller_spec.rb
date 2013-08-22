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
          post :create, list_id: list.id, settlement: settlement_attributes
        }.to change(Settlement, :count).by(1)
        Settlement.last.should == [settlement]
       end
      it "redirects to the dashboard page" do
        post :create, list_id: list.id, settlement: attributes_for(:settlement)
        response.should redirect_to dashboard_index_path
      end
    end

    context "with invalid attributes" do
      it "does not save the new settlement in the database" do
        expect {
          post :create, list_id: list.id, settlement: attributes_for(:invalid_settlement)
          }.to_not change(Settlement,:count)
      end
      it "renders the error message and redirects to the dashboard page" do
        post :create, list_id: list.id, settlement: attributes_for(:settlement)
        response.should redirect_to dashboard_index_path
      end
    end
  end 
end