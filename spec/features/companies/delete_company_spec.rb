require 'rails_helper'

describe 'Deleting a company' do
  let(:user) { FactoryBot.create(:user_with_companies, companies_count: 1) }
  before(:each) { sign_in user }

  it 'destroys the company and displays the company list' do
    expect(Company.count).to eq 1
    company = Company.last

    visit companies_path

    click_link 'Delete'

    expect(current_path).to eq(companies_path)
    expect(page).to have_content "Company deleted"
    expect(page).not_to have_content company.name
    expect(Company.count).to eq 0
  end
end