class CreateJoinTableRoleUser < ActiveRecord::Migration[6.0]
  def change
    # create_table :roles_users do |t|
    #   t.references :city, index: true, foreign_key: true
    #   t.references :cleaner, index: true, foreign_key: true

    #   t.timestamps null: false
    # end
    # create_join_table :roles, :users do |t|
    #   # t.index [:role_id, :user_id]
    #   # t.index [:user_id, :role_id]
    #   t.index :role_id
    #   t.index :user_id
    # end
  end
end
