require 'rails_helper'

describe 'Viewing a user' do
  let(:user) { FactoryGirl.create(:user) }
  it 'displays the user page' do
    visit user_path(user)
    expect(page).to have_content 'JJ'
  end
end
