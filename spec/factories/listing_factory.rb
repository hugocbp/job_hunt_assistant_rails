FactoryBot.define do
  factory :listing do
    sequence(:title) { |n| "Test Listing #{n}" }
    sequence(:company) { |n| "Company #{n}" }
    sequence(:description) { |n| "Some description #{n}" }
    technologies { "Ruby on Rails, React" }
    user
  end
end