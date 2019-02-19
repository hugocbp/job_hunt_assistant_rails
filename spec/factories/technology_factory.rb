FactoryBot.define do
  factory :technology do
    sequence(:name) { |n| "Tech #{n}" }
    user
  end

  factory :technology_with_listings, parent: :technology do
    requirements { build_list :requirement, 3 }
  end
end