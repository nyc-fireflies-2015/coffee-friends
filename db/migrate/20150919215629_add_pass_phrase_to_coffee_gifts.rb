class AddPassPhraseToCoffeeGifts < ActiveRecord::Migration
  def change
    add_column :coffee_gifts, :passphrase, :string
  end
end
