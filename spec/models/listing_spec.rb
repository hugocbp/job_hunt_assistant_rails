require "rails_helper"

RSpec.describe "A listing" do
  let(:listing) { FactoryBot.build(:listing) }

  it "requires a title" do
    listing.title = ""
    expect(listing.valid?).to be_falsey
  end

  it "requires a company" do
    listing.company = nil
    expect(listing.valid?).to be_falsey
  end
end
