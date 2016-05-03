class AddUserSubscriptionTypeFunction < ActiveRecord::Migration
  def up
    execute <<-SQL
      CREATE OR REPLACE FUNCTION subscription_type(v1 number) RETURN VARCHAR2 IS
        BEGIN
          IF v1 = 0 THEN
            RETURN 'trial';
          ELSIF v1 = 1 THEN
            RETURN 'premium';
          ELSIF v1 = 2 THEN
            RETURN 'home_premium';
          ELSIF v1 = 3 THEN
            RETURN 'home_premium_hd';
          ELSE
            RETURN 'non_existent';
          END IF;
        END;
    SQL
  end

  def down
    execute <<-SQL
      drop function subscription_type
    SQL
  end
end
