class CreateServices < ActiveRecord::Migration[6.0]
  def change
    create_table :services do |t|
      t.string :price_range
      t.string :location
      t.text :description
      # t.references :user, null: false, foreign_key: true

      t.timestamps
    end
    add_index :services, :user
  end
end
