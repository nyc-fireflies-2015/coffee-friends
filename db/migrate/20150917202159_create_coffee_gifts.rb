class CreateCoffeeGifts < ActiveRecord::Migration
  def change
    create_table :coffee_gifts do |t|
    	t.references :giver
    	t.references :receiver
    	t.references :menu_item
    	t.boolean :redeemed, default: false
    	t.boolean :charitable, default: false
    	t.text :message
    	t.string :phone
    	t.string :redemption_code
      t.timestamps
    end
  end
end
