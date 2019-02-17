require 'rails_helper'

describe "Signing in" do
	before do
		User.create({ email: "test@test.com", password: "123123123" })
	end
	
	context "with correct credentials" do
		it "authenticates the user" do
			visit root_url

			click_link "Log In"

			within("#new_user") do
				fill_in "Email", with: "test@test.com"
				fill_in "Password", with: "123123123"
			end

			click_button "Log in"
			expect(page).to have_content "Signed in successfully"
		end
	end
end