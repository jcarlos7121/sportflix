class AddLogsToUsersTrigger < ActiveRecord::Migration
  def up
    execute <<-SQL
      CREATE OR REPLACE TRIGGER LOGINS BEFORE UPDATE ON USERS
        REFERENCING NEW AS newLog OLD AS oldLog
        FOR EACH ROW
        WHEN (oldLog.CURRENT_SIGN_IN_AT != newLog.CURRENT_SIGN_IN_AT)
        BEGIN
          :newLog.SIGN_IN_COUNT := :oldLog.SIGN_IN_COUNT + 1;
        END;
    SQL
  end

  def down
    execute <<-SQL
      drop trigger LOGINS
    SQL
  end
end
