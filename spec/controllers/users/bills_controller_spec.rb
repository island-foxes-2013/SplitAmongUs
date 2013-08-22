require 'spec_helper'

module Users
  describe BillsController do
    let(:user) { create(:user, :with_list) }
    before { sign_in(user) }
    
    describe "AJAX GET #index" do
      it "assigns the user's lists" do
        xhr :get, :index, user_id: user.id
        assigns[:lists].should == user.lists
      end

      it "render the bills index template without the layout" do
        xhr :get, :index, user_id: user.id
        response.should render_template "users/bills/index"
        response.should_not render_template("layouts/application")
      end
    end

    describe "GET #index" do
      it "render the bills index template with the layout" do
        get :index, user_id: user.id
        response.should render_template "users/bills/index"
        response.should render_template("layouts/application")
      end
    end

    describe "GET #stats" do
      it "assigns a current users bills to bills as a local" do
        get :stats
        response.should render_template('bills/_totals')
      end
    end
  end
end