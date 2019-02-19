require 'rails_helper'

describe 'Listing#show' do
  let(:listing) { FactoryBot.create(:listing) }
  
  it 'shows the individual listing' do
    sign_in listing.user

    visit listing_path(listing.id)
    expect(page).to have_content listing.title
    expect(page).to have_content listing.company.name
    expect(page).to have_content listing.description
  end
end