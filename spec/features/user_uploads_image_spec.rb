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
    expect(page).to have_content('Title')
    find_field('picture_image')
  end

  scenario 'user successfully uploads local image' do
    user = FactoryGirl.create(:user)
    sign_in_as(user)
    path = Dir.pwd
    count = Picture.all.size
    visit new_picture_path
    fill_in 'Title', with: "Cat"
    attach_file('picture_image', "#{path}/spec/features/helveticat.jpg")
    click_on 'Create Picture'
    page.should have_css("img")
    expect(Picture.all.size).to eql(count + 1)
  end

  scenario 'user tries to foolishly upload something not an image' do
    user = FactoryGirl.create(:user)
    sign_in_as(user)
    count = Picture.all.size
    path = Dir.pwd
    visit new_picture_path
    fill_in 'Title', with: "Cat"
    attach_file('picture_image', "#{path}/spec/features/user_signs_up_spec.rb")
    click_on 'Create Picture'
    expect(page).to have_content("Error")
    expect(Picture.all.size).to eql(count)
  end

  # scenario 'user successfully uploads remote image' do
  #   visit new_picture_path
  #   fill_in 'Title', with: "Cat"
  #   fill_in "Image URL", with: "http://placedog.com/300/400"
  #   click_on 'Create Picture'
  #   page.should have_css("img")
  # end

  # scenario 'user tries to upload garbage link' do
  #   visit new_picture_path
  #   fill_in 'Title', with: "Cat"
  #   fill_in "Image URL", with: "fja[iojhfiasofj"
  #   click_on 'Create Picture'
  #   save_and_open_page
  #   expect(page).to have_content("Error")
  # end

  
end