FactoryGirl.define do

	factory :user do
		username {Faker::Name.first_name}
		email {Faker::Internet.email}
		phone Random.new.rand(1_000_000_000..9_999_999_999)
		password "supersecure"


    factory :invalid_user do
      password "short"
    end

  end


end
