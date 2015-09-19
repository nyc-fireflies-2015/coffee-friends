class AddPhoneToCoffeeGifts < ActiveRecord::Migration
  def change
  	add_column :coffee_gifts, :phone, :string
  end
end
