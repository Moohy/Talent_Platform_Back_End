class CreateBanks < ActiveRecord::Migration[6.0]
  def change
    create_table :banks do |t|
      t.string :iban
      t.string :bank_name
      t.string :full_name
      t.references :user

      t.timestamps
    end
  end
end
