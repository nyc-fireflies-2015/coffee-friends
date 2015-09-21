FactoryGirl.define do
  factory :menu_item do
    name {
      ("#{Faker::App.name} #{['Latte', 'Macchiato', 'Espresso', 'Americano', 'Frappe'].sample}")
    }
    price { [2.85, 3.45, 3.95, 3.35, 4.45, 1.75, 2.10, 3.65, 4.65, 2.35].sample }

    factory :invalid_menu_item do
      name nil
      price nil
    end
  end
end

