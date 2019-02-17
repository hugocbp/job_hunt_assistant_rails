require 'rails_helper'

describe 'Signing out' do
	let(:user) { FactoryBot.create(:user) }
	
	it 'signs out the user' do
		sign_in user
		visit root_path

		expect(page).to have_content user.email

		click_link "Sign out"

		expect(page).to have_content "Log In"
		expect(page).not_to have_content user.email
	end
end