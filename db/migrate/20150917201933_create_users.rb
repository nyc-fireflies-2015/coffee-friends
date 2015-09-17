class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
    	t.string :username, null:false, limit:20
    	t.string :email, null:false, limit:50
    	t.string :phone, null:false
    	t.string :password_digest, null:false
      t.timestamps
    end
  end
end
