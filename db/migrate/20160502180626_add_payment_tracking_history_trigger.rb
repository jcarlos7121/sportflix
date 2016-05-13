class AddPaymentTrackingHistoryTrigger < ActiveRecord::Migration
  TRIGGER_NAME = 'paymentTracking'

  def up
    execute <<-SQL
      create or replace trigger #{TRIGGER_NAME}
      before update on PAYMENTS
      for each row
      declare
      new_id payment_histories.id%type;
      begin
        SELECT PAYMENT_HISTORIES_SEQ.NEXTVAL
          INTO   new_id
          FROM   dual;
        INSERT INTO PAYMENT_HISTORIES(id, PAYMENT_ID, CREATED_AT, UPDATED_AT) values(new_id, :new.ID, SYSDATE, SYSDATE);
        end;
    SQL
  end

  def down
    execute <<-SQL
      drop trigger #{TRIGGER_NAME}
    SQL
  end
end
