require "rails_helper"

RSpec.describe "The root path" do
  it "renders the landing page" do
    visit root_url

    expect(page).to have_content "Your personal assistant"
  end
end
