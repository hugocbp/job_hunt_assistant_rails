require 'rails_helper'

describe 'Listing#show' do
  let(:user) { FactoryBot.create(:user_with_listings) }
  
  it 'shows the individual listing' do
    listing = user.listings.first
    sign_in user

    visit listing_path(listing.id)
    expect(page).to have_content listing.title
    expect(page).to have_content listing.company
    expect(page).to have_content listing.description
  end
end