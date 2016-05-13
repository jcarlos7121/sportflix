class AddStoreProcedure < ActiveRecord::Migration
  def up
    execute <<-SQL
      CREATE OR REPLACE PROCEDURE modify_cost AS
      BEGIN
        UPDATE PAYMENTS SET COST = COST * 1.1 WHERE PAYMENT_DATE IS NULL;
      END;
    SQL
  end

  def down
    execute <<-SQL
      drop procedure modify_cost
    SQL
  end
end
