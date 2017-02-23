require 'rails_helper'

feature "Visitor is able to logout from site" do
  let(:user) {FactoryGirl.create(:user)}
  scenario 'visitor signs in, and then logs out' do
    visit root_path
    fill_in_signin_fields 
    click_link 'Logout'
    expect(page).to have_content('Signed out successfully')
  end
end

