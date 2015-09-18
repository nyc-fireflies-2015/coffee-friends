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
    username { "#{Faker::Internet.user_name}#{Time.now.to_i}#{rand(100)}" }
    email { "#{Faker::Internet.email}#{Time.now.to_i}#{rand(100)}" }
  end
end
