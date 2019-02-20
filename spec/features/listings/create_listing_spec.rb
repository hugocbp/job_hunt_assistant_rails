require 'rails_helper'

describe 'Creating a new listing' do
  let(:user) { FactoryBot.create(:user) }
  before(:each) { sign_in user }

  it 'saves the listing and show its details' do
    company = FactoryBot.create(:company, user: user)
    tech = FactoryBot.create(:technology, user: user)
    tech2 = FactoryBot.create(:technology, user: user)
    expect(Company.all.size).to eq 1
    expect(Technology.all.size).to eq 2
    
    visit listings_url
    
    click_link 'New Listing'
    expect(current_path).to eq(new_listing_path)

    fill_in 'listing_title', with: 'New test listing'
    select company.name, from: 'listing_company_id'
    select tech.name, from: 'requirements_technology_id'
    select tech2.name, from: 'requirements_technology_id'
    fill_in 'listing_description', with: 'Dummy description for new listing'

    click_button 'Create Listing'

    expect(current_path).to eq(listing_path(Listing.last))
    expect(page).to have_content 'New test listing'
    expect(page).to have_content company.name
    expect(page).to have_content 'Listing created'
  end

  it 'does not save if the listing is invalid' do
    visit new_listing_path

    expect { click_button 'Create Listing' }.not_to change(Listing, :count)
    expect(page).to have_content("Error!")
  end
end