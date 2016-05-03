class AddFunctionGetCardNumberCount < ActiveRecord::Migration
  def up
    execute <<-SQL
      CREATE OR REPLACE FUNCTION card_number(user_identifier NUMBER) RETURN NUMBER IS
        card_number_count number;
        BEGIN
          select count(cards.user_id) into card_number_count from cards join users on (users.id = cards.user_id) 
            where users.id = user_identifier;

          return card_number_count;
        END;
    SQL
  end

  def down
    execute <<-SQL
      drop function card_number
    SQL
  end
end
