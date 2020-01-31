class CreateOffers < ActiveRecord::Migration[6.0]
  def change
    create_table :offers do |t|
      t.float :price
      t.time :time
      t.string :location
      t.string :description

      t.timestamps
    end
  end
end
