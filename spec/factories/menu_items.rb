FactoryGirl.define do
  factory :menu_item do
    name {
      ("#{Faker::App.name} #{['Latte', 'Macchiato', 'Espresso', 'Americano', 'Frappe'].sample}")
    }
    price { rand(2..5) + rand().round(2) }

    factory :invalid_menu_item do
      name nil
      price nil
    end
  end
end

