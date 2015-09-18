FactoryGirl.define do
  factory :cafe do
    name "Bluestone Lane"
    address "30 Broad St, New York, NY 10004"
    password "password"

    sequence :username do |n|
      "user#{n}"
    end

    sequence :email do |n|
      "cafe#{n}@example.com"
    end

    factory(:invalid_cafe) do
        username nil
        email nil
    end
  end
end
