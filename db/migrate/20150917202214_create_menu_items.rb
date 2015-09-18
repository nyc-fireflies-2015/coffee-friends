class CreateMenuItems < ActiveRecord::Migration
  def change
    create_table :menu_items do |t|
    	t.references :cafe
    	t.string :name, null:false, limit:30
    	t.float :price, null:false
      t.timestamps
    end
  end
end
