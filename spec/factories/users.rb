FactoryGirl.define do 

	factory :user do 
		username {Faker::Name.name}
		email {Faker::Internet.email}
		phone {Faker::PhoneNumber.phone_number}
		password "supersecure"
	end	

end	