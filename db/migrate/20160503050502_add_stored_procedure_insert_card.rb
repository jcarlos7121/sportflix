class AddStoredProcedureInsertCard < ActiveRecord::Migration
  # TODO NF
  def up
    execute <<-SQL
      CREATE OR REPLACE PROCEDURE insert_into_card(
        c_cvv IN VARCHAR2, c_expiration_date IN VARCHAR2, c_card_number in VARCHAR2, c_user_id NUMBER
      ) AS
      BEGIN
        INSERT INTO cards(user_id, cvv, expiration_date, card_number, created_at, updated_at) values (c_user_id, c_cvv, c_expiration_date, c_card_number, TO_DATE('2016-05-02 04:21:52','YYYY-MM-DD HH24:MI:SS'), TO_DATE('2016-05-02 04:21:52','YYYY-MM-DD HH24:MI:SS'));
      END;
    SQL
  end

  def down
    execute <<-SQL
      drop procedure insert_into_card
    SQL
  end
end
