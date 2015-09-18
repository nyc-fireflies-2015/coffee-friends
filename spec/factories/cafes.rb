FactoryGirl.define do
  factory :cafe do
    name { Faker::Company.name }
    address {
      "#{Faker::Address.street_address},
      #{Faker::Address.city},
      #{Faker::Address.state_abbr},
      #{Faker::Address.zip}"
    }
    password "password"
    sequence(:username) { |n| "user#{n}" }
    sequence(:email) { |n| "cafe#{n}@example.com" }
  end
end
