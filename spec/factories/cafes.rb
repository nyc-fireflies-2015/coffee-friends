FactoryGirl.define do
  factory :cafe do
    name { "#{Faker::App.name} Cafe" }
    address {
      "#{Faker::Address.street_address},
      #{Faker::Address.city},
      #{Faker::Address.state_abbr},
      #{Faker::Address.zip}"
    }
    password "password"
    username { Faker::Internet.user_name }
    email { Faker::Internet.email }
  end
end
