class AddSlugToCoffeeGift < ActiveRecord::Migration
  def change
    add_column :coffee_gifts, :slug, :string
  end
end
