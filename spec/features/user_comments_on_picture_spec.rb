require 'spec_helper'

feature 'user comments on picture', %Q{
  As an authorized user,
  I want to add comments to items
  So that I can share and read thoughts from others.
} do 

  # Acceptance Criteria:
  #
  # * A user can write a comment below one of the items
  # * The comment can't exceed a specified number of characters
  # * The user cannot edit a comment once it has been posted

  scenario 'user posts comment with valid attributes' do
    user = FactoryGirl.create(:user)
    picture = FactoryGirl.create(:picture)
    previous_count = Comment.count

    sign_in_as(user)

    visit picture_path(picture)
    fill_in 'Comment', with: 'My cat is fat'
    click_button 'Post comment'

    expect(page).to have_content('Comment successfully posted')
    expect(page).to have_content('My cat is fat')
    expect(Comment.count).to eql(previous_count + 1)
  end

  scenario 'user posts comment with invalid attributes' do
    user = FactoryGirl.create(:user)
    picture = FactoryGirl.create(:picture)
    previous_count = Comment.count

    sign_in_as(user)

    visit picture_path(picture)
    click_button 'Post comment'

    expect(page).to have_content('Your comment was not posted')
    expect(Comment.count).to eql(previous_count)
  end

  scenario 'unauthenticated user posts a comment' do
    picture = FactoryGirl.create(:picture)

    visit picture_path(picture)

    expect(page).to_not have_content('Post comment')
    expect(page).to have_content('Sign In To Comment')
  end

end