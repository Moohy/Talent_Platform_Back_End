class AddUserIdToOffers < ActiveRecord::Migration[6.0]
  def change
    add_reference :offers, :user, null: false, foreign_key: true
  end
  # add_index :offers, :user_id, unique: true
end
