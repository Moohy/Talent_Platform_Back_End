class AdminMigration < ActiveRecord::Migration[6.0]
  def change
    AdminUser.create(username: "admin", email: 'a@a.com', password: '111111')
  end
end
