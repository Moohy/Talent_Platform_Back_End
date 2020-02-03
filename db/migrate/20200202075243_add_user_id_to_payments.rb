class AddUserIdToPayments < ActiveRecord::Migration[6.0]
  def change
    add_reference :payments, :user#, null: false, foreign_key: true
  end
  # add_index :payments, :user_id, unique: true
end
