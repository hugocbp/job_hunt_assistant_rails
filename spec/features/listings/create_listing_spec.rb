require 'rails_helper'

describe 'Listing#new' do
  let(:user) { FactoryBot.create(:user) }
  
  context 'with a logged in user' do
    it 'displays the new listing form' do
      sign_in user

      visit new_listing_path

      expect(page).to have_content "Create a new listing"
    end

    it 'creates a new listing' do
      sign_in user

      visit new_listing_path
      expect(page).to have_content "Create a new listing"

      within("#new_listing") do
        fill_in "listing_title", with: "Test Listing"
        fill_in "listing_company", with: "Some sample company"
        fill_in "listing_technologies", with: "Ruby on Rails"
        fill_in "listing_description", with: "Some random description"
      end

      click_button "Create Listing"

      expect(page).to have_content "Create a new listing"
    end
  end
end