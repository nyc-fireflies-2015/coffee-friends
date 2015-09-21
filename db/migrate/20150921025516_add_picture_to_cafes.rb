class AddPictureToCafes < ActiveRecord::Migration
  def change
    add_column :cafes, :picture, :string
  end
end
