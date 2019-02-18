require 'rails_helper'

describe 'Deleting a technology' do
  let(:user) { FactoryBot.create(:user_with_technologies, technologies_count: 1)}
  before(:each) { sign_in user }

  it 'destroys the technology and displays the tech list' do
    tech = user.technologies.first
    expect(Technology.count).to eq 1
    
    visit technologies_path

    expect(page).to have_content tech.name

    click_link "Delete"

    expect(current_path).to eq(technologies_path)
    expect(page).to have_content "Technology deleted"
    expect(page).not_to have_content tech.name
    expect(Technology.count).to eq 0
  end
end