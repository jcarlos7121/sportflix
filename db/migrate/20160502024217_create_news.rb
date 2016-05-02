class CreateNews < ActiveRecord::Migration
  def change
    create_table :news do |t|
      t.string :title
      t.text :text
      t.date :date_publish
      t.belongs_to :admin_user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
