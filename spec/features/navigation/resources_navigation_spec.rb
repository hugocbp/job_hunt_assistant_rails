require 'rails_helper'

describe 'The navigation' do
  let(:user) { FactoryBot.create(:user) }
  before(:each) { sign_in user }

  it 'allows a user to list all listings' do
    visit dashboard_path

    click_link "Listings"

    expect(current_path).to eq(listings_path)
    expect(page).to have_content "Your Listings"
  end

  it 'allows a user to list all technologies' do
    visit dashboard_path

    click_link "Technologies"

    expect(current_path).to eq(technologies_path)
    expect(page).to have_content "Your Technologies"
  end

  it 'allows a user to list all companies' do
    visit dashboard_path

    click_link "Companies"

    expect(current_path).to eq(companies_path)
    expect(page).to have_content "Your Companies"
  end
end