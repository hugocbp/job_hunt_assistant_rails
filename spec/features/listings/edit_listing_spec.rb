require 'rails_helper'

describe 'Editing a listing' do
  
  let(:listing) { FactoryBot.create(:listing) }
  before(:each) { sign_in listing.user }

  it 'updates the listing and show the new listing details' do
    visit listing_url(listing)
    
    expect(page).to have_content listing.title

    click_link 'Edit'

    expect(current_path).to eq(edit_listing_path(listing))
    expect(find_field('listing_title').value).to eq(listing.title)

    fill_in 'listing_title', with: 'New Changed Title'

    click_button 'Update Listing'

    expect(current_path).to eq(listing_path(listing))
    expect(page).to have_content('New Changed Title')
    expect(page).to have_content('Listing updated')
  end

  it 'fails to update if it is invalid' do
    visit edit_listing_path(listing)

    fill_in 'listing_title', with: ''

    click_button 'Update Listing'
    expect(page).to have_content 'Error!'
  end
end