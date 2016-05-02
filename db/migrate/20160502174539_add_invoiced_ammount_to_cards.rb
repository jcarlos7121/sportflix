class AddInvoicedAmmountToCards < ActiveRecord::Migration
  def change
    add_column :cards, :invoiced_ammount, :float
  end
end
