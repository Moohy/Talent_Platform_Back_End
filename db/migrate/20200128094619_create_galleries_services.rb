class CreateGalleriesServices < ActiveRecord::Migration[6.0]
  def change
    create_table :category_services do |t|
      t.references :service, null: false, foreign_key: true
      t.references :category, null: false, foreign_key: true
    end
    # add_index :category_services, :service_id, unique: true
    # add_index :category_services, :category_id, unique: true
  end
end
