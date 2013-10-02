require 'spec_helper'

feature 'image has a state', %Q{
  As an admin,
  I want photo to be approved via number of votes
  So that I can maintain site quality.
} do

  # TODO: decide rejected threshold, refactor tests

  let(:picture) { FactoryGirl.create(:picture) }

  scenario 'photo moves from pending state to rejected state' do
    user = FactoryGirl.create(:user)
    sign_in_as(user)
    visit picture_path(picture)
    click_on 'downvote'
    click_on 'Sign out'

    user2 = FactoryGirl.create(:user)
    sign_in_as(user2)
    visit picture_path(picture)
    click_on 'downvote'
    click_on 'Sign out'

    expect(picture.reload.state).to eq("rejected")
  end

  scenario 'photo moves from pending state to approved state' do
    user = FactoryGirl.create(:user)
    sign_in_as(user)
    visit picture_path(picture)
    click_on 'upvote'
    click_on 'Sign out'

    user2 = FactoryGirl.create(:user)
    sign_in_as(user2)
    visit picture_path(picture)
    click_on 'upvote'
    click_on 'Sign out'

    expect(picture.reload.state).to eq("approved")
  end

end