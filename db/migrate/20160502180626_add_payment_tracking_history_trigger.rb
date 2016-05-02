class AddPaymentTrackingHistoryTrigger < ActiveRecord::Migration
  TRIGGER_NAME = 'paymentTracking'

  def up
    execute <<-SQL
      create or replace trigger #{TRIGGER_NAME}
      after update on payments
      for each row
      begin
        INSERT INTO PAYMENT_HISTORIES(payment_id) values(:new.id)
      end;
    SQL
  end

  def down
    execute <<-SQL
      drop trigger #{TRIGGER_NAME}
    SQL
  end
end
