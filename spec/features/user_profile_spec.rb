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
      visit root_path
      within '#new_session' do 
        fill_in 'email', with: user.email
        fill_in 'password', with: user.password
        click_button 'Log In'
      end
      expect(page).to have_content("total amount due for all lists: $1025.76")
    end
  end
end

describe "user profile" do

  let!(:user) { create(:user) }
  let!(:user_2) { build(:user) }

  context "view profile" do
    before do
      visit root_path
      within '#new_session' do 
        fill_in 'email', with: user.email
        fill_in 'password', with: user.password
        click_button 'Log In'
      end
      click_link 'my profile'
    end

    it "displays a user profile on click" do
      page.should have_content("#{user.name}")
    end

    it "shows an edit form on display" do
      page.should have_content("Edit")
    end

  end

  context "edit profile" do 

    before do
      visit root_path
      within '#new_session' do 
        fill_in 'email', with: user.email
        fill_in 'password', with: user.password
        click_button 'Log In'
      end
      click_link 'my profile'
    end
    
    it "allows a user to edit their name" do
      fill_in 'Name', with: 'Johnny Depp'
      fill_in 'Current password', with: user.password
      click_button 'Update'
      page.should have_content('Johnny Depp')
    end

    it "allows a user to change his/her image" do
      page.should have_content("To change your image, click here!")
    end

    it "does not require a user to change their password" do
      fill_in 'Email', with: user_2.email
      fill_in 'Current password', with: user.password
      click_button 'Update'
      redirect_to(root_path)
    end

    it "allows a user to only modify their password" do
      fill_in 'Password', with: user.password + "234"
      fill_in 'Password confirmation', with: user.password + "234"
      fill_in 'Current password', with: user.password
      click_button 'Update'
      redirect_to(root_path)
    end

    it "will not save a new password if the confirmation does not match" do
      fill_in 'Password', with: user.password + "234"
      fill_in 'Password confirmation', with: user.password + "24"
      fill_in 'Current password', with: user.password
      click_button 'Update'
      page.should have_content("error")
    end

    it "will not update without a current password" do
      fill_in 'Password', with: user.password + "234"
      fill_in 'Password confirmation', with: user.password + "234"
      fill_in 'Current password', with: ''
      click_button 'Update'
      page.should have_content("error")
    end

    it "will not allow a user to change to a non-unique email address" do
      fill_in 'Password', with: user.password + "234"
      fill_in 'Password confirmation', with: 'example@example.com'
      fill_in 'Current password', with: user.password
      click_button 'Update'
      page.should have_content("error")
    end

    it "does not update the name if the current password is incorrect" do
      fill_in 'Name', with: "Marilyn Monroe"
      fill_in 'Current password', with: user.password + "234"
      click_button 'Update'
      page.should have_content("error")
    end

    it "does not update the eamil if the current password is incorrect" do
      fill_in 'Email', with: user.email.gsub!(/^\w+/, 'aeiou')
      fill_in 'Current password', with: user.password + "234"
      click_button 'Update'
      page.should have_content("error")
    end

    it "does not update the password if the current password is incorrect" do
      fill_in 'Password', with: user.password + "2345678"
      fill_in 'Password confirmation', with: 'example@example.com'
      fill_in 'Current password', with: user.password + "234"
      click_button 'Update'
      page.should have_content("error")
    end

  end

  context "delete account" do

    before do
      visit root_path
      within '#new_session' do 
        fill_in 'email', with: user.email
        fill_in 'password', with: user.password
        click_button 'Log In'
      end
      click_link 'my profile'
    end

    it "has a link to delete an account" do
      page.should have_content("Cancel my account")
    end

  end
	
end