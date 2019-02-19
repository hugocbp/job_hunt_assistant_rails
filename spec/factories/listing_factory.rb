FactoryBot.define do
  factory :listing do
    sequence(:title) { |n| "Test Listing #{n}" }
    sequence(:description) { |n| "Some description #{n}" }
    company
    user { company.user }
  end

  factory :listing_with_technologies, parent: :listing do
    requirements { build_list :requirement, 3 }
  end
end