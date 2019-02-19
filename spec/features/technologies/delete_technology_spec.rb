require 'rails_helper'

describe 'Deleting a technology' do
  let(:tech) { FactoryBot.create(:technology_with_listings) }
  before(:each) { sign_in tech.user }

  it 'destroys the technology and displays the tech list' do
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