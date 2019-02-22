require "rails_helper"

RSpec.describe "Signing up" do
  context "with correct credentials" do
    it "creates a new user" do
      visit root_path

      expect(page).to have_content "Sign Up"

      click_link "Sign Up"

      within("#new_user") do
        fill_in "Email", with: "test@test.com"
        fill_in "Password", with: "123123123"
        fill_in "Password confirmation", with: "123123123"
      end

      click_button "Sign up"
      expect(page).to have_content "Account created"
    end
  end

  context "with incorrect credentials" do
    it "show error with blank email" do
      visit new_user_registration_path

      within("#new_user") do
        fill_in "Email", with: ""
        fill_in "Password", with: "123123123"
        fill_in "Password confirmation", with: "123123123"
      end

      click_button "Sign up"

      expect(page).to have_content "Email can't be blank"
    end

    it "show error with invalid email" do
      visit new_user_registration_path

      within("#new_user") do
        fill_in "Email", with: "some@random"
        fill_in "Password", with: "123123123"
        fill_in "Password confirmation", with: "123123123"
      end

      click_button "Sign up"

      expect(page).to have_content "Email is invalid"
    end

    it "show error with empty password" do
      visit new_user_registration_path

      within("#new_user") do
        fill_in "Email", with: "text@example.com"
        fill_in "Password", with: ""
        fill_in "Password confirmation", with: ""
      end

      click_button "Sign up"

      expect(page).to have_content "Password can't be blank"
    end

    it "show error with too short password" do
      visit new_user_registration_path

      within("#new_user") do
        fill_in "Email", with: "text@example.com"
        fill_in "Password", with: "123"
        fill_in "Password confirmation", with: "123"
      end

      click_button "Sign up"

      expect(page).to have_content "Password is too short"
    end

    it "show error with unmatched passwords" do
      visit new_user_registration_path

      within("#new_user") do
        fill_in "Email", with: "text@example.com"
        fill_in "Password", with: "123123123"
        fill_in "Password confirmation", with: "321321321"
      end

      click_button "Sign up"

      expect(page).to have_content "Password confirmation doesn't match"
    end
  end
end
