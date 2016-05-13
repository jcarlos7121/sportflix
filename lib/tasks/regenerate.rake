namespace :regenerate do
  desc "TODO"
  task id: :environment do
    ActiveRecord::Base.connection.tables.each do |table|
      unless table == 'schema_migrations' || table == 'user_events'
        result = ActiveRecord::Base.connection.execute("SELECT max(id) FROM #{table}")
        ai_val = result.fetch.first.to_i + 1
        puts "Resetting auto increment ID for #{table} to #{ai_val}"
        ActiveRecord::Base.connection.execute("ALTER SEQUENCE #{table}_SEQ INCREMENT BY #{ai_val}")
      end
    end
  end
end
