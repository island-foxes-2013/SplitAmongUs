require 'spec_helper'
require 'selenium-webdriver'

describe "bill management" do

	context "view all bills" do

		it "should show all bills when button is clicked" do
			pending
		end

		it "should show all bills by list" do
			pending
		end

		it "shows the total amount" do
			pending 
		end
	end

	context "create a new bill" do

		it "dispays a modal to create a new bill on click" do
			pending
		end

		it "creates a new bill if all information is filled in" do
			pending
		end

		it "does not create a bill if a user cancels" do
			pending
		end

		it "does not create a bill if a user does not fill in all information" do
			pending
		end

		it "shows the new bill on submit without refreshing", :js => true do
			pending
		end

	end

	context "view a bill" do

		it "shows a bill with all information" do
			pending
		end

		it "displays the bill on the same page" do
			pending
		end

	end

	context "edit a bill" do

		it "has a button to edit a bill" do 
			pending
		end

		it "brings up a modal to edit a bill" do
			pending
		end

		it "saves edited information" do 
			pending
		end

		it "does not save information if user hits cancel" do 
			pending
		end

		it "does not save incomplete information" do 
			pending
		end

		it "displays the edited information without refreshing on submit" do 
			pending
		end		

	end

	context "delete a bill" do
		
		it "allows a user to delete a bill" do
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

	context "check a bill as paid" do
		
		it "allows a user to check the bill as paid" do
			pending
		end

		it "takes the bill amount off of the total amount" do
			pending
		end

		it "includes the amount if the bill is not paid" do
			pending
		end

	end

end