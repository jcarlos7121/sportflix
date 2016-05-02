class CreateCards < ActiveRecord::Migration
  def change
    create_table :cards do |t|
      t.belongs_to :user, index: true, foreign_key: true
      t.string :cvv
      t.string :expiration_date
      t.string :card_number

      t.timestamps null: false
    end
  end
end
