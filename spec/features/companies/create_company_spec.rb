require "rails_helper"

describe "Creating a company" do
  let(:user) { FactoryBot.create(:user) }
  before(:each) do
    sign_in user
    stub_request(:get, "https://www.google.com/search?q=dummy%20company%20vancouver%20glassdoor").
      with(headers: { "Accept" => "*/*", "User-Agent" => "Ruby" }).
      to_return(status: 200, body: "<div>Rating: 4.4</div>", headers: {})
  end

  context "with valid data" do
    it "saves the company and display its details" do
      visit dashboard_path

      click_link "New Company"

      expect(current_path).to eq(new_company_path)

      fill_in "company_name", with: "Dummy Company"
      fill_in "company_address", with: "123 Highway Ave"
      click_button "Create Company"

      expect(Company.count).to eq 1
      expect(current_path).to eq(company_path(Company.last))
      expect(page).to have_content "Company created"
      expect(page).to have_content "Dummy Company"
      expect(page).to have_content "123 Highway Ave"
    end
  end

  context "with invalid data" do
    it "does not save if the company is invalid" do
      visit new_company_path

      expect { click_button "Create Company" }.not_to change(Company, :count)
      expect(page).to have_content("Error!")
    end
  end
end
