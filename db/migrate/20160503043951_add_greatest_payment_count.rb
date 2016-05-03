class AddGreatestPaymentCount < ActiveRecord::Migration
  def up
    execute <<-SQL
      CREATE OR REPLACE FUNCTION max_pay_count RETURN NUMBER IS
        max_payment_count number;
        BEGIN
          select max(payment_count) into max_payment_count from (
            select users.id, users.name, count(payments.id) as payment_count from users join payments on (users.id = payments.user_id) group by users.id, users.name
          );
          return max_payment_count;
        END;
    SQL
  end

  def down
    execute <<-SQL
      drop function max_pay_count
    SQL
  end
end
