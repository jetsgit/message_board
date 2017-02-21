module FeatureMacros
  def fill_in_signin_fields
      fill_in 'user[email]', with: user.email
      fill_in 'user[password]', with: user.password
      click_button 'Submit'
  end
  
  def fill_in_message_fields
    fill_in 'message[title]', with: 'New message'
    fill_in 'message[content]', with: 'Salmon running'
    click_button 'Create Message'
  end
end
