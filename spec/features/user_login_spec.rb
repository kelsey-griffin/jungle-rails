require 'rails_helper'

RSpec.feature "UserLogins", type: :feature, js: true do
  before :each do
    User.create!(:name => 'name', :email => 'test@test.com', :password => 'password', :password_confirmation => 'password')
  end

  scenario "User can log in with valid credentials" do

    visit login_path

    page.fill_in 'user_email', with: 'test@test.com'
    page.fill_in 'user_password', with: 'password'
  
    page.find_button('Submit').click
  
    expect(page).to have_css('a', text: 'name')

  end
end
