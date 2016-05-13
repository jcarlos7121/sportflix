class AddOlapsUsersPerMonthPayments < ActiveRecord::Migration
  def up
    execute <<-SQL
    CREATE VIEW OLAP_USER_PAYMENT_MONTHS AS
      select olaps.user_id, count(distinct(olaps.payment_id)) as total_payment, extract(month from payments.created_at) as payment_month
      from olaps join payments on(payments.id = olaps.payment_id) group by olaps.user_id, extract(month from payments.created_at)
    SQL
  end

  def down
    execute <<-SQL
      drop view OLAP_USER_PAYMENT_MONTHS
    SQL
  end
end
