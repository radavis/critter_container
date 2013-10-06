require "spec_helper"

feature 'picture has unique url', %Q{
  As a user,
  I want each uploaded picture to have a unique url
  So that they are easier to find
} do

  scenario 'user uploads two pictures with the same title' do
    picture1 = FactoryGirl.create(:picture)
    picture2 = FactoryGirl.create(:picture)
    
    visit pictures_path
    click_link "picture-#{picture1.id}"
    expect(page.current_url).to have_content("/pictures/#{picture1.title}")

  end
end