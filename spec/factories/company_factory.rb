FactoryBot.define do
  factory :company do
    sequence(:name) { |n| "Test Listing #{n}" }
    user
  end
end
