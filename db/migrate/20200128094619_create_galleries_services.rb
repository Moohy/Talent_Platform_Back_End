class CreateGalleriesServices < ActiveRecord::Migration[6.0]
  def change
    create_table :catrgories_services, id: false do |t|
      t.references :service, null: false, foreign_key: true
      t.references :category, null: false, foreign_key: true
    end
    add_index :catrgories_services, :service
    add_index :catrgories_services, :category
  end
end
