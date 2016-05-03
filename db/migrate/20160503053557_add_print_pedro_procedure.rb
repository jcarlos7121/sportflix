class AddPrintPedroProcedure < ActiveRecord::Migration
  def up
    execute <<-SQL
      CREATE OR REPLACE PROCEDURE delete_card_procedure( c_card_id NUMBER) AS
      BEGIN
        DELETE FROM CARDS where cards.id = c_card_id;
      END;
    SQL
  end

  def down
    execute <<-SQL
      drop procedure delete_card_procedure
    SQL
  end
end
