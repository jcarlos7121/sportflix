class AddedOlapViewEventsPerUser < ActiveRecord::Migration
  def up
    execute <<-SQL
    CREATE VIEW OLAP_USER_PAYMENTS AS
      SELECT USER_ID as user_id, COUNT(DISTINCT(PAYMENT_ID)) AS total_payment FROM OLAPS GROUP BY USER_ID
    SQL
  end

  def down
    execute <<-SQL
      drop view OLAP_USER_PAYMENTS
    SQL
  end
end
