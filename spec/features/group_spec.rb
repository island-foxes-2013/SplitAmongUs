require 'spec_helper'
require 'selenium-webdriver'

describe "groups" do

  context "invite friends", js: true do

    let(:user) { create(:user, :with_list) }

    before do
      login_as(user)
      visit root_path
      click_on(user.lists.first.name)
    end

    # it "allows a user to invite friends via email" do
    #   click_link_or_button('Add A Friend')
    #   page.should have_content('Send invitation')
    # end

    it "will send invitations on submit" do
      pending
    end

  end
  
  context "create a group" do

    it "allows a user to create a group" do
      pending
    end

    it "allows the user to select multiple users" do
      pending
    end

    it "allows the user to select one user" do
      pending
    end

    it "will not allow users to be added to the group who have not been invited" do
      pending
    end

    it "allows a user to create multiple groups" do 
      pending
    end
  end

  context "view groups" do
    
    it "displays all groups" do
      pending
    end

    it "displays group pictures" do
      pending
    end

    it "displays group members names" do 
      pending
    end

  end

  context "edit groups" do

    it "allows a user to delete members of an established group" do 
      pending
    end

    it "allows a user to add members to an established group" do
      pending
    end

    it "requires a user to invite members before adding them to a group" do
      pending
    end

  end

  context "delete groups" do
    
    it "allows a user to delete a group" do
        pending
      end

      it "asks a user to confirm delete before deleting" do
        pending
      end

      it "deletes a group if a user confirms delete" do
        pending
      end

      it "does not delete the group if not confirmed" do
        pending
      end

      it "reloads the groups without refreshing after delete" do
        pending
      end
  end


end
