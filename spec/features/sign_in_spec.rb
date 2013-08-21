require 'spec_helper'
require 'selenium-webdriver'

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
      page.should_not have_content("#{user.name}")
    end

    it "doesn't allow a non-user to log in" do
      within '#login' do
        fill_in 'email', with: user.email.gsub!(/^\w+/, 'aeiou')
        fill_in 'password', with: user.password
      end
      page.should_not have_content("#{user.name}")
    end
  end

  context "user forgot password" do
    it 'redirects to password reset page' do
      click_link 'Forgot your password'
      redirect_to(new_user_password_path)
    end
  end

  context "after sign-in" do
    it "redirects to the dashboard page" do
      within '#login' do 
        fill_in 'email', :with => user.email
        fill_in 'password', :with => user.password
        click_button 'Log In'
      end
      page.should have_content("#{user.name}")
    end
  end

  context "user clicks 'remember me' button", :js => true do
    it "remembers a user who clicks remember me button" do
      within '#login' do 
        fill_in 'email', :with => user.email
        fill_in 'password', :with => user.password
        check('Remember me')
        click_button 'Log In'
      end
      page.should have_content("#{user.name}")
      page.execute_script "window.close();"
      page.execute_script "window.open();"
      visit root_path
      page.should have_content("#{user.name}")
    end
  end

end