FactoryGirl.define do

	factory :user do
		first_name {Faker::Name.first_name}
    last_name {Faker::Name.last_name}
		email {Faker::Internet.email}
		phone Random.new.rand(1_000_000_000..9_999_999_999)
		password "supersecure"


    factory :invalid_user do
      password "short"
    end

    factory :twilio_receiver do
    	phone "2532377845"
    end

  end

end
