FactoryBot.define do
  factory :user do
    email { "test@test.com" }
    password  { "123123123" }

    factory :user_with_listings do
      transient do
        listings_count { 5 }
      end

      after(:create) do |user, evaluator|
        create_list(:listing, evaluator.listings_count, user: user)
      end
    end
  end
end
