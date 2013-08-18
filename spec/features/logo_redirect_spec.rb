require 'spec_helper'
require 'selenium-webdriver'

describe 'SignIn' do
  let(:user) { create(:user) }

  before do
    visit root_path
  end

  context 'a user clicks on the logo' do
  	it "sends a user to his/her dashboard" do
	  	current_user = :user
	  	click_link('Split*Among.Us')
	  	redirect_to(dashboard_index_path)
  	end

  	it 'a non-signed-in user gets redirected to root path' do
	  	current_user = nil
	  	click_link('Split*Among.Us')
		  redirect_to(root_path)
		end
  end

end