require "rails_helper"

RSpec.describe "Show tecnology" do
  let(:technology) { FactoryBot.create(:technology_with_listings) }
  before(:each) { sign_in technology.user }

  it "displays the technology and its listings" do
    expect(technology.requirements.count).to eq 3

    visit technologies_path
    click_link technology.name

    expect(page).to have_content technology.name
    expect(page).to have_content technology.requirements[0].listing.title
  end
end
