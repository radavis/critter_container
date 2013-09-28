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
    visit new_picture_path
    save_and_open_page
    expect(page).to have_content('Title')
    find_field('picture_image')
    expect(page).to have_content('Image URL')
  end

  scenario 'user uploads image successfully' do
    picture_1 = FactoryGirl.create(:picture)
    expect(picture_1.image).to eql("http://placedog.com/300/400")
  end

  # scenario ' ' do
  #   visit new_picture_path
  #   fill_in 'Title', with: "Cat"
  #   fill_in "Image URL", with: "http://placedog.com/300/400"
  #   click_on 'Create Picture'
  #   expect(page).to have_content('What a purr-fect picture!')
  # end
end