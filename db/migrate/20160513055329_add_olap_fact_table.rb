class AddOlapFactTable < ActiveRecord::Migration
  def up
    execute <<-SQL
    CREATE VIEW OLAPS AS
      SELECT u.ID as USER_ID, p.ID as PAYMENT_ID, e.EVENT_ID as EVENT_ID FROM PAYMENTS p
      JOIN USERS u ON u.ID = p.USER_ID
      JOIN USER_EVENTS e ON u.ID = e.USER_ID
    SQL
  end

  def down
    execute <<-SQL
      drop view olaps
    SQL
  end
end
