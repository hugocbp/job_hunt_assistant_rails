require 'rails_helper'

describe Company do
  let(:user) { FactoryBot.build(:user) }
  let(:company_with_listings) { FactoryBot.build(:company_with_listings) }

  it 'requires a name' do
    company = user.companies.new(name: '')

    expect(company.valid?).to be_falsy
  end

  it 'has many listings' do
    expect(company_with_listings.listings.size).to eq 3
  end
end
