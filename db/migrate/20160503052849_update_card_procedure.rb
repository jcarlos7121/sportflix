class UpdateCardProcedure < ActiveRecord::Migration
  def up
    execute <<-SQL
      CREATE OR REPLACE PROCEDURE update_card_procedure(
        c_cvv IN VARCHAR2, c_expiration_date IN VARCHAR2, c_card_number in VARCHAR2, c_card_id NUMBER
      ) AS
      BEGIN
        UPDATE CARDS SET cvv = c_cvv, expiration_date = c_expiration_date, card_number = c_card_number where cards.id = c_card_id;
      END;
    SQL
  end

  def down
    execute <<-SQL
      drop procedure update_card_procedure
    SQL
  end
end
