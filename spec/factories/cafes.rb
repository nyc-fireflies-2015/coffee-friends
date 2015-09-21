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
    email { Faker::Internet.email }
    neighborhood {Faker::Address.city}
    borough {Faker::Address.city}
  end
end
