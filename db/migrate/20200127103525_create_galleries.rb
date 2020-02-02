class CreateGalleries < ActiveRecord::Migration[6.0]
  def change
    create_table :galleries do |t|
      t.text :url
      t.references :service, null: false, foreign_key: true

      t.timestamps
    end
    # add_index :galleries, :service_id, unique: true
  end
end
