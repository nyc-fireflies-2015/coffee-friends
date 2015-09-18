class AddMessageToCoffeeGifts < ActiveRecord::Migration
  def change
  	add_column :coffee_gifts, :message, :text
  end
end
