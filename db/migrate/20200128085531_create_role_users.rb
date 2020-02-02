class CreateRoleUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :role_users do |t|
      t.references :user, null: false, foreign_key: true
      t.references :role, null: false, foreign_key: true
    end
    # add_index :role_users, :user_id, unique: true
    # add_index :role_users, :role_id, unique: true
  end
end
