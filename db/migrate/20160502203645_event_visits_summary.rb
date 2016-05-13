class EventVisitsSummary < ActiveRecord::Migration
  VIEW_NAME = 'EVENT_VISIT_SUMMARIES'

  def up
    execute <<-SQL
      CREATE VIEW #{VIEW_NAME} AS
        SELECT EVENTS.ID, EVENTS.NAME, COUNT(USER_EVENTS.USER_ID) AS VISIT_COUNT FROM USER_EVENTS
          JOIN EVENTS ON (USER_EVENTS.EVENT_ID = EVENTS.ID) GROUP BY EVENTS.ID, EVENTS.NAME
    SQL
  end

  def down
    execute <<-SQL
      drop view #{VIEW_NAME}
    SQL
  end
end
