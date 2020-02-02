class CreateRoleUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :role_users do |t|
      t.references :user#, null: false, foreign_key: true
      t.references :role#, null: false, foreign_key: true
    end
    # add_index :role_users, :user
    # add_index :role_users, :role
  end
end
