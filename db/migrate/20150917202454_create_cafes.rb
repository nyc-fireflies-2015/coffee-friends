class CreateCafes < ActiveRecord::Migration
  def change
    create_table :cafes do |t|
    	t.string :username, null:false, limit:20
    	t.string :email, null:false, limit:50
    	t.string :name, null:false, limit:50
    	t.string :address, null:false, limit:150
    	t.string :password_digest, null:false
      t.timestamps
    end
  end
end
