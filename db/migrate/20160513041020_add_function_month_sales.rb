class AddFunctionMonthSales < ActiveRecord::Migration
  def up
    execute <<-SQL
      CREATE OR REPLACE FUNCTION
        getVENTAS (MES NUMBER)
          RETURN NUMBER
          IS
          COBROS NUMBER;
        BEGIN
            SELECT SUM(COST) INTO COBROS FROM PAYMENTS WHERE EXTRACT(MONTH FROM PAYMENT_DATE) = MES;
            RETURN COBROS;
        END;
    SQL
  end

  def down
    execute <<-SQL
      drop function card_number
    SQL
  end
end
