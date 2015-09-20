class AddBoroughToCafe < ActiveRecord::Migration
  def change
    add_column :cafes, :borough, :string
  end
end
