FactoryGirl.define do
  factory :menu_item do
    name {
      ["Pumpkin Spice Latte", "Americano", "Flat White", "Cinniamon Dolce Latte", "Green Tea Latte", "Cappucino", "Cold Brew"].sample
    }
    price { Faker::Commerce.price }

    factory :invalid_menu_item do
      name nil
      price nil
    end
  end
end

