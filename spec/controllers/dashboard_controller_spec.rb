require 'spec_helper'

describe DashboardController do
  let!(:user) { create(:user, :with_list) }
  let!(:bill_1) { user.lists.first.bills.create(amount: 950.00, description: "Rent", date: Date.today, user: user) }
  let!(:bill_2) { user.lists.first.bills.create(amount: 75.00, description: "Electricity", date: Date.today, user: user) }
  before { sign_in(user) }
    
  describe "GET #stats" do
    it "dashboard is being populated with a list of all the bills" do
      get :stats
      response.should render_template('bills/_totals')
    end
  end
end
