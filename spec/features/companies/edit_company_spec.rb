require 'rails_helper'

describe 'Editing a company' do
  let(:user) { FactoryBot.create(:user_with_companies, companies_count: 1) }
  before(:each) { sign_in user }

  context 'with valid data' do
    it 'saves the changes and shows the company' do
      company = user.companies.first

      visit companies_path

      click_link 'Edit'

      expect(current_path).to eq(edit_company_path(company))

      fill_in 'company_name', with: 'New Company Name'
      click_button 'Update Company'

      expect(current_path).to eq(company_path(company))
      expect(page).to have_content "Company updated"
      expect(page).to have_content 'New Company Name'
      expect(page).not_to have_content company.name
    end
  end

  context 'with invalid data' do
    it 'does not save the company and displays error messages' do
      company = user.companies.first
      visit edit_company_path(company)

      fill_in 'company_name', with: ''
      click_button 'Update Company'

      expect(page).to have_content 'Error!'
    end
  end
end