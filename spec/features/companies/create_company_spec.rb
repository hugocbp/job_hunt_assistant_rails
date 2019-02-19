require 'rails_helper'

describe 'Creating a company' do
  let(:user) { FactoryBot.create(:user) }
  before(:each) { sign_in user }

  context 'with valid data' do
    it 'saves the company and display its details' do
      visit dashboard_path

      click_link "New Company"

      expect(current_path).to eq(new_company_path)

      fill_in 'company_name', with: 'Dummy Company'
      click_button 'Create Company'

      expect(Company.count).to eq 1
      expect(current_path).to eq(company_path(Company.last))
      expect(page).to have_content 'Company created'
      expect(page).to have_content 'Dummy Company'
    end
  end
end