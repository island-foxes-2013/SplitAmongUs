require 'spec_helper'

describe 'SignUp' do

  before do
    visit root_path
  end

  let(:user) { build(:user) }
  let(:dup_user) { create(:user) }

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
      page.should have_content("Name can't be blank")
    end

    it "does not allow a user to sign up without an email" do
      within '#signup' do
        fill_in 'name', with: user.name
        fill_in 'email', with: ""
        fill_in 'password', with: user.password
        fill_in 'password confirmation', with: user.password
        click_button "Sign up"
      end
      page.should have_content("Email can't be blank")
    end

    it "does not allow a user to sign up with a duplicate email" do
      within '#signup' do
        fill_in 'name', with: dup_user.name
        fill_in 'email', with: dup_user.email
        fill_in 'password', with: dup_user.password
        fill_in 'password confirmation', with: dup_user.password
        click_button "Sign up"
      end
      page.should have_content("Email has already been taken")
    end

    it "does not allow a user to sign up with an invalid email" do
      within '#signup' do
        fill_in 'name', with: user.name
        fill_in 'email', with: 'example@example'
        fill_in 'password', with: user.password
        fill_in 'password confirmation', with: user.password
        click_button "Sign up"
      end
      page.should have_content("Email is invalid")
    end


    it "does not allow a user to sign up without a password" do
      within '#signup' do
        fill_in 'name', with: user.name
        fill_in 'email', with: user.email
        fill_in 'password', with: ""
        fill_in 'password confirmation', with: ""
        click_button "Sign up"
      end
      page.should have_content("Password can't be blank")
    end

    it "does not accept passwords that are too short" do
      within '#signup' do
        fill_in 'name', with: user.name
        fill_in 'email', with: user.email
        fill_in 'password', with: "12345"
        fill_in 'password confirmation', with: "12345"
        click_button "Sign up"
      end
      page.should have_content("Password is too short")
    end

    it "does not allow a user to sign up without matching passwords" do
      within '#signup' do
        fill_in 'name', with: user.name
        fill_in 'email', with: user.email
        fill_in 'password', with: user.password
        fill_in 'password confirmation', with: user.password + "1"
        click_button "Sign up"
      end
      page.should have_content("Password doesn't match confirmation")
    end
  end




end