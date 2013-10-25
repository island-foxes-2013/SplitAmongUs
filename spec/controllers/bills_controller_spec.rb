require 'spec_helper'

describe BillsController do
  
  let(:user) { create(:user) }
  let(:user_two) { create(:user) }
  let!(:list) { user.lists.create(name: 'test list') }
  let!(:bill) { create(:bill, list: list, user: user) }
   
  before do
    sign_in(user)
  end


  describe "GET #index" do
    it "assigns the user's list to list" do
      get :index, list_id: list.id
      JSON.parse(response.body).should be_a Array
    end
  end

  describe "GET #edit" do
    it "assigns the requested bill to bill" do
      get :edit, list_id: list.id, id: bill.id, user_id: user.id
      assigns(:bill).should eq(bill)
    end
  end

  describe "PUT #update" do
    it "updates the attributes of the bill" do
      put :update, bill: {description: "Zoom zoom"}, list_id: list.id, id: bill.id, user_id: user.id
      bill.reload.description.should == "Zoom zoom"
    end
    it "redirects to the dashboard page" do
      put :update, bill: attributes_for(:bill), list_id: list.id, id: bill.id, user_id: user.id
      response.should redirect_to dashboard_index_path
    end
  end

  describe "DELETE #destroy" do
    it "deletes the requested bill from the database" do
      expect{ 
        delete :destroy, id: bill.id, list_id: list.id, user_id: user.id
        }.to change{Bill.count}.by(-1)
    end
    it "redirects to the dashboard page" do
      delete :destroy, id: bill.id, list_id: list.id, user_id: user.id
      response.should redirect_to dashboard_index_path
    end
  end

  describe "POST #create" do
    context "AJAX request" do 
      context "with valid attributes" do
     
        it "saves the new bill in the database" do
          expect {
            xhr :post, :create, list_id: list.id, bill: attributes_for(:bill, user_id: user.id)
          }.to change(Bill, :count).by(1)
        end

        it "creates a bill for the given user" do 
          xhr :post, :create, list_id: list.id, bill: attributes_for(:bill, user_id: user_two.id)
          Bill.last.user_id.should eq(user_two.id)
        end

        it "only a user a part of the list can create a bill" do 
        end

        it "only users a part of the list can own the bill" do 
        end

        it "renders the bill JSON" do
          xhr :post, :create, list_id: list.id, user_id: user.id, bill: attributes_for(:bill)
          JSON.parse(response.body).should have_key("description")
        end
      end

      context "with invalid attributes" do
     
        it "does not save the new bill in the database" do
          expect {
            xhr :post, :create, list_id: list.id, user_id: user.id, bill: attributes_for(:invalid_bill)
            }.to_not change(Bill,:count)
        end
     
        it "returns a 422 - Unprocessable Entity" do
          xhr :post, :create, list_id: list.id, user_id: user.id, bill: attributes_for(:invalid_bill)
          response.status.should == 422
        end
      end
    end
  end 
end