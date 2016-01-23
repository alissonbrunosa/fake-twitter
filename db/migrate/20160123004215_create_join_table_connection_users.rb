class CreateJoinTableConnectionUsers < ActiveRecord::Migration
  def change
    create_table :user_connections, force: true, id: false do |t|
      t.integer "from_user_id", :null => false
      t.integer "to_user_id", :null => false
    end
    add_index :user_connections, [:from_user_id, :to_user_id]
  end
 
end
