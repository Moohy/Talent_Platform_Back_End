class CreateRatings < ActiveRecord::Migration[6.0]
  def change
    create_table :ratings do |t|
      t.string :comment
      t.integer :rate

      t.timestamps
    end
  end
end
