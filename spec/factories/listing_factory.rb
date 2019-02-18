FactoryBot.define do
  factory :listing do
    sequence(:title) { |n| "Test Listing #{n}" }
    sequence(:company) { |n| "Company #{n}" }
    sequence(:description) { |n| "Some description #{n}" }
    user
  end
end