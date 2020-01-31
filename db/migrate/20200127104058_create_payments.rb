class CreatePayments < ActiveRecord::Migration[6.0]
  def change
    create_table :payments do |t|
      t.float :price
      t.time :time
      t.text :reciept_url
      t.string :status
      
      t.timestamps
    end
  end
end
