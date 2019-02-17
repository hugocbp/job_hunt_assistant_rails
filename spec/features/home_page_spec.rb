require 'rails_helper'

describe 'Visiting the home page' do
	it 'loads the landing page' do
		visit root_url

		expect(page).to have_content "Your personal assistant"
	end
end