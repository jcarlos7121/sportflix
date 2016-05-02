class UpgradePaymentType < ActiveRecord::Migration
  TRIGGER_NAME = 'typeChangePay'

  def up
    execute <<-SQL
      create or replace trigger #{TRIGGER_NAME}
      before update on payments
      for each row
      when(old.payment_type = 0 and new.payment_type = 1)
      begin
        :new.salary := :9.9;
      end;
    SQL
  end

  def down
    execute <<-SQL
      drop trigger #{TRIGGER_NAME}
    SQL
  end
end
