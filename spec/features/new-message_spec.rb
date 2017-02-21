require 'rails_helper'

feature "signed in user creates message" do
  let(:user) {FactoryGirl.create(:user)}
  scenario 'message form with title and content creates a new message' do
    msg  = build(:message, @current_user)
    visit root_path
    click_link 'Sign In'
    fill_in_signin_fields
    click_link 'New Msg'
    fill_in 'message[title]', with: msg.title
    fill_in 'message[content]', with: msg.content
    click_button 'Create Message'
    expect(page).to have_content(msg.title)
  end

  scenario 'message with no title generates an error' do
    msg  = build(:message, @current_user)
    visit root_path
    click_link 'Sign In'
    fill_in_signin_fields
    click_link 'New Msg'
    fill_in 'message[content]', with: msg.content
    click_button 'Create Message'
    expect(page).to have_content("*Title can't be blank")
  end

end

