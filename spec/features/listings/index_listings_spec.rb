require "rails_helper"

RSpec.describe "Listing#index" do
  let(:user) { FactoryBot.create(:user_with_listings) }

  it "shows all listings for the user" do
    sign_in user

    visit listings_path

    expect(Listing.all.size).to eq 3
    expect(page).to have_content(user.listings[0].title)
    expect(page).to have_content(user.listings[0].company.name)
    expect(page).to have_content(user.listings[0].description)
    expect(page).to have_content(user.listings[1].title)
    expect(page).to have_content(user.listings[2].title)
  end

  it "links to the individual listing" do
    listing = user.listings[0]

    sign_in user

    visit listings_path

    expect(page).to have_content listing.title

    click_link listing.title
    expect(page).to have_content listing.title
    expect(page).not_to have_content user.listings[1].title
  end
end
