require 'spec_helper'

feature 'user signs in', %q{
  As a registered user
  I want to sign in to the app
  So that I can comment and vote on photos
} do

  # Acceptance Criteria:
  #
  # * User must enter valid email
  #
  # * User must enter valid password
  #
  # * If their sign in information is valid,
  #   they will be redirected to the home page
  #   where they can then comment and vote on photos
  #
  # * If their sign in information is not valid,
  #   they will be prompted to reenter valid information

  scenario 'user signs in with valid credentials' do
    visit new_user_registration_path
    fill_in 'Username', with: 'baby_elephant_lover'
    fill_in 'Email', with: 'user@example.com'

    fill_in 'user_password', with: '12345678'
    fill_in 'Password confirmation', with: '12345678'
    click_button 'Sign up'
    click_on 'Sign out'

    visit root_path
    click_on 'Sign in'
    fill_in 'Email', with: 'user@example.com'
    fill_in 'Password', with: '12345678'
    click_button 'Sign in'

    expect(page).to have_content('Signed in successfully')
    expect(current_path).to eql(root_path)
  end

  scenario 'user signs in with invalid credentials' do
    visit root_path
    click_on 'Sign in'
    click_button 'Sign in'
    expect(page).to have_content('Invalid email or password')
    expect(current_path).to eql(new_user_session_path)
  end
end
