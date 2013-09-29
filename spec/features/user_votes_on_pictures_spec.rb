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
    picture = FactoryGirl.create(:picture)
    previous_count = picture.score

    visit picture_path(picture.id)
    save_and_open_page
    click_on 'up_arrow' # upvote id tag
    expect(picture.score).to eql(previous_count + 1)
  end

  scenario 'user downvotes a picture' do
    picture = FactoryGirl.create(:picture)
    previous_count = picture.score

    visit picture_path(picture.id)
    click_on 'down_arrow'
    expect(picture.score).to eql(previous_count - 1)
  end

  scenario 'user tries to vote twice' do
    picture = FactoryGirl.create(:picture)
    previous_count = picture.score

    visit picture_path(picture.id)
    click_on 'up_arrow'
    click_on 'up_arrow'
    expect(picture.score).to eql(previous_count + 1)
  end

  scenario 'user changes their vote' do
    picture = FactoryGirl.create(:picture)
    previous_count = picture.score

    visit picture_path(picture.id)
    click_on 'up_arrow'
    click_on 'down_arrow'
    expect(picture.score).to eql(previous_count - 1)
  end
end
