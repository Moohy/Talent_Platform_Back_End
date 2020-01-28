class CreateGalleries < ActiveRecord::Migration[6.0]
  def change
    create_table :galleries do |t|
      t.text :url
      t.references :service

      t.timestamps
    end
  end
end
