class AddUserIdToHomes < ActiveRecord::Migration[6.0]
  def change
    add_column :homes, :user_id, :integer
    add_index :homes, :user_id
  end
end
