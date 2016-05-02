class LimitPaymentsCharge < ActiveRecord::Migration
  TRIGGER_NAME = 'limitPayment'

  def up
    execute <<-SQL
      create or replace trigger #{TRIGGER_NAME}
      before update on payments
      for each row
      when(new.cost > 100.0)
      begin
        RAISE_APPLICATION_ERROR(-20101, 'Cannot generate payment bigger than 100 dollars');
      end;
    SQL
  end

  def down
    execute <<-SQL
      drop trigger #{TRIGGER_NAME}
    SQL
  end
end
