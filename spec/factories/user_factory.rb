FactoryBot.define do
  factory :user do
    email { "test@test.com" }
    password  { "123123123" }

    # factory :user_with_listings do
    #   transient do
    #     listings_count { 5 }
    #   end

    #   after(:create) do | evaluator|
    #     create_list(:listing, evaluator.listings_count)
    #   end
    # end
    factory :user_with_listings, parent: :user do
      listings { build_list :listing, 3 }
    end

    factory :user_with_technologies do
      transient do
        technologies_count { 5 }
      end

      after(:create) do |user, evaluator|
        create_list(:technology, evaluator.technologies_count, user: user)
      end
    end

    factory :user_with_companies do
      transient do
        companies_count { 5 }
      end

      after(:create) do |user, evaluator|
        create_list(:company, evaluator.companies_count, user: user)
      end
    end    
  end
end
