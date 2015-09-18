FactoryGirl.define do
  factory :cafe do
    name "Bluestone Lane"
    address "30 Broad St, New York, NY 10004"
    password "password"
    sequence(:username) { |n| "user#{n}" }
    sequence(:email) { |n| "cafe#{n}@example.com" }
  end
end
