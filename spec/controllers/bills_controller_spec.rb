require 'spec_helper'

describe BillsController do
  
  let(:user) { create(:user) }
  let(:list) { create(:list) }
  let(:bill) { create(:bill, list: list) }
   
  before do
    sign_in(user)
    redirect_to list_path(list.id)
  end

  describe "GET #show" do
   
    it "assigns the requested bill to @bill" do
      pending
      # get :show, id: bill.id
      # assigns(:bill).should eq(bill)
    end
   
    it "renders the show template" do
      pending
      # get :show, id: bill.id
      # expect(response).to render_template("show")
    end
  end

  describe "POST #create" do
   
    context "with valid attributes" do
   
      it "saves the new bill in the database" do
        expect {
          post :create, list_id: list.id, bill: attributes_for(:bill)
        }.to change(Bill, :count).by(1)
       end
   
      it "redirects to the lists show/dashboard page" do
        post :create, list_id: list.id, bill: attributes_for(:bill)
        response.should redirect_to list_path(bill.list)
      end
    end

    context "with invalid attributes" do
   
      it "does not save the new bill in the database" do
        expect {
          post :create, list_id: list.id, bill: attributes_for(:invalid_bill)
          }.to_not change(Bill,:count)
      end
   
      it "renders the error message and redirects to the show/dashboard page" do
        post :create, list_id: list.id, bill: attributes_for(:invalid_bill)
        response.should redirect_to list_path(bill.list)
      end
    end
  end 
end