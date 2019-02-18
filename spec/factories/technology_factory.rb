FactoryBot.define do
  factory :technology do
    sequence(:name) { |n| "Tech #{n}" }
    user
  end
end