require 'rails_helper'

describe 'A listing' do
  let(:listing) { FactoryBot.build(:listing) }
  
  it 'requires a title' do
    listing.title = ""
    expect(listing.valid?).to be_falsey
  end

  it 'requires a company' do
    listing.company = ""
    expect(listing.valid?).to be_falsey
  end
end