require 'spec_helper'

describe 'SignUp' do
  
  let(:user) { create(:user) }

  before do
    visit root_path
  end

  context "user sign up" do
    it "allows a user to sign up if all information is present" do
      within '#signup' do
        fill_in 'name', with: user.name
        fill_in 'email', with: user.email
        fill_in 'password', with: user.password
        fill_in 'password confirmation', with: user.password
        click_button "Sign up"
      end
      page.should have_content("Welcome, #{user.name}")
    end

    it "does not allow a user to sign up without a name" do
        within '#signup' do
        fill_in 'name', with: ""
        fill_in 'email', with: user.email
        fill_in 'password', with: user.password
        fill_in 'password confirmation', with: user.password
        click_button "Sign up"
      end
      page.should have_content("error prohibited this user from being saved")
    end
  end




end