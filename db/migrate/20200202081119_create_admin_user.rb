class CreateAdminUser < ActiveRecord::Migration[6.0]
  def change
    AdminUser.create(email: 'a@a.aa', password: '111111')
  end
end
