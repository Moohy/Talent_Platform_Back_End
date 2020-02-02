class CreatePayments < ActiveRecord::Migration[6.0]
  def change
    create_table :payments do |t|
      t.float :price
      t.time :time
      t.text :reciept_url
      t.string :status
      t.references :offer, null: false, foreign_key: true
      # t.references :user, null: false, foreign_key: true

      t.timestamps
    end
    add_index :payments, :offer
    # add_index :payments, :user
  end
end
