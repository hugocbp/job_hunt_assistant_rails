require "rails_helper"

RSpec.describe "Editing a technology" do
  let(:user) { FactoryBot.create(:user_with_technologies, technologies_count: 1) }
  before(:each) { sign_in user }

  context "with valid data" do
    it "updates the technology and shows the technology list" do
      tech = user.technologies.first

      visit technologies_path

      click_link "Edit"
      expect(current_path).to eq edit_technology_path(tech)

      fill_in "technology_name", with: "New Tech Name"

      click_button "Update Technology"

      expect(current_path).to eq technology_path(tech)
      expect(page).to have_content "New Tech Name"
      expect(page).to have_content "Technology update"
      expect(page).not_to have_content tech.name
    end
  end

  context "with invalid data" do
    it "does not save the changes and display the errors" do
      tech = user.technologies.first
      visit edit_technology_path(tech)

      fill_in "technology_name", with: ""
      click_button "Update Technology"

      expect(page).to have_content "Error!"
    end
  end
end
