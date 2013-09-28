require 'spec_helper'

feature 'user uploads image', %Q{
  As an authorized user,
  I want to be able to upload a picture for review
  So that users can vote
} do

  # Acceptance Criteria

  # * I can only upload a file of the specified format
  # * The file cannot exceed a specified size
  # * An admin must approve the picture before it can be voted on
  # * Once an admin approves it, it will be posted for voting
  # * Image must have title

  scenario 'user visits upload page' do
    visit new_pictures_path
    expect(page).to have_content('Title')
    expect(page).to have_input('Choose file')
    expect(page).to have_content('Image URL')
  end
end