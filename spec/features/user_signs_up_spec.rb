require 'spec_helper'

feature 'User Signs Up', %q{

As an unregistered user
I want to sign up for the app
So that I can have full access to the app's features.

}do 
    # Acceptance Criteria:
    # * User must enter username and valid email
    # * User must set password
    # * If user enters valid criteria, they will be 
      # notified that they have successfully registered
    # * If user does not enter valid criteria, 
      # they will be prompted to reenter invalid criteria
  
    scenario 'User Signs Up with valid attributes' do
      visit new_user_registration_path
      fill_in 'Alias', with: 'Cat_lady'
      fill_in 'Email', with: 'drm336@nyu.edu'
      
      fill_in 'user_password', with: '12345678'
      fill_in 'Password confirmation', with: '12345678'
      click_on 'Sign up'
      expect(page).to have_content('Registered successfully')
    end

end
