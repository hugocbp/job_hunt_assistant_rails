require "rails_helper"

describe "Editing a listing", javascript: true do
  let(:listing) { FactoryBot.create(:listing) }
  before(:each) { sign_in listing.user }

  context "with valid data" do
    it "shows the edit form for the correct listing" do
      visit listing_url(listing)

      expect(page).to have_content listing.title

      click_link "Edit"

      expect(current_path).to eq(edit_listing_path(listing))
      expect(find_field("listing_title").value).to eq(listing.title)
    end

    it "updates the listing title" do
      visit edit_listing_path(listing)

      fill_in "listing_title", with: "New Changed Title"

      click_button "Update Listing"

      expect(current_path).to eq(listing_path(listing))
      expect(page).to have_content("Listing updated")
      expect(page).not_to have_content(listing.title)
      expect(page).to have_content("New Changed Title")
    end

    it "updates the listing company" do
      new_company = Company.create(user: listing.user, name: "Another Company")

      visit edit_listing_path(listing)

      select new_company.name, from: "listing_company_id"

      click_button "Update Listing"

      expect(current_path).to eq(listing_path(listing))
      expect(page).to have_content("Listing updated")
      expect(page).not_to have_content(listing.company.name)
      expect(page).to have_content(new_company.name)
    end

    it "adds a new technology" do
      tech = FactoryBot.create(:technology, user: listing.user, name: "Tech 1")
      expect(listing.technology_ids.size).to eq 0

      visit edit_listing_path(listing)

      select tech.name, from: "listing_technology_ids"
      click_button "Update Listing"

      expect(current_path).to eq(listing_path(listing))
      expect(page).to have_content("Listing updated")
      expect(page).to have_content(tech.name)
      # TODO: Research how to rerun on existing variable
      expect(Listing.find(listing.id).technology_ids.size).to eq 1
    end

    it "adds a technology to existing ones" do
      tech1 = FactoryBot.create(:technology, user: listing.user, name: "Tech 1")
      tech2 = FactoryBot.create(:technology, user: listing.user, name: "Tech 2")
      listing.technology_ids << tech1.id
      expect(listing.technology_ids.size).to eq 1

      visit edit_listing_path(listing)

      # Selecting again because of Selectize
      # TODO: Find better way to handle previous save tech
      select tech1.name, from: "listing_technology_ids"
      select tech2.name, from: "listing_technology_ids"

      click_button "Update Listing"

      expect(current_path).to eq(listing_path(listing))
      expect(page).to have_content("Listing updated")
      expect(page).to have_content(tech1.name)
      expect(page).to have_content(tech2.name)
      # TODO: Research how to rerun on existing variable
      expect(Listing.find(listing.id).technology_ids.size).to eq 2
    end

    it "removes a technology" do
      tech = FactoryBot.create(:technology, user: listing.user, name: "Tech 1")
      listing.technology_ids << tech.id
      expect(listing.technology_ids.size).to eq 1

      visit edit_listing_path(listing)

      unselect tech.name, from: "listing_technology_ids"
      click_button "Update Listing"

      expect(current_path).to eq(listing_path(listing))
      expect(page).to have_content("Listing updated")
      expect(page).not_to have_content(tech.name)
      # TODO: Research how to rerun on existing variable
      expect(Listing.find(listing.id).technology_ids.size).to eq 0
    end

    it "updates the description" do
      visit edit_listing_path(listing)

      expect(page).to have_content(listing.description)

      fill_in "listing_description", with: "Changed description"

      click_button "Update Listing"

      expect(current_path).to eq(listing_path(listing))
      expect(page).to have_content("Listing updated")
      expect(page).to have_content("Changed description")
      expect(page).not_to have_content(listing.description)
    end

    it "updates the link for the listing" do
      visit edit_listing_path(listing)

      fill_in "listing_url", with: "https://example.com"

      click_button "Update Listing"

      expect(current_path).to eq(listing_path(listing))
      expect(page).to have_content("Listing updated")
      expect(page).to have_link("Go to listing", href: "https://example.com")
    end

    it "updates the status" do
      visit edit_listing_path(listing)

      select "Offered", from: "listing_status"

      click_button "Update Listing"

      expect(current_path).to eq(listing_path(listing))
      expect(page).to have_content("Listing updated")
      expect(page).to have_content("Offered")
    end
  end

  context "with invalid data" do
    it "displays error for title" do
      visit edit_listing_path(listing)

      fill_in "listing_title", with: ""

      click_button "Update Listing"
      expect(page).to have_content "Title is too short"
    end

    it "displays error for improper url" do
      visit edit_listing_path(listing)

      fill_in "listing_url", with: "example.com"

      click_button "Update Listing"
      expect(page).to have_content "Url is invalid"
    end
  end
end
