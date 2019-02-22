require "rails_helper"

RSpec.describe "Deleting an account" do
  let!(:user) { FactoryBot.create :user }

  it "deletes the user account" do
    sign_in user

    visit edit_user_registration_path

    click_button "Cancel my account"

    expect(User.count).to eq 0
    expect(current_path).to eq root_path
    expect(page).to have_content "Account deleted"
  end
end
