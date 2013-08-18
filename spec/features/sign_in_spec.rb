require 'spec_helper'

describe 'SignIn' do
  let(:user) { create(:user) }

  context "after sign-in" do
    it "should redirect to the dashboard page" do
      visit root_path
      within '#login' do 
        fill_in 'email', :with => user.email
        fill_in 'password', :with => user.password
        click_button "Log In"
      end
      page.should have_content("Welcome, #{user.name}")
    end
  end




end