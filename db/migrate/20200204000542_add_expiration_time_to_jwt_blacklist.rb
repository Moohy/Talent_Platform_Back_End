class AddExpirationTimeToJwtBlacklist < ActiveRecord::Migration[6.0]
  def change
    add_column :jwt_blacklist, :exp, :datetime
    change_column_null :jwt_blacklist, :exp, false
  end
end
