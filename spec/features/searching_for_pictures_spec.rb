require 'spec_helper'

feature 'searching picture'  do

  scenario 'I can search by title' do
    picture1 = FactoryGirl.create(:picture)
    picture2 = FactoryGirl.create(:picture, title: 'MyDog')

    visit pictures_path
    save_and_open_page
    fill_in 'q_title_cont', with: 'Dog'
    click_on 'Search'

    expect(page).to have_content('MyDog')
    expect(page).to_not have_content('MyCat')
  end

end
