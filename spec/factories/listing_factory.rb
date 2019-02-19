FactoryBot.define do
  factory :listing do
    sequence(:title) { |n| "Test Listing #{n}" }
    sequence(:company) { |n| "Company #{n}" }
    sequence(:description) { |n| "Some description #{n}" }
    user
  end

  factory :listing_with_technologies, parent: :listing do |listing|
    technologies { build_list :technology, 3 }
  end
end