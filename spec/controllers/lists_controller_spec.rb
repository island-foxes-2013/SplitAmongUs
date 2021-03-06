require 'spec_helper'

describe ListsController do
  let(:user) { create(:user) }
  let!(:list) { user.lists.create(name: 'test list') }

   
  before do
    sign_in(user)
  end

  describe "GET #index" do   
    it "renders all of the current users lists" do
      @expected = user.lists.order(:created_at).to_json
      xhr :get, :index, list: user.lists.order(:created_at).to_json
      response.body.should == @expected
    end
  end

  describe "GET #show" do
    context "HTML request" do
      it "assigns the requested list to @list" do
        get :show, id: list.id
        assigns(:list).should eq(list)
      end
      it "renders the show template" do
        get :show, id: list.id
        expect(response).to render_template("show")
      end
    end

    context "AJAX request" do
      it "renders the show template" do
        xhr :get, :show, id: list.id
        expect(response).to render_template("show")
      end
    end
  end

  describe "PUT #update", js: true do
    context "valid attributes" do
      it "changes list's attributes" do
        put :update, id: list.id, list: { name: "Some New Name" }
        list.reload.name.should == "Some New Name"
      end
    end
    context "invalid attributes" do
      it "does not change list's attributes" do
        expect {
          put :update, id: list.id, list: { name: nil }
        }.not_to change{ list.name }
      end
      it "gets error messages in a JSON response" do
        put :update, id: list.id, list: { name: nil }
        response.status.should == 422
        JSON.parse(response.body).should have_key 'error'
      end
    end
  end

  describe "DELETE #destroy" do
    it "deletes the requested list from the database" do
      expect{ 
        delete :destroy, id: list.id
        }.to change{List.count}.by(-1)
    end
    it "redirects to the dashboard page" do
      delete :destroy, id: list.id
      response.should redirect_to dashboard_index_path
    end
  end

  describe "POST #create" do
    context "with valid attributes" do
      let(:list_attributes) { attributes_for(:list) }
      it "saves the new list in the database" do
        expect {
          post :create, list: list_attributes
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
        response.status.should == 422
        JSON.parse(response.body).should have_key 'error'
      end
    end
  end 

  describe "GET #stats" do
    it "assigns a current users bills to bills as a local" do
      get :stats, id: list.id
      response.should render_template('lists/_total')
    end
  end
end