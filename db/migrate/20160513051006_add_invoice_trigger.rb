class AddInvoiceTrigger < ActiveRecord::Migration
  def up
    execute <<-SQL
      CREATE OR REPLACE TRIGGER INVOICE BEFORE INSERT ON PAYMENTS
        REFERENCING NEW AS newPay OLD AS oldPay
        FOR EACH ROW
        DECLARE PAGOS NUMBER := 0;
        BEGIN
          SELECT SUM(COST) INTO PAGOS FROM PAYMENTS WHERE USER_ID = :newPay.USER_ID;
          UPDATE CARDS SET INVOICED_AMMOUNT = PAGOS WHERE USER_ID = :newPay.USER_ID;
        END;
    SQL
  end

  def down
    execute <<-SQL
      drop trigger INVOICE
    SQL
  end
end
