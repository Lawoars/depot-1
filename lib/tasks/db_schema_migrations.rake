namespace :db do
  desc "Эта задача выводит применённые версии миграции"
  task :schema_migrations => :environment do
    puts ActiveRecord::Base.connection.select_values('SELECT * FROM schema_migrations ORDER BY version')
  end
end