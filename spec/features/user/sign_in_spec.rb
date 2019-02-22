require "rails_helper"

RSpec.describe "Signing in" do
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
      expect(current_path).to eq dashboard_path
      expect(page).to have_content "Signed in"
    end
  end

  context "with incorrect credentials" do
    it "shows error for incorrect email" do
      visit new_user_session_path

      within("#new_user") do
        fill_in "Email", with: "wrong@email.com"
        fill_in "Password", with: "123123123"
      end

      click_button "Log in"

      expect(page).to have_content "Invalid Email or password"
      expect(page).not_to have_content "Signed in"
    end

    it "shows error for incorrect password" do
      visit new_user_session_path

      within("#new_user") do
        fill_in "Email", with: user.email
        fill_in "Password", with: "wrongpassword"
      end

      click_button "Log in"

      expect(page).to have_content "Invalid Email or password"
      expect(page).not_to have_content "Signed in"
    end
  end
end
