require 'spec_helper'
require 'selenium-webdriver'

describe 'managing lists' do

  let(:user) { create(:user) }
  let(:list) { create(:list) }
  let!(:bill_1) { list.bills.create(amount: 950.00, description: "Rent", date: Date.today, user: user) }
  let!(:bill_2) { list.bills.create(amount: 75.00, description: "Electricity", date: Date.today, user: user) }


#   context 'create a new list' do 

#     before do
      
#       visit root_path
#       within '#login' do 
#         fill_in 'email', with: user.email
#         fill_in 'password', with: user.password
#         page.execute_script "$('form#new_session').trigger('submit');"
#       end
#       visit root_path
#     end

#     it "a modal appears when the create list button is clicked", js: true do
#       click_link 'add'
#       fill_in 'List Name',  with: list.name
#     end

#     it "shows the new list on the dashboard", js: true do
#       click_link 'add'
#       fill_in 'List Name',  with: list.name
#       page.execute_script "$('form#new_session').trigger('submit');"
#       page.should have_content(list.name)
#     end

#   end

#   context 'does not create a list' do

#     before do
#       visit root_path
#       within '#login' do 
#         fill_in 'email', with: user.email
#         fill_in 'password', with: user.password
#         page.execute_script "$('form#new_session').trigger('submit');"
#         end
#       visit dashboard_index_path
#     end
    
#     it "does not save a list without a name", js: true do
#       click_link 'add'
#       fill_in 'List Name',  with: ''
#       page.execute_script "$('form#new_session').trigger('submit');"
#       page.should have_content("Name can't be blank")
#     end

#     # it "does not save a list when cancel is pressed" do
#     #   click_link 'add'
#     #   fill_in 'List Name',  with: list.name
#     #   page.execute_script "$('form#new_session').trigger('cancel');"
#     #   page.should_not have_content(list.name)
#     # end



#   end

#   context 'view a list' do 

#     before do
#       visit root_path
#       within '#login' do 
#         fill_in 'email', with: user.email
#         fill_in 'password', with: user.password
#         click_button 'Log In'
#       end
#       visit dashboard_index_path
#       click_link 'add'
#       fill_in 'List Name',  with: list.name
#       page.execute_script "$('form#new_session').trigger('submit');"
#     end
    
#     it "displays the title of the list on a click" do
#       click_link(list.name)
#       page.should have_content(list.name)
#     end

#     it "displays the total of all bills in the list" do
#       click_link(list.name)
#       page.should have_content(1025.00)
#     end

#     it "displays the bills in the list" do
#       pending
#     end

#     it "displays the list without refreshing" do
#       pending
#     end

#     it "has a button to edit the list" do
#       pending
#     end

#     it "has a button to create a new bill" do
#       pending
#     end

#     it "has a button to delete the list" do
#       pending
#     end

#     it "dispays the bill in order of age" do
#       pending
#     end

#   end

#   context 'edit a list' do
    
#     before do
#       visit root_path
#       within '#login' do 
#         fill_in 'email', with: user.email
#         fill_in 'password', with: user.password
#         page.execute_script "$('form#new_session').trigger('submit');"
#         end
#       visit dashboard_index_path
#     end    
    
#     it "allows the user to change the name of the list" do
#       pending
#     end

#     it "allows the user to edit the name of the list on the same page" do
#       pending
#     end

#     it "loads the edit page without refreshing", js: true do
#       pending
#     end

#     it "does not change the list name if a user does not save" do
#       pending
#     end

#     it "updates the list name if a user clicks save" do
#       pending
#     end

#     it "updates the list name without refreshing", js: true do 
#       pending
#     end

#     it "will not allow the user to save a blank list name" do
#       pending
#     end


#   end

#   context 'delete a list' do

#     before do
#       visit root_path
#       within '#login' do 
#         fill_in 'email', with: user.email
#         fill_in 'password', with: user.password
#         page.execute_script "$('form#new_session').trigger('submit');"
#         end
#       visit dashboard_index_path
#     end    
  
#     it "allows a user to delete a list" do
#       pending
#     end

#     it "asks a user to confirm delete before deleting" do
#       pending
#     end

#     it "deletes a list if a user confirms" do
#       pending
#     end

#     it "does not delete if a user does not confirm" do
#       pending
#     end

#     it "reloads the list without refreshing after delete" do
#       pending
#     end
#   end

end


