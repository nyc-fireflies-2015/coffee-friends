FactoryGirl.define do 
	factory :menu_item do 
		name {Faker::Commerce.product_name}
		price {Faker::Commerce.price}
	end	
end	