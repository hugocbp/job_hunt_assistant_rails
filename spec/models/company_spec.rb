require 'rails_helper'

describe Company do
  let(:user) { FactoryBot.build(:user) }
  it 'requires a name' do
    company = user.companies.new(name: '')

    expect(company.valid?).to be_falsy
  end
end
