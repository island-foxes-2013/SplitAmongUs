require 'spec_helper'
require 'selenium-webdriver'

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