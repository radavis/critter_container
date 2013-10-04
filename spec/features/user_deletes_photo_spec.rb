require 'spec_helper'

feature 'only the user should be able to delete their photo' do

  let(:user) { FactoryGirl.create(:user) }

  scenario 'user uploads a photo and deletes it' do
    sign_in_as(user)

    picture = FactoryGirl.create(:picture, user_id: user.id )
    previous_count = user.pictures.count
    visit delete_picture_path(picture)

    expect(page).to have_content('Your picture was deleted')
    expect(user.pictures.count).to eq(previous_count - 1)
  end

end
