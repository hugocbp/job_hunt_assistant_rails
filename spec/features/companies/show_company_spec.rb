require 'rails_helper'

describe 'Showing a company' do
  let(:user) { FactoryBot.create(:user_with_companies, companies_count: 1 )}
  let(:company) { user.companies.first }
  before(:each) { sign_in user }

  it 'links a company from list of companies' do
    visit companies_path

    expect(page).to have_content company.name

    click_link company.name

    expect(current_path).to eq(company_path(company))
  end

  it 'displays the company details' do
    visit company_path(company)

    expect(page).to have_content user.companies.first.name
  end
end