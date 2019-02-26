require "rails_helper"

RSpec.describe "Editing a company" do
  let(:user) { FactoryBot.create(:user_with_companies, companies_count: 1) }
  before(:each) { sign_in user }

  context "with valid data" do
    it "saves the changes and shows the company" do
      stub_request(:get, "https://www.google.com/search?q=new%20company%20name%20vancouver%20glassdoor").
        with(headers: { "Accept" => "*/*", "User-Agent" => "Ruby" }).
        to_return(status: 200, body: "", headers: {})

      company = user.companies.first

      visit companies_path

      click_link "Edit"

      expect(current_path).to eq(edit_company_path(company))

      fill_in "company_name", with: "New Company Name"
      fill_in "company_address", with: "New Company Address"
      fill_in "company_user_glassdoor_rate", with: 4.5
      click_button "Update Company"

      expect(current_path).to eq(company_path(company))
      expect(page).to have_content "Company updated"
      expect(page).to have_content "New Company Name"
      expect(page).to have_content "New Company Address"
      expect(page).to have_content "4.5"
      expect(page).not_to have_content company.name
    end
  end

  context "with invalid data" do
    it "does not save the company and displays error messages" do
      company = user.companies.first
      visit edit_company_path(company)

      fill_in "company_name", with: ""
      click_button "Update Company"

      expect(page).to have_content "Error!"
    end
  end
end
