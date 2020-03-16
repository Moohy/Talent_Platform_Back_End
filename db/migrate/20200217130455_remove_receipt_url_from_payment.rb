class RemoveReceiptUrlFromPayment < ActiveRecord::Migration[6.0]
  def change
    remove_column :payments, :reciept_url
  end
end
