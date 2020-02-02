class AddUserIdToServices < ActiveRecord::Migration[6.0]
  def change
    add_reference :services, :user, null: false, foreign_key: true
  end
  add_index :services, :user_id, unique: true
end
