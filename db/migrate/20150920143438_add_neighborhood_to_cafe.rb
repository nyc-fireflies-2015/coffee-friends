class AddNeighborhoodToCafe < ActiveRecord::Migration
  def change
    add_column :cafes, :neighborhood, :string
  end
end
