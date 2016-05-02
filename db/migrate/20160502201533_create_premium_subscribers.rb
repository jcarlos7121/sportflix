class CreatePremiumSubscribers < ActiveRecord::Migration
  VIEW_NAME = 'subscribersSummary'

  def up
    execute <<-SQL
      CREATE VIEW #{VIEW_NAME} AS
        SELECT USERS.ID, NAME, SUM(PAYMENTS.COST) AS AMMOUNT_PAYED FROM
          USERS JOIN PAYMENTS ON (USERS.ID = PAYMENTS.USER_ID) GROUP BY USERS.ID, USERS.NAME
    SQL
  end

  def down
    execute <<-SQL
      drop view #{VIEW_NAME}
    SQL
  end
end
