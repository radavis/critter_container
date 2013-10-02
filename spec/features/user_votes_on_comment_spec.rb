require 'spec_helper'

feature 'user votes on comments', %Q{
  As a registered critter container user
  I would like to vote on the comments I like and dislike
  So that the hivemind can decide the best comments
} do

  # Acceptance Criteria:
  #
  # * There is an upvote button.
  # * There is a downvote button.
  # * User can only vote once.
  # * User can change vote from positive to negative

  scenario 'user upvotes a comment' do
    user = FactoryGirl.create(:user)
    picture = FactoryGirl.create(:picture)
    comment = FactoryGirl.create(:comment, picture_id: picture.id, user_id: user.id)
    previous_count = comment.score

    sign_in_as(user)
 
    visit picture_path(picture.id)
    click_on 'comment_upvote_#{comment.id}' 

    expect(comment.reload.score).to eql(previous_count + 1)
  end

  scenario 'user downvotes a comment' do
    user = FactoryGirl.create(:user)
    picture = FactoryGirl.create(:picture)
    comment = FactoryGirl.create(:comment, picture_id: picture.id, user_id: user.id)
    previous_count = comment.score

    sign_in_as(user)
 
    visit picture_path(picture.id)
    
    click_on 'comment_downvote_#{comment.id}' 

    expect(comment.reload.score).to eql(previous_count - 1)
  end

   scenario 'user tries to vote twice on a comment' do
    user = FactoryGirl.create(:user)
    picture = FactoryGirl.create(:picture)
    comment = FactoryGirl.create(:comment, picture_id: picture.id, user_id: user.id)
    previous_count = comment.score

    sign_in_as(user)

    visit picture_path(picture.id)
    click_on 'comment_downvote_#{comment.id}' 
    click_on 'comment_downvote_#{comment.id}' 
    expect(comment.reload.score).to eql(previous_count - 1)
  end

   scenario 'user changes their vote' do
     user = FactoryGirl.create(:user)
    picture = FactoryGirl.create(:picture)
    comment = FactoryGirl.create(:comment, picture_id: picture.id, user_id: user.id)
    previous_count = comment.score

    sign_in_as(user)

    visit picture_path(picture.id)
    click_on 'comment_downvote_#{comment.id}' 
    click_on 'comment_upvote_#{comment.id}' 
    expect(comment.reload.score).to eql(previous_count + 1)
  end

end



