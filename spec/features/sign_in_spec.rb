require 'spec_helper'

describe 'SignIn' do
  let(:user) { create(:user) }

  before do
    visit root_path
  end

  context "improper sign-in" do
    it "doesn't allow a user to sign up with the wrong password" do
      within '#login' do
        fill_in 'email', with: user.email
        fill_in 'password', with: user.password + "234"
      end
      page.should_not have_content("Welcome, #{user.name}")
    end

    it "doesn't allow a non-user to log in" do
      within '#login' do
        fill_in 'email', with: user.email.gsub!(/^\w+/, 'aeiou')
        fill_in 'password', with: user.password
      end
      page.should_not have_content("Welcome, #{user.name}")
    end
  end

  context "after sign-in" do
    it "redirects to the dashboard page" do
      within '#login' do 
        fill_in 'email', :with => user.email
        fill_in 'password', :with => user.password
        click_button "Log In"
      end
      page.should have_content("Welcome, #{user.name}")
    end
  end




end