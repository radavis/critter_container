require 'spec_helper'

feature 'user votes on pictures', %Q{
  As a registered critter container user
  I would like to vote on the pictures I like and dislike
  So that the hivemind can decide the best pictures
} do

  # Acceptance Criteria:
  #
  # * There is an upvote button.
  # * There is a downvote button.
  # * User can only vote once.
  # * User can change vote from positive to negative

  scenario 'user upvotes a picture' do
    user = FactoryGirl.create(:user)
    picture = FactoryGirl.create(:picture)
    previous_count = picture.score

    sign_in_as(user)
 
    visit picture_path(picture.id)
    click_on 'upvote' # upvote id tag

    expect(picture.reload.score).to eql(previous_count + 1)
  end

  scenario 'user downvotes a picture' do
    user = FactoryGirl.create(:user)
    picture = FactoryGirl.create(:picture)
    previous_count = picture.score

    sign_in_as(user)

    visit picture_path(picture.id)
    click_on 'downvote'
    expect(picture.reload.score).to eql(previous_count - 1)
  end

  scenario 'user tries to vote twice' do
    user = FactoryGirl.create(:user)
    picture = FactoryGirl.create(:picture)
    previous_count = picture.score

    sign_in_as(user)

    visit picture_path(picture.id)
    click_on 'upvote'
    click_on 'upvote'
    expect(picture.reload.score).to eql(previous_count + 1)
  end

  scenario 'user changes their vote' do
    user = FactoryGirl.create(:user)
    picture = FactoryGirl.create(:picture)
    previous_count = picture.score

    sign_in_as(user)

    visit picture_path(picture.id)
    click_on 'upvote'
    click_on 'downvote'
    expect(picture.reload.score).to eql(previous_count - 1)
  end

end



