require 'spec_helper'

describe DashboardController do
  let!(:user) { create(:user, :with_list) }
  let!(:bill_1) { user.lists.first.bills.create(amount: 950.00, description: "Rent", date: Date.today, user: user) }
  let!(:bill_2) { user.lists.first.bills.create(amount: 75.00, description: "Electricity", date: Date.today, user: user) }
  before { sign_in(user) }
    
  describe "AJAX GET #stats" do
    it "assigns list to users last list and bill to users last bill" do
      xhr :get, :stats
      json = JSON.parse(response.body)
      json["list"]["name"].should eq(user.lists.last.name)
      json["bill"].first["description"].should eq(bill_1.description)
    end
  end
end
