class AddSlugToCafe < ActiveRecord::Migration
  def change
    add_column :cafes, :slug, :string
  end
end
