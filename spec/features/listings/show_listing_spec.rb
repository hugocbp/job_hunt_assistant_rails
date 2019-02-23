require "rails_helper"

RSpec.describe "Showing a listing" do
  let(:listing) { FactoryBot.create(:listing) }

  it "shows the individual listing" do
    sign_in listing.user

    visit listing_path(listing.id)
    expect(page).to have_content listing.title
    expect(page).to have_content listing.company.name
    expect(page).to have_content listing.description
  end

  # TODO: Find better place/way to test this for model and helper
  it "correctly displays the next status" do
    listing = FactoryBot.create(:listing)
    sign_in listing.user

    visit listing_path(listing)
    expect(page).to have_content "Not Applied"

    listing.next_status
    visit listing_path(listing)
    expect(page).not_to have_content "Not Applied"
    expect(page).to have_content "Applied"

    listing.next_status
    visit listing_path(listing)
    expect(page).not_to have_content "Applied"
    expect(page).to have_content "Called"

    listing.next_status
    visit listing_path(listing)
    expect(page).not_to have_content "Called"
    expect(page).to have_content "Offered"

    listing.next_status
    visit listing_path(listing)
    expect(page).not_to have_content "Offered"
    expect(page).to have_content "Unsuccessful"

    listing.next_status
    visit listing_path(listing)
    expect(page).not_to have_content "Unsuccessful"
    expect(page).to have_content "Not Applied"
  end

  it "correctly displays the previous status" do
    listing = FactoryBot.create(:listing)
    sign_in listing.user

    visit listing_path(listing)
    expect(page).to have_content "Not Applied"

    listing.prev_status
    visit listing_path(listing)
    expect(page).not_to have_content "Not Applied"
    expect(page).to have_content "Unsuccessful"

    listing.prev_status
    visit listing_path(listing)
    expect(page).not_to have_content "Unsuccessful"
    expect(page).to have_content "Offered"

    listing.prev_status
    visit listing_path(listing)
    expect(page).not_to have_content "Offered"
    expect(page).to have_content "Called"

    listing.prev_status
    visit listing_path(listing)
    expect(page).not_to have_content "Called"
    expect(page).to have_content "Applied"

    listing.prev_status
    visit listing_path(listing)
    expect(page).to have_content "Not Applied"
  end
end
