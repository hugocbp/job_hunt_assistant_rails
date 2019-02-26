require "rails_helper"

RSpec.describe Technology do
  let(:tech) { FactoryBot.build(:technology) }

  it "requires a name" do
    tech.name = ""

    expect(tech.valid?).to be_falsy
  end
end
