require 'rails_helper'

describe 'Adding a link' do
  it 'goes to the new link page from the homepage' do
    visit '/links/new'
    expect(page).to have_content 'Add'
  end

  it 'adds a link to the homepage' do
    visit '/links/new'
    within("form") do
      fill_in "link_url", with: 'http://www.learnhowtoprogram.com'
      fill_in "link_name", with: 'epicodus'
      click_button 'Create Link'
    end
    expect(page).to have_content 'epicodus'
    expect(page).to have_content 'discuss'
  end
end

describe 'Viewing a user' do
  let(:user) { FactoryGirl.create(:user) }
  it 'displays the user page' do
    visit user_path(user)
    expect(page).to have_content 'JJ'
  end
end
