require "rails_helper"

RSpec.describe "Editing a user account" do
  let!(:user) { FactoryBot.create(:user) }

  context "with valid credentials" do
    it "allows the user account to access the edit account page" do
      sign_in user

      visit dashboard_path

      click_link "Account Settings"

      expect(current_path).to eq edit_user_registration_path
    end

    it "allows the user to change the email" do
      sign_in user

      visit edit_user_registration_path

      fill_in "Email", with: "anewemail@email.com"
      fill_in "Current password", with: "123123123"

      click_button "Update"

      expect(page).to have_content "Account updated"
      expect(page).to have_content "anewemail@email.com"
    end

    it "allows the user to change the password" do
      sign_in user

      visit edit_user_registration_path

      fill_in "Password", with: "newpassword"
      fill_in "Password confirmation", with: "newpassword"
      fill_in "Current password", with: "123123123"

      click_button "Update"

      expect(user.reload.valid_password?("123123123")).to be false
      expect(user.reload.valid_password?("newpassword")).to be true
      expect(page).to have_content "Account updated"
    end
  end

  context "with invalid credentials" do
    it "shows error when changing the email" do
      sign_in user

      visit edit_user_registration_path

      fill_in "Email", with: "anewemail@email.com"
      fill_in "Current password", with: "wrongpassword"

      click_button "Update"

      expect(page).to have_content "Current password is invalid"
    end

    it "shows error when changing the password" do
      sign_in user

      visit edit_user_registration_path

      fill_in "Password", with: "newpassword"
      fill_in "Password confirmation", with: "newpassword"
      fill_in "Current password", with: "wrongpassword"

      click_button "Update"

      expect(user.reload.valid_password?("123123123")).to be true
      expect(user.reload.valid_password?("newpassword")).to be false
      expect(page).to have_content "Current password is invalid"
    end

    it "shows error with mismatched new password" do
      sign_in user

      visit edit_user_registration_path

      fill_in "Password", with: "newpassword"
      fill_in "Password confirmation", with: "newpasswordtypo"
      fill_in "Current password", with: "123123123"

      click_button "Update"

      expect(user.reload.valid_password?("123123123")).to be true
      expect(user.reload.valid_password?("newpassword")).to be false
      expect(page).to have_content "Password confirmation doesn't match"
    end
  end
end
