class AddRedemptionCodeToCoffeeGifts < ActiveRecord::Migration
  def change
    add_column :coffee_gifts, :redemption_code, :string
  end
end
