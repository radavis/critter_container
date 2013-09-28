require 'spec_helper'

feature 'user signs out', %Q{
  As a registered user
  I want to sign out of the app
  So that I close my current session
} do 

  # Acceptance Criteria:
  #
  # * User must be first signed in to the app
  # * User must select the sign out button
  # * User will be notified that they have 
  #   signed out of their profile

  scenario 'User signs out of current session ' do
    user = FactoryGirl.create(:user)
    visit root_path
    click_on 'Sign in'
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Sign in'

    expect(page).to have_content('Signed in successfully')

    click_on 'Sign out'

    expect(page).to have_content('Signed out')
  end  

end