class CreatePayments < ActiveRecord::Migration
  def change
    create_table :payments do |t|
      t.belongs_to :user, index: true, foreign_key: true
      t.date :month_reference
      t.date :payment_date
      t.integer :type
      t.float :cost

      t.timestamps null: false
    end
  end
end
