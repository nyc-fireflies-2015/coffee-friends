class RemovePassPhraseFromCoffeeGifts < ActiveRecord::Migration
  def change
    remove_column :coffee_gifts, :passphrase, :string
  end
end
