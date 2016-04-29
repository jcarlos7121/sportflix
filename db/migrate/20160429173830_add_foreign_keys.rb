class AddForeignKeys < ActiveRecord::Migration
  def change
    add_foreign_key(:payments, :users)
    add_foreign_key(:user_events, :events)
    add_foreign_key(:user_events, :users)
  end
end
