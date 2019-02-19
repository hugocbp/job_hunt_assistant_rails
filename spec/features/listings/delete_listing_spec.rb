require 'rails_helper'

describe 'Deleting a listing' do
  let(:listing) { FactoryBot.create(:listing_with_technologies) }
  before(:each) { sign_in listing.user }

  it 'destroys the listing and shows the listings' do
    visit listing_path(listing)

    click_link 'Delete'

    expect(current_path).to eq(listings_path)
    expect(page).not_to have_content(listing.title)
    expect(page).to have_content 'Listing deleted'
  end
end