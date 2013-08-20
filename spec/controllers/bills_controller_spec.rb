require 'spec_helper'

describe BillsController do
  
  let(:user) { create(:user) }
  let!(:list) { create(:list) }
  let!(:bill) { create(:bill, list: list) }
   
  before do
    sign_in(user)
    redirect_to list_path(list.id)
  end


  describe "GET #index" do
    it "assigns the user's list to list" do
      get :index, user_id: user.id
      assigns(:lists).should eq(user.lists)
    end
  end

  describe "GET #edit" do
    it "assigns the requested bill to bill" do
      get :edit, list_id: list.id, id: bill.id
      assigns(:bill).should eq(bill)
    end
  end

  describe "PUT #update" do
    it "updates the attributes of the bill" do
      put :update, bill: {description: "Zoom zoom"}, list_id: list.id, id: bill.id
      bill.reload.description.should == "Zoom zoom"
    end
    it "redirects to the dashboard page" do
      put :update, bill: attributes_for(:bill), list_id: list.id, id: bill.id
      response.should redirect_to dashboard_index_path
    end
  end

  describe "DELETE #destroy" do
    it "deletes the requested bill from the database" do
      expect{ 
        delete :destroy, id: bill.id, list_id: list.id
        }.to change{Bill.count}.by(-1)
    end
    it "redirects to the dashboard page" do
      delete :destroy, id: bill.id, list_id: list.id
      response.should redirect_to dashboard_index_path
    end
  end

  describe "POST #create" do
    context "AJAX request" do 
      context "with valid attributes" do
     
        it "saves the new bill in the database" do
          expect {
            xhr :post, :create, list_id: list.id, bill: attributes_for(:bill)
          }.to change(Bill, :count).by(1)
        end

        it "renders the bill partial" do
          xhr :post, :create, list_id: list.id, bill: attributes_for(:bill)
          expect(response).to render_template("bill")
        end
      end

      context "with invalid attributes" do
     
        it "does not save the new bill in the database" do
          expect {
            xhr :post, :create, list_id: list.id, bill: attributes_for(:invalid_bill)
            }.to_not change(Bill,:count)
        end
     
        it "renders the error message and redirects to the show/dashboard page" do
          xhr :post, :create, list_id: list.id, bill: attributes_for(:invalid_bill)
          response.should redirect_to list_path(bill.list)
        end
      end
    end
  end 
end