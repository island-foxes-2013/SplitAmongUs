require 'spec_helper'
require 'selenium-webdriver'

describe "bill management" do
	let(:user) { create(:user) }
  let!(:list) { create(:list) }
  let!(:list) { user.lists.create(name: "apartment") }
	let!(:bill_1) { list.bills.create(amount: 950.00, description: "Rent", date: Date.today, user: user) }
	let!(:bill_2) { list.bills.create(amount: 75.00, description: "Electricity", date: Date.today, user: user) }

	context "view all bills" do
	  # before do
	  #   visit root_path
	  #   within '#login' do 
	  #     fill_in 'email', with: user.email
	  #     fill_in 'password', with: user.password
	  #     click_button 'Log In'
	  #     end
	  #   visit dashboard_index_path
	  # end



	# 	it "should show all bills when button is clicked", :js => true do
	# 		click_button('All My Bills')
	# 		page.should have_content("#{bill_1.description}")
	# 		page.should have_content("#{bill_2.description}")
	# 	end

	# 	it "should show all bills by list" do
	# 		pending
	# 	end

	# 	it "shows the total amount" do
	# 		click_button('All My Bills')
	# 		page.should have_content('Total Amount: $1025.00')
	# 	end
	end

	context "create a new bill" do

		it "dispays a modal to create a new bill on click" do
			pending
			# this is not working!
			# click_link("apartment")
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

	context "sharing a bill" do

		it "allows the user to assign bill responsibility to multiple users" do
			pending
		end

		it "allows the user to charge a percentage of responsibility to group users" do
			pending
		end

	end

end