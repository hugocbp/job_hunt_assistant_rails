FactoryBot.define do
  factory :company do
    sequence(:name) { |n| "Test Listing #{n}" }
    user
  end

  factory :company_with_listings, parent: :company do |company|
    listings { build_list :listing, 3 }
  end
end
