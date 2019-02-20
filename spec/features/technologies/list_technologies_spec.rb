require 'rails_helper'

describe 'Listing technologies' do
  let(:user) { FactoryBot.create(:user_with_technologies) }
  
  it 'shows all technologies created by the user' do
    sign_in user

    visit technologies_url

    tech = user.technologies
    count = tech[0].requirements.size

    expect(page).to have_content tech.first.name
    expect(page).to have_content tech.last.name
    expect(page).to have_content count
  end
end