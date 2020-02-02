class CreateProfiles < ActiveRecord::Migration[6.0]
  def change
    create_table :profiles do |t|
      t.string :first_name
      t.string :last_name
      t.string :location
      t.string :image
      t.string :about_me
      t.references :user

      t.timestamps
    end
  end
end
