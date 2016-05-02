class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.belongs_to :category, index: true, foreign_key: true
      t.string :name
      t.integer :type
      t.datetime :event_time
      t.string :url_service

      t.timestamps null: false
    end
  end
end
