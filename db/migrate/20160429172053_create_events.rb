class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.belongs_to :category, index: true
      t.datetime :event_time

      t.timestamps null: false
    end
  end
end
