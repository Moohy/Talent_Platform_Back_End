class AdminMigration < ActiveRecord::Migration[6.0]
  def change
    r1=Role.create(title: "seller")
    r2=Role.create(title: "buyer")
    u1=User.create(username: "seller1", email: 's@s.ss', password: '111111')
    u2=User.create(username: "buyer1", email: 'b@b.bb', password: '111111')
    u1.role = r1
    u2.role = r2
  end
end
