require 'rails_helper'

feature "sign in" do
  let(:user) {FactoryGirl.create(:user)}
  def fill_in_signin_fields
    fill_in 'user[email]', with: user.email
    fill_in 'user[password]', with: user.password
    click_button 'Sign In'
  end

  scenario 'visiting site to log in' do
    visit root_path
    click_link 'Sign In'
    fill_in_signin_fields
    expect(page).to have_content('Signed in successfully')
  end
end
