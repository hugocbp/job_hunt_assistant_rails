require "rails_helper"

RSpec.describe "The navigation" do
  let(:user) { FactoryBot.create(:user) }
  before(:each) { sign_in user }

  it "allows a user to list all listings" do
    visit dashboard_path

    click_link "Listings"

    expect(current_path).to eq(listings_path)
  end

  it "allows a user to list all technologies" do
    visit dashboard_path

    click_link "Technologies"

    expect(current_path).to eq(technologies_path)
  end

  it "allows a user to list all companies" do
    visit dashboard_path

    click_link "Companies"

    expect(current_path).to eq(companies_path)
  end

  it "redirects a logged user to dashboard from landing page" do
    visit root_path

    expect(current_path).to eq(dashboard_path)
  end
end
