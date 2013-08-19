require 'spec_helper'
require 'selenium-webdriver'

describe 'managing lists' do

  let(:user) { create(:user) }

  before do
    visit root_path
    within '#login' do 
      fill_in 'email', :with => user.email
      fill_in 'password', :with => user.password
      click_button 'Log In'
      end
    visit dashboard_index_path
  end

  context 'create a new list' do 

    it "pops up a modal when the create list button is clicked", :js => true do
      click_button "Create new list"
      fill_in "List Name",  with: "Groceries"
    end

    it "saves the new list" do
      pending
    end

    it "shows the new list on the dashboard" do
      pending
    end

    it "makes an empty list" do
      pending
    end


  end

  context 'does not create a list' do
    
    it "does not save a list without a name" do
      pending
    end

    it "does not save a list when cancel is pressed" do
      pending
    end



  end

  context 'view a list' do 
    
    it "displays the title of the list on a click" do
      pending
    end

    it "displays the total of all bills in the list" do
      pending
    end

    it "displays the bills in the list" do
      pending
    end

    it "displays the list without refreshing" do
      pending
    end

    it "has a button to edit the list" do
      pending
    end

    it "has a button to create a new bill" do
      pending
    end

    it "has a button to delete the list" do
    end

  end

  context 'edit a list' do
    
    it "allows the user to change the name of the list" do
      pending
    end

    it "allows the user to edit the name of the list on the same page" do
      pending
    end

    it "loads the edit page without refreshing", :js => true do
      pending
    end

    it "does not change the list name if a user does not save" do
      pending
    end

    it "updates the list name if a user clicks save" do
      pending
    end

    it "updates the list name without refreshing", :js => true do 
      pending
    end

    it "will not allow the user to save a blank list name" do
      pending
    end


  end

  context 'delete a list' do
  
    it "allows a user to delete a list" do
      pending
    end

    it "asks a user to confirm delete before deleting" do
      pending
    end

    it "deletes a list if a user confirms" do
      pending
    end

    it "does not delete if a user does not confirm" do
      pending
    end

    it "reloads the list without refreshing after delete" do
      pending
    end

  end

end


