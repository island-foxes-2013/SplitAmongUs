require 'spec_helper'

describe DashboardController do
  let!(:user) { create(:user) }
  let!(:list) { create(:list) }
  let!(:bill_1) { list.bills.create(amount: 950.00, description: "Rent", date: Date.today, user: user) }
  let!(:bill_2) { list.bills.create(amount: 75.00, description: "Electricity", date: Date.today, user: user) }
  before { sign_in(user) }
    
  describe "AJAX GET #stats" do
    it "assigns list to users last list and bill to users last bill" do
      xhr :get, :stats
      assigns[:list].should == user.lists.last
      assigns[:bill].should == user.lists.last.bills
    end
  end
end
