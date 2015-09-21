class AddCharitableToCoffeeGifts < ActiveRecord::Migration
  def change
  	add_column :coffee_gifts, :charitable, :boolean, default:false
  end
end
