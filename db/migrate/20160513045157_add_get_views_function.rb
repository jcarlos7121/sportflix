class AddGetViewsFunction < ActiveRecord::Migration
  def up
    execute <<-SQL
      CREATE OR REPLACE FUNCTION
      getVIEWS (MES NUMBER)
        RETURN NUMBER
        IS
        VISTAS NUMBER;
      BEGIN
          SELECT COUNT(USER_ID) INTO VISTAS FROM USER_EVENTS WHERE EXTRACT(MONTH FROM CREATED_AT) = MES;
          RETURN VISTAS;
      END;
    SQL
  end

  def down
    execute <<-SQL
      drop trigger getVIEWS
    SQL
  end
end
