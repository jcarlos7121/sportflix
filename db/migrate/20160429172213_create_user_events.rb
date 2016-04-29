class CreateUserEvents < ActiveRecord::Migration
  def change
    create_table :user_events do |t|
      t.belongs_to :user, index: true
      t.belongs_to :event, index: true
      t.timestamp :timestamp

      t.timestamps null: false
    end
  end
end
