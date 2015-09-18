FactoryGirl.define do

	factory :user do
		username { "#{Faker::Internet.first_name}#{rand(100)}" }
    email { "#{Faker::Internet.email}#{rand(100)}" }
		phone Random.new.rand(1_000_000_000..9_999_999_999)
		password "supersecure"

    factory :invalid_user do
      password "short"
    end

  end


end
