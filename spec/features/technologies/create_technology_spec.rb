require "rails_helper"

describe "Creating a new technology" do
  let(:user) { FactoryBot.create(:user) }
  before(:each) { sign_in user }

  context "with valid data" do
    it "saves the new technolgy and display all technologies" do
      visit technologies_url

      click_link "New Technology"
      expect(current_path).to eq new_technology_path

      fill_in "technology_name", with: "React"
      click_button "Create Technology"

      expect(current_path).to eq technology_path(Technology.last)
      expect(page).to have_content "React"
    end
  end

  context "with invalid data" do
    it "does not create the technology and displays errors" do
      visit new_technology_path

      expect { click_button "Create Technology" }.not_to change(Technology, :count)
      expect(page).to have_content("Error!")
    end
  end
end
