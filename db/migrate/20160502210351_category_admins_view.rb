class CategoryAdminsView < ActiveRecord::Migration
  VIEW_NAME = 'adminCategoryView'

  def up
    execute <<-SQL
      CREATE VIEW #{VIEW_NAME} AS
        SELECT admin_users.id, admin_users.email, categories.name from admin_users
          join categories on (admin_users.id = categories.admin_user_id)
          group by admin_users.id, admin_users.email, categories.name
    SQL
  end

  def down
    execute <<-SQL
      drop view #{VIEW_NAME}
    SQL
  end
end
