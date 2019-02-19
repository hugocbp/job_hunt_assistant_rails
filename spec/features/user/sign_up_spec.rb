require 'rails_helper'

describe "Signing up" do
	context "with correct credentials" do
		it 'creates a new user' do
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
end