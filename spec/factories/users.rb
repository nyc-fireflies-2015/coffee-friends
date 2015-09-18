FactoryGirl.define do 

	factory :user do 
		username {Faker::Name.first_name}
		email {Faker::Internet.email}
		phone Random.new.rand(1_000_000_000..9_999_999_999).to_s
		password "supersecure"

		factory :valid_phone_user do 
			phone "+12545677654"
		end	
	end	

end	