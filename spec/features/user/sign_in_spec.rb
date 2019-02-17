require 'rails_helper'

describe "Signing in" do
  let(:user) { FactoryBot.create(:user) }

  context "with correct credentials" do
    it "authenticates the user" do
      visit root_url

      click_link "Log In"

      within("#new_user") do
        fill_in "Email", with: user.email
        fill_in "Password", with: user.password
      end

      click_button "Log in"
      expect(page).to have_content "Signed in successfully"
    end
  end
end
