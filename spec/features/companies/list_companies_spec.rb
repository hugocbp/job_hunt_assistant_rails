require "rails_helper"

RSpec.describe "Listing companies" do
  let(:user) { FactoryBot.create(:user_with_companies) }
  before(:each) { sign_in user }

  it "shows all the companies" do
    expect(Company.count).to eq 5

    visit companies_path

    expect(page).to have_content user.companies.first.name
    expect(page).to have_content user.companies.last.name
  end
end
