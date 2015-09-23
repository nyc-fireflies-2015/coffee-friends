class AddSlugToMenuItem < ActiveRecord::Migration
  def change
    add_column :menu_items, :slug, :string
  end
end
