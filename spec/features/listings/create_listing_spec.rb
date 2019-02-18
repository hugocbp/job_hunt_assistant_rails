require 'rails_helper'

describe 'Creating a new listing' do
  let(:user) { FactoryBot.create(:user) }
  before(:each) { sign_in user }

  it 'saves the listing and show its details' do
    visit listings_url

    click_link 'New Listing'
    expect(current_path).to eq(new_listing_path)

    fill_in 'listing_title', with: 'New test listing'
    fill_in 'listing_company', with: 'Test Company'
    fill_in 'listing_description', with: 'Dummy description for new listing'
    fill_in 'listing_technologies', with: 'Test Tech 1, Test Framework 1'

    click_button 'Create Listing'

    expect(current_path).to eq(listing_path(Listing.last))
    expect(page).to have_content 'New test listing'
    expect(page).to have_content 'Listing created'
  end

  it 'does not save if the listing is invalid' do
    visit new_listing_path

    expect { click_button 'Create Listing' }.not_to change(Listing, :count)
    expect(page).to have_content("Error!")
  end
end