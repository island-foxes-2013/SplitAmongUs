require 'spec_helper'
require 'selenium-webdriver'


describe "user totals" do

  let!(:user) { create(:user) }
  let!(:user_2) { create(:user) }
  let!(:list) { create(:list) }
  let!(:list_2) { create(:list) }
  let!(:group) { Group.create(user_id: user.id, list_id: list.id) }
  let!(:group_2) { Group.create(user_id: user_2.id, list_id: list.id) }
  let!(:bill_1) { list.bills.create(amount: 950.50, description: "Rent", date: Date.today, user: user) }
  let!(:bill_2) { list.bills.create(amount: 75.26, description: "Electricity", date: Date.today, user: user_2) }
  let!(:bill_3) { list_2.bills.create(amount: 35.75, description: "Dinner", date: Date.today, user: user) }
  let!(:settlement) { Settlement.create(payer_id: user_2.id, payee_id: user.id, amount: 200.00, list_id: list.id)}
  let!(:settlement_2) { Settlement.create(payer_id: user.id, payee_id: user_2.id, amount: 100.00, list_id: list.id)}

  context "calculate totals" do

    it "should return an amount in cents if user paid" do
      user.amount_owed(list, user).should eq(Money.new(33762))
    end

    it "should return an amount in cents if another user paid" do
      user_2.amount_owed(list, user_2).should eq(Money.new(-33762))
    end

    it "should return a total for all lists" do 
      pending
      # user.total_due_for_all_lists.should eq(Money.new(95000))
    end
  end
end

describe "user profile" do

  context "view profile" do

    it "displays a user profile on click" do
      pending
    end

    it "shows an edit form on display" do
      pending
    end

    it "autofills user name, email, and password" do
      pending
    end

  end

  context "edit profile" do 
    
    it "allows a user to edit their name" do
      pending
    end

    it "allows a user to change his/her image" do
      pending
    end

    it "does not require a user to change their password" do
      pending
    end

    it "allows a user to only modify their password" do
      pending
    end

    it "will not save a new password if the confirmation does not match" do
      pending
    end

    it "requires a current password to update information" do
      pending
    end

    it "will not allow a user to change to a non-unique email address" do
      pending
    end

    it "does not update the account information if the current password is incorrect" do
      pending
    end

  end

  context "delete account" do

    it "has a button to delete an account" do
      pending
    end

    it "will require a person to confirm cancellation" do
      pending
    end

    it "will delete a user from the database if they click confirm" do
      pending
    end

    it "will not delete a user who cancels cancellation" do
      pending
    end

  end
	
end